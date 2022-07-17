
package com.iweb.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @file: UUIDUtil
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/12 18:59
 */
public class UUIDUtil {
	public static Integer i=1009;
	public static Integer getUUID(){
		return Integer.valueOf(UUID.randomUUID().toString().replaceAll("-",""));
	}

	public static Integer getUUID2(){
		return i++;
	}
	public static Integer getUUID3(){
		SimpleDateFormat sdf = new SimpleDateFormat("MMddHHmmss");
		String format = sdf.format(new Date());
		return Integer.valueOf(format);
	}
	
}
