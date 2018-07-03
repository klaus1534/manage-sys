package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.mapper.BasicMapper;
import com.huanxink.msys.managesys.mapper.ManageSysUserMapper;
import com.huanxink.msys.managesys.model.ManageSysUser;
import com.huanxink.msys.managesys.model.dto.ManageSysUserDo;
import com.huanxink.msys.managesys.service.ManageSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author fujianjian
 * @project manage-sys
 * @date 2018/6/8 15:09
 */
@Service
public class ManageSysUserServiceImpl extends BasicServiceImpl<ManageSysUser, Integer, ManageSysUser>
        implements ManageSysUserService {

    @Autowired
    private ManageSysUserMapper manageSysUserMapper;

    @Autowired
    private Md5PasswordEncoder md5PasswordEncoder;

    @Override
    protected BasicMapper<ManageSysUser, Integer, ManageSysUser> getBasicMapper() {
        return manageSysUserMapper;
    }

    @Override
    public List<ManageSysUser> seacherList(Map param) {
        return this.manageSysUserMapper.seacherPageList(param);
    }

    @Override
    public ManageSysUser create(ManageSysUser record) {
        record.setCreatedTime(new Date());
        ManageSysUser user = getUser();
        if (!StringUtils.isEmpty(record.getPassword())) {
            record.setPassword(md5PasswordEncoder
                    .encodePassword(record.getPassword(), null));
        }
        record.setEnabled(true);
        record.setLocked(false);
        if (user == null) {
            record.setCreater(DEFAULT_USER);
        } else {
            record.setCreater(user.getUsername());
        }
        getBasicMapper().insertSelective(record);
        return record;
    }

    @Override
    public ManageSysUserDo updateByDo(ManageSysUserDo manageSysUserDo) {
        manageSysUserDo.setUpdatedTime(new Date());
        ManageSysUser user = getUser();
        if (user == null) {
            manageSysUserDo.setCreater(DEFAULT_USER);
        } else {
            manageSysUserDo.setCreater(user.getUsername());
        }
        manageSysUserMapper.updateByDo(manageSysUserDo);
        return manageSysUserDo;
    }
}
