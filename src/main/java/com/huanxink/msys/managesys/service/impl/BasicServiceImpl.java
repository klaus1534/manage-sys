package com.huanxink.msys.managesys.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.model.BasicEnity;
import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.service.BasicService;
import com.huanxink.msys.managesys.service.EnterpriseQualificationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.*;

/**
 * @author klaus
 * @project manage-sys
 * @date 2018/6/5 11:02
 */
public abstract class BasicServiceImpl<T extends BasicEnity, ID, DO extends T> implements BasicService<T, ID, DO> {

    protected final Logger log = LoggerFactory.getLogger(this.getClass());
    protected final static String DEFAULT_USER = "admin";

    protected abstract BasicMapper<T, ID, DO> getBasicMapper();

    @Override
    public T create(T record) {
        record.setCreatedTime(new Date());
        ManageSysUser user = getUser();
        if (user == null) {
            record.setCreater(DEFAULT_USER);
        } else {
            record.setCreater(user.getUsername());
        }
        getBasicMapper().insertSelective(record);
        return record;
    }

    @Override
    public T update(T record) {
        record.setUpdatedTime(new Date());
        ManageSysUser user = getUser();
        if (user == null) {
            record.setCreater(DEFAULT_USER);
        } else {
            record.setCreater(user.getUsername());
        }
        getBasicMapper().updateByPrimaryKeySelective(record);
        return record;
    }

    @Override
    public T get(ID primaryKey) {
        return getBasicMapper().selectByPrimaryKey(primaryKey);
    }

    @Override
    public void delete(ID id) {
        getBasicMapper().deleteByPrimaryKey(id);
    }


    @Override
    public PageInfo<T> secherPage(Map param, Integer pageno, Integer pageSize) {
        BasicMapper concreteMapper = this.getBasicMapper();
        PageHelper.startPage(pageno, pageSize);

        List<T> list = null;
        if (Objects.equals(param.get("menuIn"), "true")) {
            list = new ArrayList<>();
        }else {
            list = concreteMapper.seacherPageList(param);
        }
        return new PageInfo<T>(list);
    }

    @Override
    public PageInfo<DO> secherJoinPage(Map param, Integer pageno, Integer pageSize) {
        BasicMapper concreteMapper = this.getBasicMapper();
        PageHelper.startPage(pageno, pageSize);
        List<DO> list = concreteMapper.seacherJoinPageList(param);
        return new PageInfo<>(list);
    }

    protected ManageSysUser getUser() {
        ManageSysUser manageSysUser = (ManageSysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return manageSysUser;
    }
}
