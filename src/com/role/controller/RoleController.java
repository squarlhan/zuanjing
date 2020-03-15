package com.role.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.PageBean;
import com.role.model.Role;
import com.role.service.RoleService;

@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping("/back/roleList")                          //可以不传，没有传值时默认为1
	public String roleList(Map<String,Object> map,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int num,Role role,HttpServletRequest request){//可以往前台传值,page是当前第几页
		//这里的代码被封装到pagebean里去了
		PageBean.conMap(map, pages, num, request, role);
		roleService.roleList(map);
		return "back/role/roleList";
	}
	@RequestMapping("/back/roleAdd")
	public String roleAdd(){
		return "back/role/roleAdd";
	}
	@RequestMapping("/back/roleAddDo")
	public String roleAddDo(Role role,Map<String,Object> map) throws IllegalStateException, IOException{
		
		roleService.roleAdd(role, map);//往前端传值，传map
		return "back/main/message";
	}
	@RequestMapping("/back/roleMdi")
	public String roleMdi(Integer role_id,Map<String,Object> map){
		Role role = roleService.load(role_id);
		map.put("role", role);
		return "back/role/roleMdi";
	}
	@RequestMapping("/back/roleMdiDo")
	public String roleMdiDo(Role role,Map<String,Object> map) throws IllegalStateException, IOException{
		
		roleService.roleMdi(role, map);//往前端传值，传map
		return "back/main/message";
	}
	@RequestMapping("/back/roleDel")
	public String roleDel(Integer role_id,Map<String,Object> map){
		map.put("role_id", role_id);
		return "back/role/roleDel";
	}
	@RequestMapping("/back/roleDelDo")
	public String roleDelDo(Integer role_id,Map<String,Object> map){
		roleService.roleDel(role_id, map);
		return "back/main/message";
	}
	
}
