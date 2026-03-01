package com.rain.service;

import com.rain.entity.ForumPost;
import com.rain.entity.ForumPostComment;
import com.rain.mapper.ForumMapper;

import java.sql.SQLException;
import java.util.List;

public class ForumService {
    private ForumMapper forumMapper = new ForumMapper();

    public List<ForumPost> findByPage(Integer currentUserId,String title,
                                      String keywords,String publisher,String orderBy,
                                      Integer pageNum,Integer pageSize){
        return forumMapper.findByPage(currentUserId,title,keywords,publisher,orderBy,pageNum,pageSize);
    }

    public Integer findForumCount(Integer currentUserId,String title,
                                  String keywords,String publisher,String orderBy){
        return forumMapper.findForumCount(currentUserId, title, keywords, publisher, orderBy);
    }

    public void createForumPost(ForumPost forumPost) throws SQLException {
        forumMapper.createForumPost(forumPost);
    }

    public ForumPost findDetailById(Integer id) throws SQLException {
        return forumMapper.findDetailById(id);
    }

    public List<ForumPostComment> findCommentListByPid(Integer pid) throws SQLException {
        return forumMapper.findCommentListByPid(pid);
    }

    public boolean checkPostIsLike(Integer pid,Integer userId) throws SQLException {
        return forumMapper.checkPostIsLike(pid, userId);
    }

    public void toggleLike(Integer postId,Integer userId,Boolean isLiked) throws SQLException {
        if(Boolean.TRUE.equals(isLiked)){
            if(!forumMapper.checkPostIsLike(postId,userId)){
                forumMapper.addLike(postId,userId);
            }
        } else {
            forumMapper.cancelLike(postId,userId);
        }
    }
}
