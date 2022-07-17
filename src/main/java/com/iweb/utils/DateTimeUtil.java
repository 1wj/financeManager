
package com.iweb.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @file: DateTimeUtil
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/12 18:43
 */
public class DateTimeUtil {
	
	public static String getSysTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String dateStr = sdf.format(date);
		return dateStr;
	}
	
}
