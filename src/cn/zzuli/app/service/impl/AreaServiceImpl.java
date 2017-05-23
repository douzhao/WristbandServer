package cn.zzuli.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.zzuli.app.base.BaseDaoImpl;
import cn.zzuli.app.domain.Area;
import cn.zzuli.app.service.AreaService;

@Service
@SuppressWarnings("unchecked")
public class AreaServiceImpl extends BaseDaoImpl<Area> implements AreaService {

	public List<Area> findTopList() {
		return getSession().createQuery(//
				"FROM Area a WHERE a.parent IS NULL")//
				.list();
	}

	public List<Area> findChildrenList(String parentId) {
		return getSession().createQuery(//
				"FROM Area a WHERE a.parent.areaId = ?")//
				.setParameter(0, parentId)//
				.list();
	}

}
