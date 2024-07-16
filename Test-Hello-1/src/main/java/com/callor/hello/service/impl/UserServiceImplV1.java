package com.callor.hello.service.impl;

import com.callor.hello.models.UserVO;
import com.callor.hello.service.UserService;

public class UserServiceImplV1 implements UserService {

	@Override
	public UserVO getUser() {
		UserVO userVo = new UserVO();
		return userVo;
	}

}
