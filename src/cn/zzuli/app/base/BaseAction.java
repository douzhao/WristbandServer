package cn.zzuli.app.base;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import cn.zzuli.app.service.AreaService;
import cn.zzuli.app.service.HeartService;
import cn.zzuli.app.service.PositionService;
import cn.zzuli.app.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T> {

	@Resource
	protected UserService userService;
	@Resource
	protected HeartService heartService;
	@Resource
	protected AreaService areaService;
	@Resource
	protected PositionService positionService;
	
	protected T model;
	
	protected JSONArray result;

	public BaseAction() {
		try {
			// 得到model的类型信息
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class clazz = (Class) pt.getActualTypeArguments()[0];

			// 通过反射生成model的实例
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public T getModel() {
		return model;
	}

	public JSONArray getResult() {
		return result;
	}

	public void setResult(JSONArray result) {
		this.result = result;
	}
	
}
