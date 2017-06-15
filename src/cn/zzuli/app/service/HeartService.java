package cn.zzuli.app.service;

import java.util.List;

import cn.zzuli.app.base.BaseDao;
import cn.zzuli.app.domain.Heart;
import cn.zzuli.app.domain.Position;

public interface HeartService extends BaseDao<Heart> {
	List<Heart> getByUserID(int id);
}
