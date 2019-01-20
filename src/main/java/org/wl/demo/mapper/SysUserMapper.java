package org.wl.demo.mapper;

import org.wl.demo.entity.SysUser;

import java.util.List;

public interface SysUserMapper {

    int deleteByPrimaryKey(Integer userid);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKeyWithBLOBs(SysUser record);

    int updateByPrimaryKey(SysUser record);

    List<SysUser> selectListByParam(SysUser record);

    int selectCountByParam(SysUser record);
}