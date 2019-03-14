package com.dj.demo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dj.demo.dao.FrsDataDao;
import com.dj.demo.model.FrsDatas;
import com.dj.demo.service.FrsDataService;
@Service
public class FrsDataServiceImpl implements FrsDataService {

	@Autowired
	private FrsDataDao fd;
	
//	@Transactional(propagation=Propagation.SUPPORTS,isolation=Isolation.READ_COMMITTED)
	public List<FrsDatas> getDatas(FrsDatas fds) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("line", fds.getLine_name());
		if(fds.getLimit_board()!=null&&fds.getLimit_board()!="")
		{
			map.put("num", Integer.parseInt(fds.getLimit_board()));
		}
		else {
			map.put("num",500);
		}
		if(fds.getLimit_length()!=null&&fds.getLimit_length()!="")
		{
			map.put("llen", Integer.parseInt(fds.getLimit_length()));
		}
		else {
			map.put("llen", 0);
		}
		if(fds.getLimit_time()!=null&&fds.getLimit_time()!="")
		{
			map.put("times", Integer.parseInt(fds.getLimit_time()));
		}
		else {
			map.put("times", 0);
		}
		map.put("result", new ArrayList<FrsDatas>());
		fd.getDatas(map);
		List<FrsDatas> lf=(List<FrsDatas>) map.get("result");
		return lf;
	}
	public List<FrsDatas> queryDatas(FrsDatas frs) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("line", frs.getLine_name());
		map.put("num", Integer.parseInt(frs.getLimit_board()));
		map.put("limitBoard", Integer.parseInt(frs.getLimit_board()));
		map.put("result", new ArrayList<FrsDatas>());
		List<FrsDatas> fdf=(ArrayList<FrsDatas>)map.get("result");
		return fdf;
	}
	public boolean addSets(FrsDatas fds) {
		// TODO Auto-generated method stub
		int row=fd.addSets(fds);
		if(row>0) {
			return true;
		}
		return false;
	}
	public FrsDatas getSettingDatas() {
		// TODO Auto-generated method stub
		FrsDatas fd1=fd.getSettingDatas();
		return fd1;
	}
	public int getFRSOutDeal(FrsDatas fdd,String operator) {
		// TODO Auto-generated method stub
		//--获取VG_CODE
//		String g_code=fd.getGcode(fdd.getDid());
//		// --获取VRACK_POSITION--
//		String vrack_position=fd.getVrack_position(fdd.getDid());
//		//--获取QTY--
//		String qty = fd.getQty(fdd.getDid());
//		//--插入操作
//		fdd.setParts_code(g_code);
//		fdd.setRackposition(vrack_position);
//		fdd.setParts_qty(qty);
//		fd.insertSql(fdd);
		///*已经备好部品的操作*/
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("line_name", fdd.getLine_name());
		map.put("limit_borard", fdd.getLimit_board());
		map.put("did", fdd.getDid());
		map.put("operator", operator);
		map.put("result", 10);
		fd.getFRSOutDeal(map);
		int fdf=(Integer)map.get("result");
		return fdf;
	}
	public int getSets() {
		// TODO Auto-generated method stub
		int settingDatas = fd.getSets();
		return settingDatas;
	}
	public void updateSets(FrsDatas fds) {
		// TODO Auto-generated method stub
		fd.updateSets1(fds);
	}
	public void insertSets(FrsDatas fds) {
		// TODO Auto-generated method stub
		fd.insertSets(fds);
	}
	@Transactional(propagation=Propagation.SUPPORTS,isolation=Isolation.READ_COMMITTED)
	public int findDid(String did) {
		// TODO Auto-generated method stub
		int res=fd.findDid(did);
		return res;
	}
	@Transactional(propagation=Propagation.SUPPORTS,isolation=Isolation.READ_COMMITTED)
	public List<FrsDatas> getAll() {
		// TODO Auto-generated method stub
		return fd.getAll();
	}
	@Transactional(propagation=Propagation.SUPPORTS,isolation=Isolation.READ_COMMITTED)
	public List<FrsDatas> findSameParts_code(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return fd.findSameParts_code(m);
	}
	public void addTemp(List<FrsDatas> ls) {
		// TODO Auto-generated method stub
		fd.addTemp(ls);
	}
	@Transactional(propagation=Propagation.SUPPORTS,isolation=Isolation.READ_COMMITTED)
	public List<FrsDatas> getList(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return fd.getList(m);
	}
	public void deleteDatas(String lineName) {
		// TODO Auto-generated method stub
		fd.deleteDatas(lineName);
	}
	@Transactional(propagation=Propagation.SUPPORTS,isolation=Isolation.READ_COMMITTED)
	public List<FrsDatas> getListByDid(String did) {
		// TODO Auto-generated method stub
		return fd.getListByDid(did);
	}
	public FrsDatas getGcode(String did) {
		// TODO Auto-generated method stub
		return fd.getGcodeByRackInfo(did);
	}
	
	public void deleteDid(String did,String lineName) {
		// TODO Auto-generated method stub
		 fd.deleteDid(did,lineName);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.READ_COMMITTED)
	public void operateTemp(String lineName, List<FrsDatas> ls) {
		// TODO Auto-generated method stub
		fd.deleteDatas(lineName);
		fd.addTemp(ls);
	}
	public String getBasicNum() {
		// TODO Auto-generated method stub
		return fd.getBasicNum();
	}

}
