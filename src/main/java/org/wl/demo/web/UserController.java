package org.wl.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wl
 * @date 2019/1/13 22:32
 * @description
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/list")
    public String query(){
        System.out.println("进入用户列表页面");
        return "user/user_list";
    }

    @RequestMapping("/edit")
    public String edit(){
        System.out.println("进入用户编辑页面");
        return "user/user_detail";
    }

}
