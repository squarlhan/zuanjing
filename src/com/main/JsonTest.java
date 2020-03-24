package com.main;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author newcityman
 * @date 2019/9/17 - 23:12
   步骤1、导入jackson的三个包
      2、创建一个user对象，并赋值
      3、创建jackson的核心对象ObjectMapper
      4、调用ObjectMapper的writevalue等相关方法
 */
public class JsonTest {
    @Test
    public void test1() throws IOException {
        //1、创建对象
        Demo user = new Demo();
        user.setName("王天放");
        user.setAge(21);
        user.setSex("Male");
        //2、创建jackson的核心对象 ObjectMapper
        ObjectMapper mapper = new ObjectMapper();
        //3、转换
        /*try {
            String json = mapper.writeValueAsString(user);
            System.out.println(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }*/
           //将数据写到d://a.txt文件中
//        mapper.writeValue(new File("d://a.txt"),user);
        //将数据关联到writer中
        mapper.writeValue(new FileWriter("d://b.txt"),user);

    }

    @Test
    public void test2() throws IOException {
        //1、创建对象
        Demo user = new Demo();
        
        user.setName("王天放");
        user.setAge(21);
        user.setSex("Male");
        

        //2、创建jackson的核心对象 ObjectMapper
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(user);
        System.out.println(json);

    }

  
    @Test
    public void test4() throws IOException {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("name","zmy");
        map.put("age",15);
        map.put("gender","男");

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(map);
        System.out.println(json);
    }

   //演示 json字符串转换为java对象
    @Test
    public void test5() throws IOException {
        //初始化json字符串
       String json="{\"gender\":\"男\",\"name\":\"zmy\",\"age\":15}";
       //创建ObjectMapper对象
        ObjectMapper mapper = new ObjectMapper();
        //转换json字符串为java对象
        Demo user = mapper.readValue(json, Demo.class);
        System.out.println(user);
    }
}