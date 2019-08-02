package com.yc.olshop.biz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.olshop.bean.Links;
import com.yc.olshop.bean.LinksExample;
import com.yc.olshop.dao.LinksMapper;
import com.yc.olshop.utils.StringUtil;

@Service
public class LinksBiz {
	@Autowired
	private LinksMapper lm;

	// 查询 所有 友情链接 列表
	public List<Links> queryAllLinksList(String key) {
		LinksExample le = new LinksExample();
		if (!StringUtil.isEmpty(key)) {
			le.createCriteria().andLnameLike("%" + key + "%");
		}
		return lm.selectByExample(le);
	}

	// 删除
	public int delByLid(Integer lid) {
		return lm.deleteByPrimaryKey(lid);
	}

	// 根据 lid 添加或修改 links
	public int addOrUpdate(Links links) throws BizException {
		// 判断是修改还是添加
		links.setLtime(new Date());
		if (links.getLid() == -1) {
			// 添加
			// 判断是否超过12个
			int count = lm.countByExample(null);
			if (count >= 12) {
				throw new BizException("数量已达最大值，暂时无法继续添加");
			}
			links.setLid(null);
			return lm.insertSelective(links);
		} else {
			return lm.updateByPrimaryKeySelective(links);
		}
	}
}
