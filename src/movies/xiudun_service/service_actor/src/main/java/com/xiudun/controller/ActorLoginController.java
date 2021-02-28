package com.xiudun.controller;
// 自己编写一个登录

import com.xiudun.util.R;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user")
public class ActorLoginController {

    //登录
    @PostMapping("login")
    public R login(){
        return R.ok().data("token", "admin");
    }

    //登录返回信息
    @GetMapping("info")
    public R info(){
        return R.ok().data("roles", "[admin]")
                .data("name", "admin")
                .data("avatar", "xxx");
    }
}






































