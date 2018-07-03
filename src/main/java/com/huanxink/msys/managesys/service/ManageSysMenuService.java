package com.huanxink.msys.managesys.service;

import com.huanxink.msys.managesys.model.ManageSysMenu;

import java.util.List;
import java.util.Map;

public interface ManageSysMenuService extends BasicService<ManageSysMenu, Integer, ManageSysMenu> {

    List<ManageSysMenu> searchList(Map map);
}
