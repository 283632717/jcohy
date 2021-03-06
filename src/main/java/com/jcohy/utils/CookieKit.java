package com.jcohy.utils;



import com.jcohy.common.Constant;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:47.
 * ClassName  : IpKit
 * Description  : Cookie相关工具类
 */
public final class CookieKit {

	private CookieKit() {}

//	private static final String USER_COOKIE_KEY    = "";
//	private static String USER_COOKIE_SECRET = "&#%!&*";

	/**
	 * 从cookies中获取sessionID
	 * @param request
	 * @param response
	 * @return
	 */
	public static String getSessionIdFromCookie(HttpServletRequest request, HttpServletResponse response) {
		String cookieKey = Constant.USER_COOKIE_KEY;
		// 获取cookie信息
		String userCookie = getCookie(request, cookieKey);
		// 1.cookie为空，直接清除
		if (StringUtils.isBlank(userCookie)) {
			removeCookie(response, cookieKey);
			return null;
		}
		// 2.解密cookie
		String cookieInfo = null;
		// cookie 私钥
		String secret = Constant.USER_COOKIE_SECRET;
		try {
			cookieInfo = AESKit.decrypt(secret, userCookie);
		} catch (RuntimeException e) {
			// ignore
		}
		// 3.异常或解密问题，直接清除cookie信息
		if (StringUtils.isBlank(cookieInfo)) {
			removeCookie(response, cookieKey);
			return null;
		}
		String[] userInfo = cookieInfo.split("~");
		// 4.规则不匹配
		if (userInfo.length != 4) {
			removeCookie(response, cookieKey);
			return null;
		}
		String sessionId   = userInfo[0];
		String oldTime  = userInfo[1];
		String maxAge   = userInfo[2];
		// 5.判定时间区间，超时的cookie清理掉
		long now  = System.currentTimeMillis();
		long time = Long.parseLong(oldTime) + (Long.parseLong(maxAge) * 1000);
		if (time <= now) {
			removeCookie(response, cookieKey);
			return null;
		}
		return sessionId;
	}

	/**
	 *
	 * cookie设计为: des(私钥).encode(sessionId~time~maxAge~ip)
	 *
	 * @param response
	 * @param sessionId  用户sessionId
	 * @param remember   是否记住密码、此参数控制cookie的 maxAge，默认为2分钟（只在当前会话）<br>
	 *                   记住密码默认为1年
	 * @return void
	 */
	public static void setSessionId2Cookie(HttpServletResponse response, String sessionId, String loginIp, boolean... remember) {
		// 当前毫秒数
		long now = System.currentTimeMillis();
		// 超时时间，默认时间
		int maxAge = Constant.COOKIE_DEFAULT_DATE;

		if (remember.length > 0 && remember[0]) {
			maxAge = Constant.COOKIE_DATE;
		}
		// 构造cookie
		StringBuilder cookieBuilder = new StringBuilder()
			.append(sessionId).append("~")
			.append(now).append("~")
			.append(maxAge).append("~")
			.append(loginIp);

		// cookie 私钥
		String secret = Constant.USER_COOKIE_SECRET;
		// 加密cookie
		String userCookie = AESKit.encrypt(secret, cookieBuilder.toString());

		String cookieKey = Constant.USER_COOKIE_KEY;
		// 设置用户的cookie、 -1 维持成session的状态
		setCookie(response, cookieKey, userCookie, maxAge);
	}

	/**
	 * 读取cookie
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getCookie(HttpServletRequest request, String key) {
		Cookie[] cookies = request.getCookies();
		if(null != cookies){
			for (Cookie cookie : cookies) {
				if (key.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	/**
	 * 清除 sessionId的cookie
	 * @param response
	 * @param
	 */
	public static void removeSessionIdFromCookie(HttpServletResponse response) {
		setCookie(response, Constant.USER_COOKIE_KEY, null, 0);
	}
	/**
	 * 清除 某个指定的cookie
	 * @param response
	 * @param key
	 */
	public static void removeCookie(HttpServletResponse response, String key) {
		setCookie(response, key, null, 0);
	}

	/**
	 * 设置cookie
	 * @param response
	 * @param name
	 * @param value
	 * @param maxAgeInSeconds
	 */
	public static void setCookie(HttpServletResponse response, String name, String value, int maxAgeInSeconds) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(maxAgeInSeconds);
		cookie.setHttpOnly(true);
		response.addCookie(cookie);
	}
}
