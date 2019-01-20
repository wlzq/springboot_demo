package org.wl.demo.web;

import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.wl.demo.entity.SysUser;
import org.wl.demo.service.SysUserService;
import org.wl.demo.entity.PageParameter;

import java.util.List;

/**
 * @author wl
 * @date 2019/1/13 22:32
 * @description
 */
@Controller
@RequestMapping("/user")
public class UserController {

    protected final static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping("/list")
    public String query(SysUser sysUser, @RequestParam(name="currentPage", required=false) Integer currentPage,
                        Model model){
        logger.info("进入用户列表页面");
        int totalNum = sysUserService.selectCountByParam(sysUser);
        PageParameter pageParameter = new PageParameter(totalNum, currentPage);
        model.addAttribute("pageParameter", pageParameter);
        sysUser.setPageParameter(pageParameter);
        List<SysUser> userList = sysUserService.selectListByParam(sysUser);
        model.addAttribute("userList", userList);
        return "user/user_list";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name="userid", required = false) Integer userid, Model model){
        System.out.println("进入用户编辑页面");
        logger.info("进入用户编辑页面");
        SysUser sysUser = new SysUser();
        if (userid != null) {
            sysUser = sysUserService.selectByPrimaryKey(userid);
        }
        model.addAttribute("sysUser", sysUser);
        return "user/user_detail";
    }

    @RequestMapping(value="/edit",method = RequestMethod.POST)
    @ResponseBody
    public String save(SysUser sysUser){
        System.out.println("保存用户信息");
        String result = "";
        if (null == sysUser.getUserid()) {
            sysUserService.insert(sysUser);
            result = "insert_success";
        }else{
            sysUserService.updateByPrimaryKeyWithBLOBs(sysUser);
            result = "update_success";
        }
        return JSON.toJSONString(result);
    }

    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam("userid") Integer userid){
        sysUserService.deleteByPrimaryKey(userid);
        return JSON.toJSONString("delete_success");
    }

}
