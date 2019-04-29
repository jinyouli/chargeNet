package com.chargeNet.controller.config;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * <pre>
 * &#64;AutoConfigureAfter(MybatisCfg.class) 保证在MybatisConfig类实例化后才实例化此方法
 * </pre>
 * 
 * @author yolo<526668946@qq.com>
 * @2019年3月6日 下午5:21:57
 */
@Configuration
@AutoConfigureAfter(MybatisCfg.class)
public class MybatisScannerCfg {

    /**
     * mapper接口的扫描器
     * 
     * @return
     */
    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setBasePackage("com.chargeNet.controller.mapper");
        return mapperScannerConfigurer;
    }

}
