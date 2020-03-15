package com.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PageBean {
	//起名叫做commap：controller里的map
	public static void conMap(Map<String,Object> map,int pages,int num,HttpServletRequest request,Object clazz){
		String name = clazz.getClass().getSimpleName().toLowerCase();//变成小写
		//map.put("user", clazz);变成下面的
		map.put(name, clazz);		
		map.put("pages", pages);
		map.put("num", num);
		map.put("beg", (pages-1)*num);//第一页从0开始，第二页从5开始
		map.put("url", request.getServletPath().substring(1));//substring从第一个字符开始街取，目的是把第一个/去掉
	}
	
	
	//Class<?> clazz这个操作是可以传递任意类,注意，是“类”，不是对象，因为没法传递USER类
	public static void serMap(Map<String,Object> map,int count,List<?> list,Class<?> clazz){
		String name = clazz.getSimpleName().toLowerCase();
		int num = Integer.parseInt(map.get("num").toString());//这个num是定好的，每页显示多少条
		int sumPage = (count%num==0)?(count/num):(count/num+1);
		map.put(name+"List", list);
		map.put("count", count);//放到map里传给前台
		map.put("sumPage", sumPage);
	}
}
