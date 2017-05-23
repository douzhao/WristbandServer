package cn.zzuli.app.service;

import java.util.List;

import cn.zzuli.app.base.BaseDao;
import cn.zzuli.app.domain.Area;
import cn.zzuli.app.domain.User;

public interface UserService extends BaseDao<User> {

	List<User> findUserList(String areaId);

	User getByLoginNameAndPassword(String loginName, String password);

	List<User> findByPageApp(int start, int number);

	Area getAreaByUserId(int id);

	Area getCityById(int id);

	Area getProvinceById(int id);

}
