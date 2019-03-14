package com.dj.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dj.demo.dao.OperatorDao;
import com.dj.demo.model.Operator;
import com.dj.demo.service.OperatorService;

@Service
public class OperatorServiceImpl implements OperatorService {

	@Autowired
	private OperatorDao opd;
	
	public int checkEmployeeService(Operator op) {
		// TODO Auto-generated method stub
		int row = opd.checkOperatorDao(op);
		return row;
	}

}
