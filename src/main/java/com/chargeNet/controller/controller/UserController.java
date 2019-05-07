package com.chargeNet.controller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chargeNet.controller.bean.User;
import com.chargeNet.controller.service.LoginService;
import com.chargeNet.controller.service.UserService;
import com.chargeNet.controller.util.CookieUtils;
import com.chargeNet.controller.util.E3Result;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * @author yolo<526668946@qq.com>
 * @2019年3月6日 下午5:10:04
 */
@Controller
public class UserController {

	@Autowired
	private LoginService loginService;
	
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
    
    @RequestMapping("/login")
    public Object login() {
        return "login";
    }
    
    @RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public E3Result login(String username, String password,
			HttpServletRequest request, HttpServletResponse response) {
		E3Result e3Result = loginService.userLogin(username, password);
		//判断是否登录成功
		if(e3Result.getStatus() == 200) {
			String token = e3Result.getData().toString();
			//如果登录成功需要把token写入cookie
			CookieUtils.setCookie(request, response, "token", token);
		}
		//返回结果
		return e3Result;
	}
}
