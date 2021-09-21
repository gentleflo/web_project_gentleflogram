package com.gentleflo.gentleflogram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gentleflo.gentleflogram.common.FileManagerService;
import com.gentleflo.gentleflogram.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		if(filePath == null) {
			return -1;
		}
		return postDAO.insertPost(userId, userName, content, filePath);
	}
}
