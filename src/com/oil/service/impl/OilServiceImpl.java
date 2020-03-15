package com.oil.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.PageBean;
import com.oil.mapper.OilMapper;
import com.oil.model.Oil;
import com.oil.service.OilService;

@Service
public class OilServiceImpl implements OilService {
	@Autowired
	private OilMapper oilMapper;

	@Override
	public Map<String, Object> oilList(Map<String, Object> map) {
		List<Oil> oilList = oilMapper.oilList(map);//查集合
		int count = oilMapper.count(map).intValue();//一共有多少条
		PageBean.serMap(map, count, oilList, Oil.class);
		return map;
	}//查数据列表

	@Override
	public Map<String, Object> oilAdd(Oil oil, Map<String, Object> map) {
		return null;//添加，暂且用不到
	}

	@Override
	public Oil oilLoad(Double time) {
		return oilMapper.load(time);//查一条数据
	}

	@Override
	public Map<String, Object> oilMdi(Oil oil, Map<String, Object> map) {
		return null;//修改，暂且用不到
	}
	
	@Override
	public Map<String, Object> oilDel(Double time, Map<String, Object> map) {
		return null;//删除，暂且用不到
	}



	
	
	
}
