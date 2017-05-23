package cn.zzuli.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.zzuli.app.base.BaseDaoImpl;
import cn.zzuli.app.domain.Area;
import cn.zzuli.app.domain.User;
import cn.zzuli.app.service.UserService;

@Service
@SuppressWarnings("unchecked")
public class UserServiceImpl extends BaseDaoImpl<User> implements UserService {

	public List<User> findUserList(String areaId) {
		return getSession().createQuery(//
				"FROM User u WHERE u.area.areaId LIKE :param")//
				.setString("param", areaId+"%")
				.list();
	}

	public User getByLoginNameAndPassword(String loginName, String password) {
		return (User) getSession().createQuery(//
				"FROM User u WHERE u.loginName=? AND u.password=?")//
				.setParameter(0, loginName)//
				.setParameter(1, password)//
				.uniqueResult();
	}

	public List<User> findByPageApp(int start, int number) {
		return getSession().createQuery(//
				"FROM User u WHERE u.id>? AND u.id<=?")//
				.setParameter(0, start)//
				.setParameter(1, start+number)//
				.list();
	}

	public Area getAreaByUserId(int id) {
		return  (Area) getSession().createQuery(
				"SELECT u.area FROM User u WHERE u.id=?")
				.setParameter(0, id)
				.uniqueResult();
	}

	public Area getCityById(int id) {
		return  (Area) getSession().createQuery(
				"SELECT u.area.parent FROM User u WHERE u.id=?")
				.setParameter(0, id)
				.uniqueResult();
	}

	public Area getProvinceById(int id) {
		return  (Area) getSession().createQuery(
				"SELECT u.area.parent.parent FROM User u WHERE u.id=?")
				.setParameter(0, id)
				.uniqueResult();
	}

}
