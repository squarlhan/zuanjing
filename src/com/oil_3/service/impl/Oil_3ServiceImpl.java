package com.oil_3.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oil_2.model.Oil_2;
import com.oil_3.mapper.Oil_3Mapper;
import com.oil_3.model.Oil_3;
import com.oil_3.service.Oil_3Service;

@Service
public class Oil_3ServiceImpl implements Oil_3Service {

	@Autowired
	private Oil_3Mapper oil_3Mapper;

	@Override
	public Map<String, Object> oil_3Add(Oil_3 oil_3, Map<String, Object> map) {
		return null;
	}

	@Override
	public Oil_3 oil_3Load(Double time) {
		return oil_3Mapper.load(time);
	}

	@Override
	public Oil_3 oil_3Load2(Integer time) {
		return oil_3Mapper.load2(time);
	}

	@Override
	public Oil_3 oil_3New() {
		// TODO Auto-generated method stub
		return oil_3Mapper.getNew();
	}

	@Override
	public Oil_3 oil_3byId(Double id) {
		return oil_3Mapper.byId(id);
	}
	


}
