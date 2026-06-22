package com.moit.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.moit.dto.AuthUserDto;

import lombok.Getter;

@Getter 
public class CustomUser extends User{  
	private static final long serialVersionUID = 1L; 
 
	AuthUserDto  dto;
	
	//1.�������̵�� ��й�ȣ�� �޾Ƽ� ������ �ִ��� üũ
	public CustomUser(String username, 
				      String password, 
				      Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities); 
	}

	//2. username, password�� �°� ����
    public CustomUser(AuthUserDto  dto) {
    	super(  dto.getEmail() , dto.getBpass() 
    						   , dto.getAuthList()
    						        .stream()
    						        .map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
    						        .collect(Collectors.toList()));
    	this.dto = dto;
    } 
    
}




