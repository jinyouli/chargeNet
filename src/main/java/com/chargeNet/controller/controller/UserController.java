package com.chargeNet.controller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chargeNet.controller.bean.User;
import com.chargeNet.controller.service.UserService;
import com.chargeNet.controller.util.E3Result;

/**
 * @author yolo<526668946@qq.com>
 * @2019年3月6日 下午5:10:04
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/users")
    @ResponseBody
    public Object getAllUser() {
        List<User> users = userService.getAllUser();
        return users;
    }
    
    @RequestMapping("/insertUser")
    @ResponseBody
    public Object insertUser(User user) {
        userService.insertUser(user);
        return "200";
    }
    
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Object deleteUser(String id) {
        userService.deleteUser(id);
        return "200";
    }
    
    @RequestMapping("/addUser")
    public Object addUser() {
        return "content-add";
    }

    @RequestMapping("/content")
    public Object getList() {
        return "content";
    }
}
