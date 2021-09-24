package com.gentleflo.gentleflogram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.gentleflo.gentleflogram.post.model.Post;

@Repository
public interface PostDAO {
	public int insertPost(
			@Param("userId") int userId
			, @Param("userLoginId") String userLoginId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectTimeLineList();
	
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("loginId") String loginId
			, @Param("commentContent") String commentContent);
}
