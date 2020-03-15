package com.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

public class InvokePYModel {
	 /*
	    * ***************注意配置路径**********************
	     */
	 /*
	public static String PythonPath = "E:\\%大三上学期\\大创\\中古301H\\5标签2\\丰欣模型\\javagopython\\invokeModel.py";
	    //正常工况  -》 0
	    //复杂工况  -》 1
	    //程序异常  -》 2
	    public static int invokeModel() {
	        Process proc;
	        int index = 0;
	        int output = 0;  //预测结果
	        try {
	            proc = Runtime.getRuntime().exec("python  " + PythonPath);// 执行py文件
	            //用输入输出流来截取结果
	            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
	            String line = null;
	            while ((line = in.readLine()) != null) {
	                index ++;
	                output = Integer.parseInt(line.substring(1,2));
	            }
	            in.close();
	            proc.waitFor();
	        } catch (Exception e) {
	            System.out.println("Java ERROR");
	            e.printStackTrace();
	            return 2;
	        }
	        if(index != 1){
	            System.out.println("Python ERROR");
	            return 2;
	        }
	        return output;
	    }
*/

		
	    public int invokeModel() {
	        Process proc;
	        int index = 0;
	        int output = 0;  //预测结果
	        try {
	        	String root_path = new File(this.getClass().getClassLoader().getResource("/").getPath()).getParent();
	            String py_path = root_path + File.separator + "py" + File.separator + "invokeModel.py";
	        	proc = Runtime.getRuntime().exec("python " + py_path);// 执行py文件
	        	//用输入输出流来截取结果
	            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
	            String line = null;
	            while ((line = in.readLine()) != null) {
	                index ++;
	                output = Integer.parseInt(line.substring(1,2));
	            }
	            in.close();
	            proc.waitFor();
	        } catch (Exception e) {
	            System.out.println("Java ERROR");
	            e.printStackTrace();
	            return 2;
	        }
	        if(index != 1){
	            System.out.println("Python ERROR");
	            return 2;
	        }
	        return output;
	    }
	    
}
