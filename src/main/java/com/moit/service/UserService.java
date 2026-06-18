package com.moit.service;

import com.moit.dto.AuthDto;
import com.moit.dto.AuthUserDto;
import com.moit.dto.UserDto;

public interface UserService {

	public     AuthUserDto    readAuth( String email );
//	
//	
//	public int      	 insert(UserDto dto);  // 회원가입 + 권한추가
//	public UserDto   findByLoginId( String loginId); // 아이디 중복검사
//	public UserDto  findByNickname(   String nickname); // 닉네임 중복검사
//	public  int          insertAuth(AuthDto  dto); 
//	
//	/* security login */
//	public UserDto  findByEmailUserInfo(   String email);
	
	
}

