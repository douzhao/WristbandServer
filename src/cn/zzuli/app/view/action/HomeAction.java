package cn.zzuli.app.view.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.zzuli.app.base.BaseAction;
import cn.zzuli.app.domain.User;

@Controller
@Scope("prototype")
public class HomeAction extends BaseAction<User> {
	
	public String login(){
		User user = userService.getByLoginNameAndPassword(model.getLoginName(),model.getPassword());
		if (user == null) {
			addFieldError("login", "用户或密码不正确");
			return "loginUI";
		} else {
			// 正确就登录用户
			ActionContext.getContext().getSession().put("user", user);
			 //可以用来控制不同登陆者权限 
			//if(model.getLoginName().equals("123"))
		      return "toIndex";
		   //else
		  //return "PT";
				
		}
	}
	
	public String loginUI(){
		return "loginUI";
	}

}
