package com.gentleflo.gentleflogram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gentleflo.gentleflogram.comment.bo.CommentBO;
import com.gentleflo.gentleflogram.comment.model.Comment;
import com.gentleflo.gentleflogram.common.FileManagerService;
import com.gentleflo.gentleflogram.post.dao.PostDAO;
import com.gentleflo.gentleflogram.post.model.Post;
import com.gentleflo.gentleflogram.post.model.PostDetail;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private CommentBO commentBO;
	
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userLoginId, content, filePath);
	}
	
	public List<PostDetail> getTimeLineList(){
		
		List<Post> postList = postDAO.selectTimeLineList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		// 포스트 하나당 댓글 가져오기 
		for(Post post : postList) {
			// 해당하는 포스트의 댓글 가져오기
			List<Comment> commentList = commentBO.getCommentListById(post.getId());
			
			// post와 댓글이 매칭
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// BO에서는 BO만 호출해주는 것이 좋다. 다른 속성의 클래스를 호출할때는 (ex. PostBO 일때 PostDAO 가져오는 경우만-)
}
