package com.huanxink.msys.managesys.model;

import lombok.Data;

import java.util.List;
import java.util.Set;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/7 21:43
 */
@Data
public class ManageSysMenu extends BasicEnity {

    private String menuName;

    private String menuPath;

    private Integer orderno;

    private Integer parentId;

    private Set<ManageSysRole> roles;

    private List<ManageSysMenu> subMenuList;

}
