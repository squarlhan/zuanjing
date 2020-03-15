package com.oil_2.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.PageBean;
import com.oil.mapper.OilMapper;
import com.oil.model.Oil;
import com.oil_2.mapper.Oil_2Mapper;
import com.oil_2.model.Oil_2;
import com.oil_2.service.Oil_2Service;

@Service
public class Oil_2ServiceImpl implements Oil_2Service {

	@Autowired
	private Oil_2Mapper oil_2Mapper;

	
	@Override
	public Map<String, Object> oil_2List(Map<String, Object> map) {
		List<Oil_2> oil_2List = oil_2Mapper.oil_2List(map);//查集合
		int count = oil_2Mapper.count(map).intValue();//一共有多少条
		PageBean.serMap(map, count, oil_2List, Oil_2.class);
		return map;
	}//查数据列表

	//编到这里发现得用load，线不往下编了
	@Override
	public Map<String, Object> oil_2Table(Double time) {
		List<Oil_2> oil_2List = oil_2Mapper.oil_2Table(time);
		return null;
	
	}
	
	@Override
	public Map<String, Object> oil_2Add(Oil_2 oil_2, Map<String, Object> map) {
		// 暂时不用
		return null;
	}

	@Override
	public Oil_2 oil_2Load(Double time) {
		return oil_2Mapper.load(time);
	}

	@Override
	public Oil_2 oil_2Load2(Integer time) {
		// TODO Auto-generated method stub
		return oil_2Mapper.load2(time);
	}

	@Override
	public Map<String, Object> oil_2Mdi(Oil_2 oil_2, Map<String, Object> map) {
		return null;
	}

	@Override
	public Map<String, Object> oil_2Del(Double time, Map<String, Object> map) {
		return null;
	}


	

}
