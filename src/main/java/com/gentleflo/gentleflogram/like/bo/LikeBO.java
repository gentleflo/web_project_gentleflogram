package com.gentleflo.gentleflogram.like.bo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.gentleflogram.like.dao.LikeDAO;


@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	// postId와 userId에 해당하는 좋아요 가져오기
	public int getLikeListByUserIdPostId(int userId, int postId) {
		return likeDAO.selectLikeListByUserIdPostId(userId, postId);
	}
	
	// postId에 해당하는 좋아요 가져오기
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostId(postId);
	}
}
