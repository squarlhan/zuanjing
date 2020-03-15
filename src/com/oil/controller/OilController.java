package com.oil.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.PageBean;
import com.oil.model.Oil;
import com.oil.service.OilService;
import com.role.service.RoleService;
import com.user.model.User;
import com.user.service.UserService;

@Controller
public class OilController {
	@Autowired
	private OilService oilService;//注解用于实例化
	
	@RequestMapping("back/oilMdi")
	public String update(Double time,Map<String,Object> map){//Spring只要放在了控制值的参数上，自动实例化。从前端接收到的数据作为形参。
		Oil oil = oilService.oilLoad(time);//传给Service，Service调用Mapper，Mapper与数据库交互。
		map.put("oil", oil);
		return "back/oil/oilMdi";
	}
	//这里是一个oilMdiDo的处理
	
	@RequestMapping("back/oilList")
	public String oilList(Map<String,Object> map,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int num,Oil oil,HttpServletRequest request){//可以往前台传值,page是当前第几页
		//这里的代码被封装到pagebean里去了
		//Controller里的形参Map可以向前台传值，map里的值前端能接到
		PageBean.conMap(map, pages, num, request, oil);
		oilService.oilList(map);
		return "back/oil/oilList";
	}

}



























