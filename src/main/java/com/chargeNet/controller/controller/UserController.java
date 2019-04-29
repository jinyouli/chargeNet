package com.chargeNet.controller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chargeNet.controller.bean.User;
import com.chargeNet.controller.service.UserService;

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

}
