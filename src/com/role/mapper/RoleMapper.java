

package com.role.mapper;

import java.util.List;
import java.util.Map;

import com.role.model.Role;
import com.role.model.Role;

public interface RoleMapper {

    int delete(Integer role_id);

    int add(Role role);

    Role load(Integer role_id);

    int update(Role role);
    
    //查询角色列表
    List<Role> roleList(Map<String,Object> map);
    //查询数量
    int count(Map<String,Object> map);
    
    List<Role> roleAllList();

}