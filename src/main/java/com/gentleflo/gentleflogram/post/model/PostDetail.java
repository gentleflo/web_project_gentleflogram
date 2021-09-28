package com.gentleflo.gentleflogram.post.model;

import java.util.List;
import com.gentleflo.gentleflogram.comment.model.Comment;

public class PostDetail {
	private Post post;
	private List<Comment> commentList;
	private boolean like;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public boolean isLike() {
		return like;
	}
	public void setLike(boolean like) {
		this.like = like;
	}
	
	
	
	
}
