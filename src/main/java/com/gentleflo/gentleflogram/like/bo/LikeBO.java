package com.gentleflo.gentleflogram.like.bo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.gentleflogram.like.dao.LikeDAO;


@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		// 좋아요 상태이면 좋아요 취소
		
		// 좋아요 취소 상태이면 좋아요
		
		return likeDAO.insertLike(userId, postId);
	}
	
	// postId와 userId로 좋아요 여부 확인
	public int getLikeListByUserIdPostId(int userId, int postId) {
		return likeDAO.selectLikeListByUserIdPostId(userId, postId);
	}
	
	// postId에 해당하는 좋아요 갯수 가져오기
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostId(postId);
	}
	
	// postId와 userId로 좋아요 여부 확인 후 삭제
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLikeByUserIdPostId(userId, postId);
	}
}
