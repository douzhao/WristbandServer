package cn.zzuli.app.base;

import java.util.List;

public interface BaseDao<T> {
	
	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	void save(T entity);

	/**
	 * 删除实体
	 * 
	 * @param id
	 */
	void delete(int id);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 */
	void update(T entity);

	/**
	 * 查询实体，如果id为null，则返回null，并不会抛异常。
	 * 
	 * @param id
	 * @return
	 */
	T getById(int id);

	/**
	 * 查询实体
	 * 
	 * @param ids
	 * @return
	 */
	List<T> getByIds(int[] ids);

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	List<T> findAll();

}
