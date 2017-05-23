package cn.zzuli.app.view.action;

import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.zzuli.app.base.BaseAction;
import cn.zzuli.app.domain.Position;
import cn.zzuli.app.domain.User;

@Controller
@Scope("prototype")
public class TraceReplayAction extends BaseAction<Position>{

	private int id;
	private String beginTime;
	private String endTime;
	
	public String traceReplayUI(){
		User userInfo = userService.getById(id);
		ActionContext.getContext().put("userInfo", userInfo);
		return "traceReplayUI";
	}
	
	public String getTraceReplayPositions(){
		List<Position> positions = positionService.getPositions(id,beginTime,endTime);
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.setExcludes(new String[]{"user"});  
		JSON json = JSONSerializer.toJSON(positions, jsonConfig); 
		result = (JSONArray) json;
		return "success";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
}
