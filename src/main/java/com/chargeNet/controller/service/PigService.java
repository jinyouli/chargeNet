package com.chargeNet.controller.service;

import java.util.List;

import com.chargeNet.controller.bean.Pig;
import com.chargeNet.controller.bean.Updatepig;

/**
 * @author yolo<526668946@qq.com>
 * @2019年3月7日 下午1:40:28
 */
public interface PigService {

    /**
     * 查询全部用户
     * 
     * @return
     */
    List<Pig> getAllPig();
    List<Pig> selectPigs(Updatepig piginfo);
    void insertPig(Pig user);
    void deletePig(String id);
}
