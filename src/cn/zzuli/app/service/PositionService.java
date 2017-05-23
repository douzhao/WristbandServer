package cn.zzuli.app.service;

import java.util.List;

import cn.zzuli.app.base.BaseDao;
import cn.zzuli.app.domain.Position;

public interface PositionService extends BaseDao<Position>{

	List<Position> getByUserID(int id);

	List<Position> getPositions(int id, String beginTime, String endTime);
}
