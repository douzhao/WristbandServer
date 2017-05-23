package cn.zzuli.app.test;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class TestAction extends ActionSupport{

	@Resource
	private TestService testService;
	public String execute() throws Exception{
		testService.saveTwoUsers();
		return "success";
	}
}
