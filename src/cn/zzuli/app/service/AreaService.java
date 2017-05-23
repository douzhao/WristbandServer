package cn.zzuli.app.service;

import java.util.List;

import cn.zzuli.app.base.BaseDao;
import cn.zzuli.app.domain.Area;

public interface AreaService extends BaseDao<Area> {

	List<Area> findTopList();

	List<Area> findChildrenList(String parentId);

}
