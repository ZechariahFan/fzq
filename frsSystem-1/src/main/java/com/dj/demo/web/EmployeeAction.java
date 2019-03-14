package com.dj.demo.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.demo.model.Operator;
import com.dj.demo.service.OperatorService;
import com.google.gson.annotations.SerializedName;

@Controller
public class EmployeeAction {

	@Autowired
	private OperatorService ops;
	
	@ResponseBody
	@RequestMapping("/checkEmployee")
	public String checkEmployee(HttpSession session,Operator op)
	{
		int res = ops.checkEmployeeService(op);
		if(res>0)
		{
			String operator = op.getOperator();
			if(operator.length()>6) {
				String op1 = operator.substring(3, operator.length()-1);
				System.out.println(op1);
				op.setOperator(op1);
			}
			session.setAttribute("operator", op.getOperator());
			return "ok";
		}
		else
		{
			return "error";
		}
	}
}
