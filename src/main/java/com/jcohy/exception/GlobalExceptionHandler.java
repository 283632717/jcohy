package com.jcohy.exception;//package com.star.appstore.handle;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.jcohy.common.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/10/18 10:22.
 * ClassName  : ExceptionHandle
 * Description  :
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private final static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public JsonResult handle(Exception e) {
        if (e instanceof ServiceException) {
            ServiceException girlException = (ServiceException) e;
            return JsonResult.fail("-1", "服务异常");
        }else {
            logger.error("【系统异常】{}", e);
            return JsonResult.fail("-1","系统异常");
        }
    }
}
