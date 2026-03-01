package com.rain.entity;


import java.time.LocalDateTime;

/**
 * 论坛帖子评论实体类
 */

public class ForumPostComment {

    /**
     * 主键ID
     */

    private Long id;

    /**
     * 帖子ID
     */
    private Long postId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评论者ID
     */
    private Long userId;

    /**
     * 评论者用户名
     */
    private String username;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    public ForumPostComment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
}

