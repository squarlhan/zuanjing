package com.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dmg.pmml.FieldName;
import org.dmg.pmml.PMML;
import org.jpmml.evaluator.Evaluator;
import org.jpmml.evaluator.FieldValue;
import org.jpmml.evaluator.InputField;
import org.jpmml.evaluator.ModelEvaluator;
import org.jpmml.evaluator.ModelEvaluatorFactory;
import org.jpmml.evaluator.ProbabilityDistribution;
import org.jpmml.evaluator.TargetField;

import com.oil_2.model.Oil_2;

public class Pmml {
	public String predictL(Map<String, Double> kxmap)throws Exception {
        PMML pmml;
   	 	/*
 	     * ***************注意配置路径**********************
 	     */
       
        String root_path = new File(this.getClass().getClassLoader().getResource("/").getPath()).getParent();
        String pathxml = root_path + File.separator + "py" + File.separator + "lightgbm.pmml";

        

//        File rootFile = new File(new File(this.getClass().getClassLoader().getResource("/").getPath()).getParent() + File.separator + "roottest.txt");
//        File testFile = new File(this.getClass().getClassLoader().getResource("/").getPath() + File.separator+"test.txt");
//        if (!testFile.exists()) {
//            testFile.createNewFile();// 能创建多级目录
//            rootFile.createNewFile();// 能创建多级目录
//        }
//        System.out.println("testFile:"+testFile.getAbsolutePath());
//        System.out.println("rootFile:"+rootFile.getAbsolutePath());
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(pathxml);
        } catch (IOException e) {
            e.printStackTrace();
        }
        InputStream is = inputStream;
        try {
            pmml = org.jpmml.model.PMMLUtil.unmarshal(is);

            ModelEvaluatorFactory modelEvaluatorFactory = ModelEvaluatorFactory
                    .newInstance();
            ModelEvaluator<?> modelEvaluator = modelEvaluatorFactory
                    .newModelEvaluator(pmml);
            Evaluator evaluator = (Evaluator) modelEvaluator;

            List<InputField> inputFields = evaluator.getInputFields();

            Map<FieldName, FieldValue> arguments = new LinkedHashMap<FieldName, FieldValue>();
            for (InputField inputField : inputFields) {
                FieldName inputFieldName = inputField.getName();
                Object rawValue = kxmap
                        .get(inputFieldName.getValue());
                FieldValue inputFieldValue = inputField.prepare(rawValue);
                arguments.put(inputFieldName, inputFieldValue);
            }
            Map<FieldName, ?> results = evaluator.evaluate(arguments);
            List<TargetField> targetFields = evaluator.getTargetFields();
            for (TargetField targetField : targetFields) {
                FieldName targetFieldName = targetField.getName();
                ProbabilityDistribution targetFieldValue = (ProbabilityDistribution) results.get(targetFieldName);
                System.out.println("target: " + targetFieldName.getValue()
                        + " value: " + targetFieldValue);
                Set<String> categories = targetFieldValue.getCategories();
                Double max = 0.0;
                String ca = null;
                for (String category : categories) {
                    if (targetFieldValue.getProbability(category) > max) {
                        max = targetFieldValue.getProbability(category);
                        ca = category;
                    }
                }
                return ca;
            }
        } catch (Exception e) {
            inputStream.close();
        }
        return "-1";
    }
	
	public static Map<String, Double> InputMap(Oil_2 oil_2){
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
        
		return map2;
		
	}
}
