package com.gentleflo.gentleflogram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	public int insertUser(
			@Param("email") String email
			, @Param("loginId") String loginId
			, @Param("name") String name
			, @Param("password") String password);
}
