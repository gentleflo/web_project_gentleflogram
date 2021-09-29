package com.gentleflo.gentleflogram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface LikeDAO {
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deleteLikeByUserIdPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectLikeListByUserIdPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectLikeCountByPostId(@Param("postId") int postId);
	
}
