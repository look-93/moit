package com.moit.service;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.moit.dao.UserMapper;
import com.moit.dto.AuthDto;
import com.moit.dto.AuthUserDto;
import com.moit.dto.UserDto;

@Service
public class UserServiceImpl  implements UserService{
 
	@Autowired  UserMapper dao;
	@Autowired  @Qualifier("passwordEncoder") PasswordEncoder  pwencoder;
//	//import org.springframework.security.crypto.password.PasswordEncoder;
//	
	@Override public AuthUserDto readAuth(String email) { return dao.readAuth(email); }
//
//	@Override
//	public int insert(UserDto dto) {
//		AuthDto adto = new AuthDto();
//		adto.setLoginId(dto.getLoginId());
//		adto.setAuth("ROLE_MEMBER");
//		//dao.insertAuth(adto);
//		
//		dto.setPassword(pwencoder.encode(dto.getPassword()));
//		
//		return dao.insert(dto);
//	}
//
//	@Override
//	public UserDto findByLoginId(String loginId) {
//		return dao.findByLoginId(loginId);
//	}
//
//	@Override
//	public UserDto findByEmailUserInfo(String email) {
//		return dao.findByEmailUserInfo(email);
//	}
//
//	@Override
//	public UserDto findByNickname(String nickname) {
//		return dao.findByNickname(nickname);
//	}
//
//	@Override
//	public int insertAuth(AuthDto dto) {
//		return 0;
//	}

	
	
}
