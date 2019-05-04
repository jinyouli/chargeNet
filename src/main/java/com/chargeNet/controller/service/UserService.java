package com.chargeNet.controller.service;

import java.util.List;

import com.chargeNet.controller.bean.User;

/**
 * @author yolo<526668946@qq.com>
 * @2019年3月7日 下午1:40:28
 */
public interface UserService {

    /**
     * 查询全部用户
     * 
     * @return
     */
    List<User> getAllUser();
    void insertUser(User user);
    void deleteUser(String id);
}
