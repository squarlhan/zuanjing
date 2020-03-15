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
		/*
		Map<String, Double>  map2=new HashMap<String, Double>();
        map2.put("0", oil_2.getWellDep());map2.put("1",oil_2.getDepthOfTheDrillBit() );
        map2.put("2", oil_2.getDrillingTime());map2.put("3", oil_2.getBitPressure());
        map2.put("4", oil_2.getHangingLoad());map2.put("5", oil_2.getRotationRate());
        map2.put("6", oil_2.getTorque());map2.put("7",oil_2.getKellyDown());
        map2.put("8", oil_2.getHookPosition());map2.put("9", oil_2.getHookSpeed());
        map2.put("10", oil_2.getStandpipePressurelog());map2.put("11", oil_2.getCasingPressure());
        map2.put("12", oil_2.getPumpStroke1());map2.put("13", oil_2.getPumpStroke2());
        map2.put("14", oil_2.getPumpStroke3());map2.put("15", oil_2.getTotalPoolSize());
        map2.put("16", oil_2.getLayTime());map2.put("17", oil_2.getMudSpill());
        map2.put("18", oil_2.getInletFlowlog());map2.put("19", oil_2.getOutletFlowlog());
        map2.put("20", oil_2.getInletDensitylog());map2.put("21", oil_2.getOutletDensitylog());
        map2.put("22", oil_2.getEntranceTempreture());map2.put("23", oil_2.getExitTempreture());
        map2.put("24", oil_2.getTotalHydrocarbon());map2.put("25", oil_2.getH2S());
        map2.put("26", oil_2.getC1());map2.put("27", oil_2.getC2());
        map2.put("28", oil_2.getStandpipePressure());map2.put("29", oil_2.getMeasurementOfBackPressure());
        map2.put("30", oil_2.getOutletFlow());map2.put("31", oil_2.getOutletDensity());
        map2.put("32", oil_2.getBackPressurePumpFlow());map2.put("33", oil_2.getInletFlow());
        map2.put("34", oil_2.getQiXiaZuanSD());map2.put("35", oil_2.getQiXiaZuanJSD());
		*/
		Pmml pmml = new Pmml();
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
	
	
	@RequestMapping("back/oil_2List")
	public String oil_2List(Map<String,Object> map,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int num,Oil_2 oil_2,HttpServletRequest request){//可以往前台传值,page是当前第几页
		//这里的代码被封装到pagebean里去了
		//Controller里的形参Map可以向前台传值，map里的值前端能接到
		PageBean.conMap(map, pages, num, request, oil_2);
		oil_2Service.oil_2List(map);
		return "back/oil_2/oil_2List";
	}
	
	

}



























