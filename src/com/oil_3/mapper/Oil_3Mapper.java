
package com.oil_3.mapper;



import com.oil_3.model.Oil_3;

public interface Oil_3Mapper {

    int add(Oil_3 oil_3);
    
	Oil_3 load(Double time);
	 
	Oil_3 load2(Integer time);
	
 	//获取最新一条数据
	Oil_3 getNew();
	
	Oil_3 byId(Double id);
}