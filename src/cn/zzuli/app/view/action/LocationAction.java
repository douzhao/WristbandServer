package cn.zzuli.app.view.action;

import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zzuli.app.base.BaseAction;
import cn.zzuli.app.domain.Area;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class LocationAction extends BaseAction<Area> {

	public String getAreaList(){
		List<Area> areaListData = null;
		if(model.getAreaId() == null){
			areaListData = areaService.findTopList();
		}else{
			areaListData = areaService.findChildrenList(model.getAreaId());
		}
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.setExcludes(new String[]{"users","parent","children"});  
		JSON json = JSONSerializer.toJSON(areaListData, jsonConfig); 
		result = (JSONArray) json;
		return "success";
	}
}
