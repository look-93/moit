package com.moit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.moit.dao.UserMapper;
import com.moit.dto.AuthUserDto;
 
public class CustomUserDetailsService   implements UserDetailsService{

	@Autowired  UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		AuthUserDto  dto = mapper.readAuth(username);  // email, bpass, auth(s)
		
		return  dto == null?  null : new CustomUser(dto);
	}

}
