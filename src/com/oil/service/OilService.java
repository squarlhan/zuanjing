package com.oil.service;

import java.util.Map;

import com.oil.model.Oil;
import com.user.model.User;

public interface OilService {

	//map层需要oil，所以最好写个oil
	
	 Map<String,Object> oilList(Map<String,Object> map);
	 Map<String,Object> oilAdd(Oil oil,Map<String,Object> map);

	 Oil oilLoad(Double time);

	 Map<String,Object> oilMdi(Oil oil,Map<String,Object> map);
	 Map<String,Object> oilDel(Double time,Map<String,Object> map);

}
