package com.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
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
import com.user.model.User;
import com.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping("/back/userList")                          //可以不传，没有传值时默认为1
	public String userList(Map<String,Object> map,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int num,User user,HttpServletRequest request){//可以往前台传值,page是当前第几页
		//这里的代码被封装到pagebean里去了
		PageBean.conMap(map, pages, num, request, user);
		userService.userList(map);
		return "back/user/userList";
	}
	@RequestMapping("/back/userAdd")
	public String userAdd(Map<String,Object> map){
		List<Role> roleAllList = roleService.roleAllList();
		map.put("roleAllList", roleAllList);
		return "back/user/userAdd";
	}
	
	
	@RequestMapping("/back/userMdi")
	public String userMdi(Integer user_id,Map<String,Object> map){
		User user = userService.load(user_id);
		map.put("user", user);
		return "back/user/userMdi";
	}
	
	@RequestMapping("/back/userAddDo")
	public String userAddDo(User user,MultipartFile photo,Map<String,Object> map) throws IllegalStateException, IOException{
		if(photo!=null&&photo.getOriginalFilename()!=null&&photo.getOriginalFilename()!=""){
			String path = "D:\\STSWorkspace\\ssm\\WebContent\\upload";
			//String path = "G:\\ProjectPhoto";
			//---------------2获取文件名
			String realName = photo.getOriginalFilename();
			//---------------3获取后缀
			String ext = FilenameUtils.getExtension(realName);
			//---------------4生成新的文件名
			String newName = UUID.randomUUID().toString().replace("-","")+"."+ext;
			//---------------5建立一个空文件
			File file = new File(path+"/"+newName);
			//---------------6将文件写入空文件
			photo.transferTo(file);	
			//写到user类里
			user.setUser_img(newName);
		}
		userService.userAdd(user, map);//往前端传值，传map
		return "back/main/message";
	}

	@RequestMapping("/back/userMdiDo")
	public String userMdiDo(User user,MultipartFile photo,Map<String,Object> map) throws IllegalStateException, IOException{
		if(photo!=null&&photo.getOriginalFilename()!=null&&photo.getOriginalFilename()!=""){
			String path = "D:\\STSWorkspace\\ssm\\WebContent\\upload";
			//String path = "G:\\ProjectPhoto";
			//---------------2获取文件名
			String realName = photo.getOriginalFilename();
			//---------------3获取后缀
			String ext = FilenameUtils.getExtension(realName);
			//---------------4生成新的文件名
			String newName = UUID.randomUUID().toString().replace("-","")+"."+ext;
			//---------------5建立一个空文件
			File file = new File(path+"/"+newName);
			//---------------6将文件写入空文件
			photo.transferTo(file);	
			//写到user类里
			user.setUser_img(newName);
		}
		userService.userMdi(user, map);//往前端传值，传map
		return "back/main/message";
	}
	@RequestMapping("/back/userDel")
	public String userDel(Integer user_id,Map<String,Object> map){
		map.put("user_id", user_id);
		return "back/user/userDel";
	}
	@RequestMapping("/back/userDelDo")
	public String userDelDo(Integer user_id,Map<String,Object> map){
		userService.userDel(user_id, map);
		return "back/main/message";
	}
	
}
