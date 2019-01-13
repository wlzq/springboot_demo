package org.wl.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wl
 * @date 2019/1/13 21:51
 * @description
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/main")
    public String main(){
        System.out.println("进入首页");
        return "main";
    }

    @GetMapping("/login")
    public String login(){
        System.out.println("进入登录页");
        return "login";
    }

}
