package com.gentleflo.gentleflogram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gentleflo.gentleflogram.common.EncryptUtils;
import com.gentleflo.gentleflogram.user.dao.UserDAO;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String email, String loginId, String name, String password) {
		// password 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(email, loginId, name, encryptPassword);
	}
}
