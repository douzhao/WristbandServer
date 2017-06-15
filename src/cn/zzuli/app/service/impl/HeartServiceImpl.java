package cn.zzuli.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.zzuli.app.base.BaseDaoImpl;
import cn.zzuli.app.domain.Heart;
import cn.zzuli.app.service.HeartService;


@Service
@SuppressWarnings("unchecked")
public class HeartServiceImpl extends BaseDaoImpl<Heart>  implements HeartService{
	public List<Heart> getByUserID(int id) {
		return  getSession().createQuery(//
				"FROM Heart h WHERE  h.user.id=?")//
				.setParameter(0, id)//
				.list();
	}
}
