package com.gentleflo.gentleflogram.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.gentleflogram.comment.dao.CommentDAO;
import com.gentleflo.gentleflogram.comment.model.Comment;


@Service
public class CommentBO {
	@Autowired 
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String loginId, String commentContent) {
		return commentDAO.insertComment(userId, postId, loginId, commentContent);
	}
	
	// postId에 해당하는 댓글 가져오기
	public List<Comment> getCommentListById(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	// 댓글 지우기
	public int deleteComment(int postId, int userId) {
		return commentDAO.deleteCommentByPostIdUserId(postId, userId);
	}
}
