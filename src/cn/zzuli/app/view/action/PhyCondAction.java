package cn.zzuli.app.view.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zzuli.app.base.BaseAction;
import cn.zzuli.app.domain.Heart;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class PhyCondAction extends BaseAction<Heart>{
	
	private int id;
	
	public String heartChartJson()
	{
		List<Heart> heart= heartService.getByUserID(1);
		System.out.println("\nresult num =\n"+heart.size());
		System.out.println("\nresult num =\n"+heart.get(0).getFre());
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.setExcludes(new String[]{"user"}); 
		JSON json = JSONSerializer.toJSON( heart, jsonConfig); 
		result = (JSONArray) json;
		return "success";
		
	}
	public String heartRateUI(){
		System.out.println("id="+getId());
		return "heartRateUI";
	}

	public String hinkingUI(){
		
		return "hinkingUI";
	}

	public String bloodPressureUI(){
		
		return "bloodPressureUI";
	}
	
	public String sleepUI(){
		
		return "sleepUI";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
