package com.main;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class InvokePYModel {
    /*****************注意配置路径***********************/
	String root_path = new File(this.getClass().getClassLoader().getResource("/").getPath()).getParent();
	String py_path = root_path + File.separator + "py" + File.separator + "invokeModel.py";
	String se_path = root_path + File.separator + "py" + File.separator + "pythonServer.py";


   public static Process procPython = null;
    //正常工况  -》 0
    //复杂工况  -》 1
    //程序异常  -》 2
    public  int invokeModel() {
    	
    	
    	
        if( procPython == null){
            iniModel();
        }
        Process proc;
        int index = 0;
        int output = 0;  //预测结果
        try {
            proc = Runtime.getRuntime().exec("python  " + py_path);// 执行client文件
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

    public  void iniModel() {
        try {
            
            procPython = Runtime.getRuntime().exec("python  " + se_path);// 执行server文件

        } catch (Exception e) {
            System.out.println("Java ERROR");
            e.printStackTrace();
        }
    }

    public static void termModel(){
        try{
	if(procPython != null)
	            procPython.destroy();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
	public InvokePYModel(){
		if( procPython == null){
            			iniModel();
        		}
	}
	protected void finalize( ){
		if( procPython != null){
            			termModel();
        		}
	}
}
