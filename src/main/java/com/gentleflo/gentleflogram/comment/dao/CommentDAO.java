package com.gentleflo.gentleflogram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.gentleflogram.comment.model.Comment;

@Repository
public interface CommentDAO {
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("loginId") String loginId
			, @Param("commentContent") String commentContent);
	
	public List<Comment> selectCommentListByPostId(int postId);
	
	public int deleteCommentByPostIdUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
}