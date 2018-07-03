package com.huanxink.msys.managesys;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Repository;

@SpringBootApplication
@ImportResource(value = {
        "classpath:config/spring/application-security.xml",
})
@MapperScan(basePackages = {"com.huanxink.msys.managesys"}, annotationClass = Repository.class)
//@PropertySource(factory = ManageSysPropertySourceFactory.class, value = "file:///E:/noahwm/cache/application.properties", encoding = "UTF-8")
public class ManageSysApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ManageSysApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ManageSysApplication.class, args);
    }
}
