package cn.zzuli.app.domain;

import java.util.HashSet;
import java.util.Set;

public class Area {

	private int id;
	private String areaId;
	private Set<User> users = new HashSet<User>();
	private Area parent;
	private Set<Area> children = new HashSet<Area>();
	private String areaName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Area getParent() {
		return parent;
	}
	public void setParent(Area parent) {
		this.parent = parent;
	}
	public Set<Area> getChildren() {
		return children;
	}
	public void setChildren(Set<Area> children) {
		this.children = children;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
}
