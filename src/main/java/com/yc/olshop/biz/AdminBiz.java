package com.yc.olshop.biz;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Admin;
import com.yc.olshop.bean.AdminExample;
import com.yc.olshop.bean.AdminExample.Criteria;
import com.yc.olshop.bean.Adminloginrecord;
import com.yc.olshop.dao.AdminMapper;
import com.yc.olshop.dao.AdminloginrecordMapper;

@Service
public class AdminBiz {

	@Resource
	AdminMapper am;
	@Resource
	AdminloginrecordMapper alrm;

	// 管理员登录
	public Admin adminlogin(Admin admin) {
		AdminExample ae = new AdminExample();
		Criteria c = ae.createCriteria();
		c.andAnameLike(admin.getAname());
		c.andApwdLike(admin.getApwd());

		List<Admin> list = am.selectByExample(ae);
		if (list == null || list.size() <= 0) {
			return null;
		}
		return list.get(0);
	}

	// 查询不同类型的管理员
	public List<Admin> findAdminList(int atype) {
		// 分条件查询
		if (atype == 110) {
			List<Admin> list = am.selectByExample(null);
			return list;
		} else {
			AdminExample ae = new AdminExample();
			Criteria c = ae.createCriteria();
			c.andAtypeEqualTo(atype);
			List<Admin> list = am.selectByExample(ae);
			return list;
		}

	}

	public int changAdminState(int aid, int status) {
		Admin admin = new Admin();
		admin.setAid(aid);
		// 状态码不是1就是0
		int temp = status == 1 ? 0 : 1;
		admin.setStatus(temp);
		am.updateByPrimaryKeySelective(admin);
		return temp;
	}

	// 批量删除
	public void delAdminByGroup(int[] aidGroup) {
		for (int i : aidGroup) {
			am.deleteByPrimaryKey(i);
		}
	}

	// 单个删除
	public void delAdminSingle(int aid) {
		am.deleteByPrimaryKey(aid);
	}

	// 管理员类别及数量查询
	public List<Admin> findAdminSort() {
		List<Admin> list = am.findAdminSort();
		return list;
	}

	// 添加管理员
	public void addAdmin(String aname, String apwd, int atype, String aphone) {
		Admin admin = new Admin();
		admin.setAname(aname);
		admin.setApwd(apwd);
		admin.setAtype(atype);
		admin.setAphone(aphone);
		admin.setStatus(1);
		am.insertSelective(admin);
	}

	public Admin findAdminByAid(Integer aid) {
		Admin admin = am.selectByPrimaryKey(aid);
		return admin;
	}

	// 存入管理员记录表
	public void insertAdminLoginRecord(Admin adminUser, String ip, String address, int status) {
		Adminloginrecord alr = new Adminloginrecord();
		alr.setAid(adminUser.getAid());
		alr.setLoginDate(new Date());
		alr.setLoginIp(ip);
		alr.setLoginLocation(address);
		alr.setAction(status);
		alrm.insertSelective(alr);
	}

	// 查询登录记录
	public List<Adminloginrecord> searchadminLoginRecord(int atype, int aid) {
		// 根据管理员的不同，获取不同的登录信息，超级管理员可以获取所有管理员的登录信息
		if (atype == 0) {
			List<Adminloginrecord> list = alrm.searchadminLoginRecord();
			return list;
		} else {
			List<Adminloginrecord> list = alrm.searchadminLoginRecordByAid(aid);
			return list;
		}
	}

	public int updateAdminInfo(int aid, String aphone, String aname) {
		Admin admin = new Admin();
		admin.setAid(aid);
		admin.setAphone(aphone);
		admin.setAname(aname);
		return am.updateByPrimaryKeySelective(admin);
	}

	// 修改密码
	public int modifyAdminPassword(int aid, String apwd) {
		Admin admin = new Admin();
		admin.setAid(aid);
		admin.setApwd(apwd);
		return am.updateByPrimaryKeySelective(admin);
	}

	// 查询用户输入的原密码是否正确
	public int selectAdminByIdAndPwd(int aid, String originPwd) {
		AdminExample ae = new AdminExample();
		Criteria c = ae.createCriteria();
		c.andAidEqualTo(aid);
		c.andApwdEqualTo(originPwd);
		List<Admin> list = am.selectByExample(ae);
		if (list == null || list.size() <= 0) {
			return 1;
		}
		return 0;
	}

	// 判断管理员是否已经被停用
	public boolean queryIsStopUse(int status) {
		if (status == 1) {
			return true;
		}
		return false;
	}
}
