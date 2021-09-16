package com.gentleflo.gentleflogram.user.bo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.gentleflogram.common.EncryptUtils;
import com.gentleflo.gentleflogram.user.dao.UserDAO;
import com.gentleflo.gentleflogram.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int signUp(String email, String loginId, String name, String password) {
		// password 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP] 암호화 실패!!!!!!!!!");
			return 0;
		}
		
		return userDAO.insertUser(email, loginId, name, encryptPassword);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectById(loginId) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectByloginIdPassword(loginId, encryptPassword);
	}

}
