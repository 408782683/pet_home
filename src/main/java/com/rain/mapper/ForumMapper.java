package com.rain.mapper;

import com.rain.entity.ForumPost;
import com.rain.entity.ForumPostComment;
import com.rain.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ForumMapper {

    // 查询总数据量
    public Integer findForumCount(Integer currentUserId, String title,
                                  String keywords, String publisher, String orderBy) {

        String sql = "select count(*) as num from forum_post where 1=1 ";
        List<Object> params = new ArrayList<>();

        if (title != null && !title.isEmpty()) {
            sql += " and title like ? ";
            params.add("%" + title + "%");
        }

        if (keywords != null && !keywords.isEmpty()) {
            sql += " and keywords like ? ";
            params.add("%" + keywords + "%");
        }

        if (publisher != null) {
            if (publisher.equals("my")) {
                sql += " and user_id = ? ";
                params.add(currentUserId);
            } else if (publisher.equals("other")) {
                sql += " and user_id != ? ";
                params.add(currentUserId);
            }
        }

        // ⚠ count 查询不需要 order by

        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("num");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    // 分页查询
    public List<ForumPost> findByPage(Integer currentUserId, String title,
                                      String keywords, String publisher, String orderBy,
                                      Integer pageNum, Integer pageSize) {

        String sql = "select * from forum_post where 1=1 ";
        List<Object> params = new ArrayList<>();

        if (title != null && !title.isEmpty()) {
            sql += " and title like ? ";
            params.add("%" + title + "%");
        }

        if (keywords != null && !keywords.isEmpty()) {
            sql += " and keywords like ? ";
            params.add("%" + keywords + "%");
        }

        if (publisher != null) {
            if (publisher.equals("my")) {
                sql += " and user_id = ? ";
                params.add(currentUserId);
            } else if (publisher.equals("other")) {
                sql += " and user_id != ? ";
                params.add(currentUserId);
            }
        }

        // 正确拼接 order by
        if (orderBy != null) {
            if (orderBy.equals("like")) {
                sql += " order by like_count desc ";
            } else if (orderBy.equals("comment")) {
                sql += " order by comment_count desc ";
            }
        }

        sql += " limit ?, ? ";
        params.add((pageNum - 1) * pageSize);
        params.add(pageSize);

        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            List<ForumPost> forumPostList = new ArrayList<>();

            while (rs.next()) {
                ForumPost forumPost = new ForumPost();
                forumPost.setId(rs.getInt("id"));
                forumPost.setTitle(rs.getString("title"));
                forumPost.setDescription(rs.getString("description"));
                forumPost.setContent(rs.getString("content"));
                forumPost.setImages(rs.getString("images"));
                forumPost.setKeywords(rs.getString("keywords"));
                forumPost.setUserId(rs.getInt("user_id"));
                forumPost.setLikeCount(rs.getInt("like_count"));
                forumPost.setCommentCount(rs.getInt("comment_count"));
                forumPost.setCreateTime(rs.getTimestamp("create_time").toLocalDateTime());

                forumPostList.add(forumPost);
            }

            return forumPostList;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    // 发布论坛帖子
    public void createForumPost(ForumPost forumPost) throws SQLException {
        String sql = "INSERT INTO forum_post(title,description," +
                " content,images,keywords,user_id,username," +
                " like_count,comment_count,create_time)" +
                " VALUES(?,?,?,?,?,?,?,0,0,NOW())";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setString(1,forumPost.getTitle());
            pstmt.setString(2,forumPost.getDescription());
            pstmt.setString(3,forumPost.getContent());
            pstmt.setString(4,forumPost.getImages());
            pstmt.setString(5,forumPost.getKeywords());
            pstmt.setInt(6,forumPost.getUserId());
            pstmt.setString(7,forumPost.getUsername());
            //执行sql
            pstmt.executeUpdate();
        }
    }

    //根据帖子的id查看帖子详情
    public ForumPost findDetailById(Integer id) throws SQLException {
        String sql = "select * from forum_post where id = ?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setInt(1,id);
            //执行查询
            ResultSet rs = pstmt.executeQuery();
            //处理结果集
            while (rs.next()){
                //创建一个帖子对象
                ForumPost forumPost = new ForumPost();
                forumPost.setId(rs.getInt("id"));
                forumPost.setTitle(rs.getString("title"));
                forumPost.setDescription(rs.getString("description"));
                forumPost.setContent(rs.getString("content"));
                forumPost.setImages(rs.getString("images"));
                forumPost.setKeywords(rs.getString("keywords"));
                forumPost.setUserId(rs.getInt("user_id"));
                forumPost.setUsername(rs.getString("username"));
                forumPost.setLikeCount(rs.getInt("like_count"));
                forumPost.setCommentCount(rs.getInt("comment_count"));
                forumPost.setCreateTime(rs.getTimestamp("create_time").toLocalDateTime());
                //返回
                return forumPost;
            }
            return null;
        }
    }

    // 根据帖子id查询对应的评论列表数据
    public List<ForumPostComment> findCommentListByPid(Integer postId) throws SQLException {
        String sql = "select * from forum_post_comment where post_id = ?";
        try(Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            //处理参数
            pstmt.setInt(1,postId);
            //执行sql查询
            ResultSet rs = pstmt.executeQuery();
            //创建集合来存储我们的评论列表数据
            List<ForumPostComment> forumPostComments = new ArrayList<>();
            while (rs.next()){
                // 创建一个ForumPostComment对象
                ForumPostComment forumPostComment = new ForumPostComment();
                forumPostComment.setId(rs.getLong("id"));
                forumPostComment.setPostId(rs.getLong("post_id"));
                forumPostComment.setContent(rs.getString("content"));
                forumPostComment.setUserId(rs.getLong("user_id"));
                forumPostComment.setUsername(rs.getString("username"));
                forumPostComment.setCreateTime(rs.getTimestamp("create_time").toLocalDateTime());
                //存入集合
                forumPostComments.add(forumPostComment);
            }
            //返回集合
            return forumPostComments;
        }
    }

    // 根据用户id和帖子id检查当前帖子是否点赞过
    public boolean checkPostIsLike(Integer pid,Integer userId) throws SQLException {
        String sql = "select * from forum_post_like where post_id = ? and user_id = ?";
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            //处理参数
            pstmt.setInt(1,pid);
            pstmt.setInt(2,userId);
            //执行sql
            ResultSet rs = pstmt.executeQuery();
            //返回结果
            return rs.next();
        }
    }
}