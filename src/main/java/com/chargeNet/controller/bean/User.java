package com.chargeNet.controller.bean;

/**
 * 用户实体类
 * 
 * @author yolo<526668946@qq.com>
 * @2019年3月6日 下午4:34:51
 */
public class User {

    private int    id;
    private String name;
    private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "【User】: name=" + name + ", password=" + password;
    }

}
