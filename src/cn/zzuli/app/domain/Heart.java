package cn.zzuli.app.domain;

public class Heart {
private int heartId;
private String  time;
private int fre;
private User user;

public int getHeartId() {
	return heartId;
}
public void setHeartId(int heartId) {
	this.heartId = heartId;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public int getFre() {
	return fre;
}
public void setFre(int fre) {
	this.fre = fre;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
}
