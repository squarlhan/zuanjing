package com.main;

public class Demo {
		public String name;
		public int age;
		public String sex;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		
		
		@Override
		public String toString() {
			return "Demo [name=" + name + ", age=" + age + ", sex=" + sex + "]";
		}
		
		
}
