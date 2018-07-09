package com.huanxink.msys.managesys.mapper;


import java.util.List;
import java.util.Map;

public interface BasicMapper<T, ID, DO extends T> {

    int deleteByPrimaryKey(ID primaryKey);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(ID primaryKey);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    List<T> seacherPageList(Map param);

    List<DO> seacherJoinPageList(Map param);

}
