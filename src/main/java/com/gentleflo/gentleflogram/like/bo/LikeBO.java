package com.gentleflo.gentleflogram.like.bo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.gentleflogram.like.dao.LikeDAO;


@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public boolean like(int userId, int postId) {
		// 좋아요 상태이면 좋아요 취소
		if(this.getLikeListByUserIdPostId(userId, postId)) {
			int count = likeDAO.deleteLikeByUserIdPostId(userId, postId);
			if(count == 0) {
				return false;
			} else {
				return true;
			}
		} else {   // 좋아요 취소 상태이면 좋아요
			int count = likeDAO.insertLike(userId, postId);
			if(count == 1) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	// postId와 userId로 좋아요 여부 확인 후 삭제
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLikeByUserIdPostId(userId, postId);
	} 
	
	// postId와 userId로 좋아요 여부 확인
	public boolean getLikeListByUserIdPostId(int userId, int postId) {
		int count =  likeDAO.selectLikeListByUserIdPostId(userId, postId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// postId에 해당하는 좋아요 갯수 가져오기
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostId(postId);
	}
	
	// 게시글 아예 지울때 postId 기준으로만 삭제
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	} 
	
}
