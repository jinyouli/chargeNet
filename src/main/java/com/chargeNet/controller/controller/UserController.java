package com.chargeNet.controller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chargeNet.controller.bean.Pig;
import com.chargeNet.controller.bean.Updatepig;
import com.chargeNet.controller.bean.User;
import com.chargeNet.controller.service.LoginService;
import com.chargeNet.controller.service.PigService;
import com.chargeNet.controller.service.UserService;
import com.chargeNet.controller.util.CookieUtils;
import com.chargeNet.controller.util.E3Result;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMethod;
import org.json.JSONObject;
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
    
    @Autowired
    private PigService pigService;

    @RequestMapping("/users")
    @ResponseBody
    public Object getAllUser() {
        List<User> users = userService.getAllUser();
        return users;
    }
    
    @RequestMapping("/pigs")
    @ResponseBody
    public Object getAllPig() {
        List<Pig> pigs = pigService.getAllPig();
        return pigs;
    }
    
    @RequestMapping(value = "/selectpigs", method = RequestMethod.POST)
    @ResponseBody
    public Object getPigs(Updatepig updatepig) {
        //List<Pig> pigs = pigService.getAllPig();
    	String first_date = updatepig.getFirst_date();
    	String second_date = updatepig.getSecond_date();
    	
    	List<Pig> pigs = pigService.selectPigs(updatepig);
        return pigs;
    }
    
    @RequestMapping("/insertUser")
    @ResponseBody
    public Object insertUser(User user) {
        userService.insertUser(user);
        return "200";
    }
    
    @RequestMapping("/insertPig")
    @ResponseBody
    public Object insertPig(Pig pig) {
        pigService.insertPig(pig);
        return "200";
    }
    
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Object deleteUser(String id) {
        userService.deleteUser(id);
        return "200";
    }
    
    @RequestMapping("/deletePig")
    @ResponseBody
    public Object deletePig(String id) {
        pigService.deletePig(id);
        return "200";
    }
    
    @RequestMapping("/addUser")
    public Object addUser() {
        return "content-add";
    }
    
    @RequestMapping("/addPig")
    public Object addPig() {
        return "pig-add";
    }
    
    @RequestMapping("/")
    public Object firstPage() {
        return "index";
    }

    @RequestMapping("/content")
    public Object getList() {
        return "content";
    }
    
    @RequestMapping("/content-pig")
    public Object getPigList() {
        return "content-pig";
    }
    
    @RequestMapping("/{page}")
    public String showPage(@PathVariable String page) {
        return page;
    }
    
    @RequestMapping("/login")
    public Object login() {
        return "login";
    }
    
    @RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public E3Result login(String username, String password,
			HttpServletRequest request, HttpServletResponse response) {
    	
    	System.out.println("pass == " + username + "  " + password);
		E3Result e3Result = loginService.userLogin(username, password);
		//判断是否登录成功
		if(e3Result.getStatus() == 200) {
			String token = e3Result.getData().toString();
			//如果登录成功需要把token写入cookie
			//CookieUtils.setCookie(request, response, "token", token);
            
            Cookie cookie = new Cookie("token",token);
            cookie.setPath("/");
            cookie.setMaxAge(3600);
            response.addCookie(cookie);
            System.out.println("返回token == " + token);
		}
		//返回结果
		return e3Result;
	}
}
