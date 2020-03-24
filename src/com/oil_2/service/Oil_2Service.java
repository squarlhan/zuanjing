package com.oil_2.service;

import java.util.Map;

import com.oil_2.model.Oil_2;

public interface Oil_2Service {

		//map层需要oil_2，所以最好写个oil_2
		
		 Map<String,Object> oil_2List(Map<String,Object> map);
		 Map<String,Object> oil_2Add(Oil_2 oil_2,Map<String,Object> map);

		 Oil_2 oil_2Load(Double time);
		 Oil_2 oil_2Load2(Integer time);

		 Map<String,Object> oil_2Mdi(Oil_2 oil_2,Map<String,Object> map);
		 Map<String,Object> oil_2Del(Double time,Map<String,Object> map);

		 	//查1条
		 Map<String,Object> oil_2Table(Double time);
		 	//获取最新一条数据
		 Oil_2 oil_2New();
}
