package com.gentleflo.gentleflogram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gentleflo.gentleflogram.comment.bo.CommentBO;
import com.gentleflo.gentleflogram.comment.model.Comment;
import com.gentleflo.gentleflogram.common.FileManagerService;
import com.gentleflo.gentleflogram.like.bo.LikeBO;
import com.gentleflo.gentleflogram.post.dao.PostDAO;
import com.gentleflo.gentleflogram.post.model.Post;
import com.gentleflo.gentleflogram.post.model.PostDetail;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;
	
	
	// 게시글 올리기
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userLoginId, content, filePath);
	}
	
	
	// 타임라인에 게시글(post)리스트 DB에서 빼오고 
	// 또 각 게시글(postId)에 맞는 댓글들도 각각 꼿아줌
	// 좋아요 또한 userId와 postId를 통해 해당하는 게시글에 좋아요를 가지고 옴
	// 이 세가지 기능을 하는 메소드를 한 클래스 안에 만들어서 묶어놓은 클래스가 postDetail
	public List<PostDetail> getTimeLineList(int userId){
		List<Post> postList = postDAO.selectTimeLineList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		// 포스트 하나당 댓글 가져오기 
		for(Post post : postList) {
			// 해당하는 포스트의 댓글 가져오기7
			List<Comment> commentList = commentBO.getCommentListById(post.getId());
			// 해당하는 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
			boolean isLike = likeBO.getLikeListByUserIdPostId(userId, post.getId());
			// 해당하는 포스트의 좋아요 갯수 가져오기
			int countLike = likeBO.getLikeCountByPostId(post.getId());
			
			PostDetail postDetail = new PostDetail();
			// post와 댓글 매칭
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			// 해당하는 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
			postDetail.setLike(isLike);
			// 해당하는 포스트의 좋아요 갯수 가져오기
			postDetail.setCountLike(countLike);
			
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
	// BO에서는 BO만 호출해주는 것이 좋다. 다른 속성의 클래스를 호출할때는 (ex. PostBO 일때 PostDAO 가져오는 경우만-)
	
	public Post getPost(int postId, int userId) {
		return postDAO.selectPost(postId, userId);
	}
	
	// post 삭제하기
	public int deletePost(int postId, int userId) {
		Post post = this.getPost(postId, userId);
		if(post.getImagePath() != null) {
			FileManagerService.removeFile(post.getImagePath());
		}
		commentBO.deleteComment(postId, userId);
		likeBO.deleteLike(userId, postId);
		return postDAO.deletePostByPostIdUserId(postId, userId);
	}
}
