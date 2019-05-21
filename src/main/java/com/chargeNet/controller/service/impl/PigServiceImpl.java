package com.chargeNet.controller.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.chargeNet.controller.bean.Pig;
import com.chargeNet.controller.mapper.PigMapper;
import com.chargeNet.controller.service.PigService;

/**
 * 用户服务实现类
 * 
 * @author yolo<526668946@qq.com>
 * @2019年3月6日 下午4:51:54
 */
@Service
public class PigServiceImpl implements PigService {

    @Autowired
    private PigMapper pigMapper;

    @Override
    public List<Pig> getAllPig() {
        return pigMapper.listAll();
    }
    
    @Override
    public void insertPig(Pig pig) {
    	
    	Date currentTime = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String changetime = formatter.format(currentTime);
    	
    	pig.setChangetime(changetime);
        pigMapper.insertPig(pig);
    }
    
    @Override
    public void deletePig(String id) {
         pigMapper.deletePig(id);
    }
}
