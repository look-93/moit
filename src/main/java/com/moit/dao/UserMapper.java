package com.moit.dao;
import com.moit.dto.AuthDto;
import com.moit.dto.AuthUserDto;
import com.moit.dto.UserDto;

@Mapper
public interface UserMapper { 

	//public  int          insertAuth(AuthDto  dto); 
	public int      insert(UserDto dto);
	public int      findLogin(UserDto dto);
	public UserDto  findByEmail( String email);	
	public UserDto  findByNickname(   String nickname);
	
	/* security */
	public     AuthUserDto    readAuth(String email);
	public UserDto  findByEmailUserInfo(   String email);
}


