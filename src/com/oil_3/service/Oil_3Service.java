package com.oil_3.service;

import java.util.Map;

import com.oil_3.model.Oil_3;

public interface Oil_3Service {
	 Map<String,Object> oil_3Add(Oil_3 oil_3,Map<String,Object> map);

	 Oil_3 oil_3Load(Double time);
	 Oil_3 oil_3Load2(Integer time);

		//获取最新一条数据
	 Oil_3 oil_3New();
	 
	 Oil_3 oil_3byId(Double id);

}
