package com.moit.dao;
import com.moit.dto.AuthDto;
import com.moit.dto.AuthUserDto;
import com.moit.dto.UserDto;

@Mapper
public interface UserMapper { 

	public     AuthUserDto    readAuth(String email);
	
	public  int          insertAuth(AuthDto  dto); 
	public int      	 insert(UserDto dto);  

	public UserDto   findByEmail( String email);
	public UserDto  findByEmailUserInfo(   String email);
	public UserDto  findByNickname(   String nickname);
}


