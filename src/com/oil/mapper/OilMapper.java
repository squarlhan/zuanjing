
package com.oil.mapper;

import java.util.List;
import java.util.Map;

import com.oil.model.Oil;

public interface OilMapper {

    Integer delete(Double time);

    Integer add(Oil oil);

    Oil load(Double time);

    Integer update(Oil oil);
    //查询石油数据列表(根据起止时间查询）
    List<Oil> oilList(Map<String,Object> map);
    //查询数量
    Integer count(Map<String,Object> map);
}