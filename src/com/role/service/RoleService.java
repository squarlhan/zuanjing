package com.role.service;

import java.util.List;
import java.util.Map;

import com.role.model.Role;

public interface RoleService {
	Map<String,Object> roleList(Map<String,Object> map);
	Map<String,Object> roleAdd(Role role,Map<String,Object> map);//map层需要role，所以最好写个role
    Role load(Integer role_id);
	Map<String,Object> roleMdi(Role role,Map<String,Object> map);//map层需要role，所以最好写个role
	Map<String,Object> roleDel(Integer role_id,Map<String,Object> map);//map层需要role，所以最好写个role
    List<Role> roleAllList();

}
