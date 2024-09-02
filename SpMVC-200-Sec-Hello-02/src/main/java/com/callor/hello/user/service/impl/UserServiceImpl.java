package com.callor.hello.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.callor.hello.dao.RoleDao;
import com.callor.hello.dao.UserDao;
import com.callor.hello.models.UserVO;
import com.callor.hello.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final UserDao userDao;
	private final RoleDao roleDao;

	public UserServiceImpl(UserDao userDao, RoleDao roleDao) {
		super();
		this.userDao = userDao;
		this.roleDao = roleDao;
	}

	@Autowired
	public void creat_table() {

		try {
			userDao.create_user_table(null);
			roleDao.create_role_table(null);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public UserVO createUser(UserVO userVO) {
		return null;
	}

	@Override
	public UserVO findByUser(String username) {
		return null;
	}

}
