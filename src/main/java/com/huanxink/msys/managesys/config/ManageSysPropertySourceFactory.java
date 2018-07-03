package com.huanxink.msys.managesys.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.env.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.core.io.support.PropertySourceFactory;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.Properties;

/**
 * 属性文件工厂
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/5 9:45
 */
@Slf4j
public class ManageSysPropertySourceFactory implements PropertySourceFactory {

    @Override
    public PropertySource<?> createPropertySource(String s, EncodedResource encodedResource) throws IOException {
        log.info("name:{}", s);
        log.info("encodedResource: {}", encodedResource);
        // 通过encodedResource 获取Name和Properties
        // 1 name获取
        // 2 properties 对象获取
        Resource resource = encodedResource.getResource();
        if (resource == null) {
            IOException ioException = new IOException("文件流未加载到!!!");
            log.error("Resource is null", ioException);
            throw ioException;
        }
//        String filename = resource.getFilename();
        Properties properties = new Properties();
        PropertiesLoaderUtils.fillProperties(properties, resource);

        String name = resource.getDescription();
        if (StringUtils.hasText(name)) {
            name = resource.getClass().getSimpleName() + "@" + System.identityHashCode(resource);
        }
        return new PropertiesPropertySource(name, properties);
    }
}
