package com.moit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.moit.dao.UserMapper;
import com.moit.dto.AuthUserDto;
import com.moit.service.UserService;
 
public class CustomUserDetailsService   implements UserDetailsService{

	@Autowired  UserService service;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		AuthUserDto  dto = service.readAuth(null);  // loginId, bpass, auth(s)
		
		return  dto == null?  null : new CustomUser(dto);
	}

}
