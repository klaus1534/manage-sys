package com.huanxink.msys.managesys.service;

import com.github.pagehelper.PageInfo;

import java.util.Map;

public interface BasicService<T, ID, DO extends T> {

    T create(T record);

    T update(T record);

    T get(ID primaryKey);

    void delete(ID id);

    PageInfo<T> secherPage(Map param, Integer pageno, Integer pageSize);

    PageInfo<DO> secherJoinPage(Map param, Integer pageno, Integer pageSize);

}
