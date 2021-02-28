package com.xiudun.exceptionhandler;

import com.xiudun.util.R;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ApiOperation("指定出现异常调用的方法")
    @ExceptionHandler(Exception.class)
    @ResponseBody//返回的数据格式(json)
    public R error(Exception e){
        e.printStackTrace();
        return R.error().message("这是一个全局的异常...");
    }

    @ApiOperation("自定义异常")
    @ExceptionHandler(XiudunException.class)
    @ResponseBody//返回的数据格式(json)
    public R error(XiudunException e){
        e.printStackTrace();
        return R.error().code(e.getCode()).message(e.getMessage());
    }

    @ApiOperation("特定异常")
    @ExceptionHandler(ArithmeticException.class)
    @ResponseBody//返回的数据格式(json)
    public R error(ArithmeticException e){
        e.printStackTrace();
        return R.error().message("执行了ArithmeticException异常...");
    }
}































