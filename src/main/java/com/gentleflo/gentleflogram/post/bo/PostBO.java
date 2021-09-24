package com.gentleflo.gentleflogram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gentleflo.gentleflogram.common.FileManagerService;
import com.gentleflo.gentleflogram.post.dao.PostDAO;
import com.gentleflo.gentleflogram.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userLoginId, content, filePath);
	}
	
	public List<Post> getTimeLineList(){
		return postDAO.selectTimeLineList();
	}
	
	public int addComment(int userId, int postId, String loginId, String commentContent) {
		return postDAO.insertComment(userId, postId, loginId, commentContent);
	}
}
