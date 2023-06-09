package util;

import org.apache.commons.codec.digest.DigestUtils;

public class Md5Util {
 
	//加密过程
	public static String encryption(String src){
		return DigestUtils.md5Hex(src);
	}
	
	//比对密码
	//src为用户输入的密码，pwd为数据库中已加密过的密文
	public static boolean checkPassword(String src,String pwd){
		if(src==null) throw new RuntimeException();
		if(pwd==null) throw new RuntimeException();
		String result = encryption(src);
		if( result.equals(pwd) ) return true;
		else return false;
	}
	
}
