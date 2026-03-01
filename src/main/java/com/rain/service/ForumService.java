package com.rain.service;

import com.rain.entity.ForumPost;
import com.rain.entity.ForumPostComment;
import com.rain.mapper.ForumMapper;

import java.sql.SQLException;
import java.util.List;

public class ForumService {
    private ForumMapper forumMapper = new ForumMapper();

    //分页查询所有论坛帖子数据
    public List<ForumPost> findByPage(Integer currentUserId,String title,
                                      String keywords,String publisher,String orderBy,
                                      Integer pageNum,Integer pageSize){
        return forumMapper.findByPage(currentUserId,title,keywords,publisher,orderBy,pageNum,pageSize);

    }

    //分页展示的总数据量
    public Integer findForumCount(Integer currentUserId,String title,
                                  String keywords,String publisher,String orderBy){
        return forumMapper.findForumCount(currentUserId, title, keywords, publisher, orderBy);
    }

    // 发布论坛列子
    public void createForumPost(ForumPost forumPost) throws SQLException {
        forumMapper.createForumPost(forumPost);
    }

    // 根据帖子id查看帖子详情
    public ForumPost findDetailById(Integer id) throws SQLException {
        return forumMapper.findDetailById(id);
    }

    // 根据帖子id查看对应的评论列表数据
    public List<ForumPostComment> findCommentListByPid(Integer pid) throws SQLException {
        return forumMapper.findCommentListByPid(pid);
    }

    // 根据用户id和帖子id检查是否点赞
    public boolean checkPostIsLike(Integer pid,Integer userId) throws SQLException {
        return forumMapper.checkPostIsLike(pid, userId);
    }
}
