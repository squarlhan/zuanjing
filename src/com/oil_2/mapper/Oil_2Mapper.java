package com.oil_2.mapper;

import java.util.List;
import java.util.Map;

import com.oil_2.model.Oil_2;

public interface Oil_2Mapper {
	 Integer delete(Double time);

	 Integer add(Oil_2 oil_2);

	 Oil_2 load(Double time);
	 
	 Oil_2 load2(Integer time);

	 Integer update(Oil_2 oil_2);
	    //查询石油数据列表(根据起止时间查询）
	 List<Oil_2> oil_2List(Map<String,Object> map);
	    //查询数量
	 Integer count(Map<String,Object> map);
	    //单独查询
	 List<Oil_2> oil_2Table(Double time);
}

