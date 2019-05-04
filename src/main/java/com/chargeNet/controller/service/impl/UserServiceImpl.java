package com.chargeNet.controller.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chargeNet.controller.bean.User;
import com.chargeNet.controller.mapper.UserMapper;
import com.chargeNet.controller.service.UserService;

/**
 * 用户服务实现类
 * 
 * @author yolo<526668946@qq.com>
 * @2019年3月6日 下午4:51:54
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getAllUser() {
        return userMapper.listAll();
    }
    
    @Override
    public void insertUser(User user) {
         userMapper.insertUser(user);
    }
    
    @Override
    public void deleteUser(String id) {
         userMapper.deleteUser(id);
    }
}
