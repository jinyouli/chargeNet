package com.chargeNet.controller.mapper;

import java.util.List;

import com.chargeNet.controller.bean.Pig;
import com.chargeNet.controller.bean.Updatepig;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author yolo<526668946@qq.com>
 * @2019年3月7日 下午1:38:55
 */
@Mapper
public interface PigMapper {

    /**
     * 获取全部用户
     * 
     * @return
     */
    List<Pig> listAll();
    List<Pig> selectPigs(Updatepig piginfo);
    void insertPig(Pig pig);
    void deletePig(String id);
    List<Pig> selectByName(String name);
}
