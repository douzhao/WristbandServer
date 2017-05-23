package cn.zzuli.app.view.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.zzuli.app.base.BaseAction;
import cn.zzuli.app.domain.Area;
import cn.zzuli.app.domain.User;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {

	private String code;
	private String rows;
	private String page;
	private JSONObject list =  new JSONObject();
	
	public String getUsersList(){
		List<User> userListData = userService.findUserList(code);
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.setExcludes(new String[]{"area","positions"});  
		JSON json = JSONSerializer.toJSON(userListData, jsonConfig); 
		result = (JSONArray) json;
		return "success";
	}
	
	public String usersListUI(){
		return "usersListUI";
	}
	
	public String usersList(){
		
		//当前页
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);  
        //每页显示条数  
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows);  
        //每页的开始记录  第一页为1  第二页为number +1   
        int start = (intPage-1)*number;  
           
        List<User> userList = userService.findByPageApp(start,number);//每页的数据，放入list  
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.setExcludes(new String[]{"area","positions"});  
		JSON json = JSONSerializer.toJSON(userList, jsonConfig); 
		list.put("total", userService.findAll().size());
		list.put("rows", (JSONArray) json);
		return "tsuccess";
	}
	
	public String checkPersonInforUI(){
		Area area=userService.getAreaByUserId(model.getId());
		Area city=userService.getCityById(model.getId());
		Area province=userService.getProvinceById(model.getId());
		
		List<Area> provinces=areaService.findTopList();
		List<Area> citys=areaService.findChildrenList(province.getAreaId());
		List<Area> areas=areaService.findChildrenList(city.getAreaId());
		
		ActionContext.getContext().put("province", province);
		ActionContext.getContext().put("city", city);
		ActionContext.getContext().put("area", area);
		
		ActionContext.getContext().put("provinces", provinces);
		ActionContext.getContext().put("citys", citys);
		ActionContext.getContext().put("areas", areas);
		
		return "checkPersonInforUI";
	}
	
	public String updatePasswordUI(){
		return "updatePasswordUI";
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public JSONObject getList() {
		return list;
	}
	public void setList(JSONObject list) {
		this.list = list;
	}
}
