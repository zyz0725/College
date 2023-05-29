package util;

import java.util.Random;

public class RandomStr {
	public static String getRandomStr(Integer count){
		//创建字典
		String str="qwertyuiopasdfghjklzxcvbnm1234567890";
	    //创建随机类
		Random ran=new Random();
		//创建char数组
		char[] chs=new char[count];
		//填充char数组
		for (int i = 0; i < chs.length; i++) {
			int nextInt = ran.nextInt(str.length());
			chs[i]=str.charAt(nextInt);
		}
		return String.valueOf(chs);
	}
}
