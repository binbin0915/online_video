package com.xiudun.exceptionhandler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class XiudunException extends RuntimeException{
    private Integer code;//异常码
    private String msg;//异常信息
}
