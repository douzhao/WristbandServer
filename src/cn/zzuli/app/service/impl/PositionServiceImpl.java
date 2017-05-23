package cn.zzuli.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.zzuli.app.base.BaseDaoImpl;
import cn.zzuli.app.domain.Position;
import cn.zzuli.app.service.PositionService;

@Service
@SuppressWarnings("unchecked")
public class PositionServiceImpl extends BaseDaoImpl<Position> implements PositionService {

	public List<Position> getByUserID(int id) {
		return  getSession().createQuery(//
				"FROM Position p WHERE p.time=(SELECT MAX(q.time) FROM Position q WHERE q.user.id=?)")//
				.setParameter(0, id)//
				.list();
	}

	public List<Position> getPositions(int id, String beginTime, String endTime) {
		// TODO Auto-generated method stub
		return getSession().createQuery(//
				"FROM Position p WHERE p.user.id=? and p.time>? and p.time<?")//
				.setParameter(0, id)//
				.setParameter(1, beginTime)
				.setParameter(2, endTime)
				.list();
	}

}
