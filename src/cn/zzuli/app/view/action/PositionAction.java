package cn.zzuli.app.view.action;

import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zzuli.app.base.BaseAction;
import cn.zzuli.app.domain.Position;

@Controller
@Scope("prototype")
public class PositionAction extends BaseAction<Position>{
	
	public int id;
	
	public String getPosition(){
		List<Position> position=positionService.getByUserID(id);
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.setExcludes(new String[]{"user"});  
		JSON json = JSONSerializer.toJSON(position, jsonConfig); 
		result = (JSONArray) json;
		return "success";
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
