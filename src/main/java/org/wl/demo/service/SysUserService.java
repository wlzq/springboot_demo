package org.wl.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wl.demo.entity.SysUser;
import org.wl.demo.mapper.SysUserMapper;

import java.util.List;

/**
 * @author wl
 * @date 2019/1/18 23:12
 * @description
 */
@Service
public class SysUserService implements SysUserMapper {

    @Autowired
    private SysUserMapper sysUserMapper;


    @Override
    public int deleteByPrimaryKey(Integer userid) {
        return sysUserMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public int insert(SysUser record) {
        return sysUserMapper.insert(record);
    }

    @Override
    public int insertSelective(SysUser record) {
        return sysUserMapper.insertSelective(record);
    }

    @Override
    public SysUser selectByPrimaryKey(Integer userid) {
        return sysUserMapper.selectByPrimaryKey(userid);
    }

    @Override
    public int updateByPrimaryKeySelective(SysUser record) {
        return sysUserMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(SysUser record) {
        return sysUserMapper.updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(SysUser record) {
        return sysUserMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SysUser> selectListByParam(SysUser record) {
        return sysUserMapper.selectListByParam(record);
    }

    @Override
    public int selectCountByParam(SysUser record) {
        return sysUserMapper.selectCountByParam(record);
    }
}
