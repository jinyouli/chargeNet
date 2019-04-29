package com.chargeNet.controller.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

/**
 * @author yolo<526668946@qq.com>
 * @2019年3月7日 上午11:34:36
 */
@Configuration
public class MybatisCfg {

    /**
     * <pre>
     * &#64;ConditionalOnMissingBean当容器里没有指定的Bean的情况下创建该对象
     * </pre>
     * 
     * @param dataSource
     * @return
     * @throws Exception
     */
    @Bean
    @ConditionalOnMissingBean
    public SqlSessionFactory sqlSessionFactoryBean(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        // 设置数据源
        sqlSessionFactoryBean.setDataSource(dataSource);
        // 添加一行如下代码,解决setTypeAliasesPackage别名设置不起作用问题
        sqlSessionFactoryBean.setVfs(SpringBootVFS.class);
        // 设置别名包
        sqlSessionFactoryBean.setTypeAliasesPackage("com.chargeNet.controller.bean");
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:config/mapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

}
