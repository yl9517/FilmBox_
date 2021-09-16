package com.film.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.UserDTO;
import com.film.mapper.UserMapper;


@Service
public class UserServiceImple implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public void insertUser(UserDTO dto) {
		
		int result=mapper.insertUser(dto);
		
	}

}