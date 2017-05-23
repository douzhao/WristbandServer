package cn.zzuli.app.view.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.zzuli.app.base.BaseAction;

@Controller
@Scope("prototype")
public class PhyCondAction{
	
	private int id;
	
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
