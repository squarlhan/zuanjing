package com.role.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.PageBean;
import com.role.mapper.RoleMapper;
import com.role.model.Role;
import com.role.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	
	
	@Override
	public Map<String, Object> roleList(Map<String, Object> map) {
		List<Role> roleList = roleMapper.roleList(map);//查集合
		int count = roleMapper.count(map);//一共多少条
		PageBean.serMap(map, count, roleList, Role.class);
		return map;
	}


	@Override
	public Map<String, Object> roleAdd(Role role, Map<String, Object> map) {
		int result = roleMapper.add(role);
		if(result>0){
			map.put("message", "添加成功");
		}else{
			map.put("message", "添加失败");
		}
		return map;
	}


	@Override
	public Role load(Integer role_id) {
		return roleMapper.load(role_id);
	}


	@Override
	public Map<String, Object> roleMdi(Role role, Map<String, Object> map) {
		int result = roleMapper.update(role);
		if(result>0){
			map.put("message", "修改成功");
		}else{
			map.put("message", "修改失败");
		}
		return map;
	}


	@Override
	public Map<String, Object> roleDel(Integer role_id, Map<String, Object> map) {
		int result = roleMapper.delete(role_id);
		if(result>0){
			map.put("message", "删除成功");
		}else{
			map.put("message", "删除失败");
		}
		return map;
	}


	@Override
	public List<Role> roleAllList() {
		return roleMapper.roleAllList();
	}

}
