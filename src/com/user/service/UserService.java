package com.user.service;

import java.util.Map;

import com.user.model.User;

public interface UserService {
	Map<String,Object> userList(Map<String,Object> map);
	Map<String,Object> userAdd(User user,Map<String,Object> map);//map层需要user，所以最好写个user
   
	User load(Integer user_id);
	
    Map<String,Object> userMdi(User user,Map<String,Object> map);//map层需要user，所以最好写个user
	Map<String,Object> userDel(Integer user_id,Map<String,Object> map);//map层需要user，所以最好写个user


}
