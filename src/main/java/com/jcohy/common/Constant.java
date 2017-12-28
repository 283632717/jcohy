package com.jcohy.common;


import java.io.File;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Constant
 * Description:
 **/
public interface Constant {

	/**
	 * 用户登录缓存key名称
	 */
	public static final String CACHE_LOGINUSER = "loginUser";
	
	/**
	 * 日期时间格式化串
	 */
	public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

	/**
	 * cookie_key
	 */
	public static final String USER_COOKIE_KEY    = "JcohyUserId";

	/**
	 * cookie_secret私钥
	 */
	public static final String USER_COOKIE_SECRET = "&#%!&*";


	/**
	 * cookie的默认时间设置
	 */
	public static final Integer COOKIE_DEFAULT_DATE = 60*60*2;
	/**
	 * cookie的时间设置
	 */
	public static final Integer COOKIE_DATE = 60*60*24*365;
	/**
	 * session登录时间设置
	 */
	public static final Integer SESSION_KEEPLOGIN = 60*60*2;
	/**
	 * session未保存登录状态登录时间设置
	 */
	public static final Integer SESSION_UNKEEPLOGIN = 60;


}
