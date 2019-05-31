package com.chargeNet.controller.service.impl;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.chargeNet.controller.util.jedis.JedisClient;
import com.chargeNet.controller.util.E3Result;
import com.chargeNet.controller.util.JsonUtils;
import com.chargeNet.controller.mapper.UserMapper;
import com.chargeNet.controller.bean.User;
import com.chargeNet.controller.service.LoginService;

/**
 * 用户登录处理 
 * <p>Title: LoginServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.cn</p> 
 * @version 1.0
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	//@Value("${SESSION_EXPIRE}")
	private Integer SESSION_EXPIRE = 1800;
	
	@Override
	public E3Result userLogin(String username, String password) {
		// 1、判断用户和密码是否正确
		//根据用户名查询用户信息
		//执行查询

		List<User> list = userMapper.selectByName(username);
		if (list == null || list.size() == 0) {
			//返回登录失败
			return E3Result.build(400, "用户名或密码错误1");
		}
		//取用户信息
		User user = list.get(0);
		System.out.println("用户名==   " + DigestUtils.md5DigestAsHex(password.getBytes()) + "    " + user.getPassword());
		//判断密码是否正确
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
			// 2、如果不正确，返回登录失败
			return E3Result.build(400, "用户名或密码错误2");
		}

		// 3、如果正确生成token。
		String token = UUID.randomUUID().toString();
		// 4、把用户信息写入redis，key：token value：用户信息
		user.setPassword(null);
		stringRedisTemplate.opsForValue().append("SESSION:" + token, JsonUtils.objectToJson(user));
		// 5、设置Session的过期时间
		stringRedisTemplate.expire("SESSION:" + token, SESSION_EXPIRE, TimeUnit.SECONDS);
		// 6、把token返回

		return E3Result.ok(token);
	}

}
