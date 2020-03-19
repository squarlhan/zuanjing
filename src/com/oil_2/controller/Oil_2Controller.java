package com.oil_2.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.InvokePYModel;
import com.main.PageBean;
import com.main.Pmml;
import com.oil.model.Oil;
import com.oil_2.service.Oil_2Service;
import com.oil_3.model.Oil_3;
import com.oil_3.service.Oil_3Service;
import com.oil_2.model.Oil_2;

import org.dmg.pmml.FieldName;
import org.dmg.pmml.PMML;
import org.jpmml.evaluator.Evaluator;
import org.jpmml.evaluator.FieldValue;
import org.jpmml.evaluator.InputField;
import org.jpmml.evaluator.ModelEvaluator;
import org.jpmml.evaluator.ModelEvaluatorFactory;
import org.jpmml.evaluator.TargetField;
import org.jpmml.evaluator.ProbabilityDistribution;

@Controller
public class Oil_2Controller {
	@Autowired
	private Oil_2Service oil_2Service;//注解用于实例化
	private Oil_3Service oil_3Service;//测试数据库，用于读取数据
	
	Pmml pmml = new Pmml();
	
	@RequestMapping("back/oil_2Mdi")
	public String update(Double time,Map<String,Object> map){//Spring只要放在了控制值的参数上，自动实例化。从前端接收到的数据作为形参。
		Oil_2 oil_2 = oil_2Service.oil_2Load(time);//传给Service，Service调用Mapper，Mapper与数据库交互。
		map.put("oil_2", oil_2);
		return "back/oil_2/oil_2Mdi";
	}
	//这里是一个oilMdiDo的处理
	
	
	@RequestMapping("back/oil_2Table")
	public String oil_2Table(Integer oil_2_time,Map<String,Object> map) throws Exception{//可以往前台传值,page是当前第几页
	
		
		Oil_2 oil_2 = oil_2Service.oil_2Load2(oil_2_time);
	
		Map<String, Double>  map2 = pmml.InputMap(oil_2);//陈希模型传入
		int state_1 = Integer.parseInt(pmml.predictL(map2));//陈希模型预测（之后可以写成update，将预测的工况填写到state_1里）
		InvokePYModel invokePYModel = new InvokePYModel();
		int state_2 = invokePYModel.invokeModel();//-1异常，0正常，1复杂工况（目前只溢流）
		
		
		//
		map.put("oil_2", oil_2);
		map.put("pmml_state_1", state_1);
		map.put("invoke_state_2", state_2);
		
		
		System.out.println(oil_2_time);
		System.out.println(map);
		System.out.println("实际工况："+oil_2.getState_1()+"；state_1预测的工况："+state_1);
		System.out.println("state_2预测:"+state_2);
		return "back/main/table_demo";
	}
	
	

	@RequestMapping("back/oil_2_3Demo")
	public String Oil_2_3Demo(Integer oil_2time,Map<String,Object> map) throws NumberFormatException, Exception{
		
		
		//从3中读取1个
		Oil_3 oil_3 = oil_3Service.oil_3Load2(oil_2time);//这里应该无参数，做到定时读取下一条数据。
		//将3中读取的添加到2中
		oil_2Service.oil_2Add(oil_3, map);//存
		//读取新表中的刚刚存入的数据
		Oil_2 oil_2 = oil_2Service.oil_2Load2(oil_2time);
		
		//模型加载
		Map<String, Double>  map2 = pmml.InputMap(oil_2);//陈希模型传入
		int state_1 = Integer.parseInt(pmml.predictL(map2));//陈希模型预测（之后可以写成update，将预测的工况填写到state_1里）
		
		
		//前后端交互
		map.put("oil_2", oil_2);//传给前台的
		map.put("pmml_state_1", state_1);//传给前台的
		
		
		return"back/main/table_demo";
	}
	
	@RequestMapping("back/oil_2List")
	public String oil_2List(Map<String,Object> map,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int num,Oil_2 oil_2,HttpServletRequest request){//可以往前台传值,page是当前第几页
		//这里的代码被封装到pagebean里去了
		//Controller里的形参Map可以向前台传值，map里的值前端能接到
		PageBean.conMap(map, pages, num, request, oil_2);
		oil_2Service.oil_2List(map);
		return "back/oil_2/oil_2List";
	}
	
	

}



























