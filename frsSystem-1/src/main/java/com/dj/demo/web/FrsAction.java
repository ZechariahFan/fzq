package com.dj.demo.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.StyleContext.SmallAttributeSet;

import org.omg.CORBA.FREE_MEM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dj.demo.model.FrsDatas;
import com.dj.demo.service.FrsDataService;

@Controller
public class FrsAction {

	@Autowired
	 FrsDataService frds;
	
	
	@RequestMapping("/to_frs")
	public String to_frs()
	{
		return "frs";
	}
	
	@ResponseBody
	@RequestMapping(value="/getSets",method=RequestMethod.POST)
	public Map<String,Object>getSets(){
		FrsDatas datas = frds.getSettingDatas();
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("da", datas);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/getDatas",method=RequestMethod.POST)
	public Map<String,Object> getDatas(HttpSession session,FrsDatas fds)
	{

		FrsDatas ff=frds.getSettingDatas();
			fds.setLimit_board(ff.getBasicNum());
			fds.setLimit_length(ff.getLimit_length());
			fds.setLimit_time(ff.getLimit_time());
		String rackid=(String)session.getAttribute("rackid");
		Map<String,Object> map=new HashMap<String, Object>();
		String pp="";
		try {
			if(fds.getPp()!=null) {
				pp=URLDecoder.decode(fds.getPp(),"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("fds", fds);
		//获得之前设置的值
		
		//获得下拉列表中的条件
		List<FrsDatas> datas = frds.getDatas(fds);
		
		List<FrsDatas> fd=new ArrayList<FrsDatas>();
		List<FrsDatas> fd1=new ArrayList<FrsDatas>();
		if(ff!=null) {
			
			fd= addDatas(datas,ff);
			fd1=handleDatas(fd,fds.getLine_name(),rackid);
			map.put("data", fd1);
			map.put("v", pp);
			session.setAttribute("fd1", fd1);
			return map;	
		}
		else {
			fd1=handleDatas(datas,fds.getLine_name(),rackid);
			map.put("data", fd1);
			map.put("v", pp);
			session.setAttribute("fd1", fd1);
			return map;
		}
		
		
	}
	
	public List<FrsDatas> handleDatas(List<FrsDatas> datas, String lineName, String rackId)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		String[] split=null;
		if(rackId!=null && rackId!="") {
			 split = rackId.split(";");			 
		}
		map.put("rackId", split);
//		List<FrsDatas> ls = new ArrayList<FrsDatas>();
//		TreeMap<String, Integer> map2=new TreeMap<String, Integer>();
//		Map<String,Integer> map3 = new HashMap<String, Integer>();
//		Set set= map2.keySet();
//		boolean flag=false;
//		int y=0;
//		//将每一个parts_code的个数放入map中作为值
//		for (FrsDatas frsDatas : datas) {
//			
//			if(!map2.isEmpty())
//			{
//				for(Iterator iter =set.iterator();iter.hasNext();)
//				{
//					String key=(String) iter.next();
//					Integer value=(Integer)map2.get(key);
//					if(key.equals(frsDatas.getParts_code())) {
//						//map2.put(frsDatas.getParts_code(), ++value);
//						map.put("g_code", frsDatas.getParts_code());
//						List<FrsDatas> sameParts_code=frds.findSameParts_code(map);
//						if(sameParts_code.size()>0)
//						{
//							for (int i=0;i<sameParts_code.size();i++ ) {
//								Integer v = map3.get(sameParts_code.get(i).getRackposition());
//								if(v!=null&&v==1) {
//									continue;
//								}
//								if(sameParts_code.get(i).getRackposition().equals(frsDatas.getRackposition())) {
//									continue;
//								}
//								else {
//									FrsDatas fs = new FrsDatas();
//									fs.setBasicNum(frsDatas.getBasicNum());
//									fs.setUpd_did(frsDatas.getUpd_did());
//									fs.setParts_code(frsDatas.getParts_code());
//									fs.setRackposition(sameParts_code.get(i).getRackposition());
//									fs.setLine_name(frsDatas.getLine_name());
//									fs.setDid(frsDatas.getDid());
//									fs.setLimit_board(frsDatas.getLimit_board());
//									fs.setLimit_length(frsDatas.getLimit_length());
//									fs.setParts_qty(frsDatas.getParts_qty());
//									fs.setMac_code(frsDatas.getMac_code());
//									fs.setTblno(frsDatas.getTblno());
//									ls.add(fs);
//										Integer v1 = map2.get(sameParts_code.get(i).getParts_code());
//										map3.put(sameParts_code.get(i).getRackposition(), 1);
//										 break;
//								}
//							}
//							sameParts_code.clear();
//						}
//						flag=true;
//						break;
//					}
//					else
//					{
//						flag=false;
//					}
//				}
//				if(flag==false) {
//					map2.put(frsDatas.getParts_code(), 1);
//					ls.add(frsDatas);
//					map3.put(frsDatas.getRackposition(), 1);
//				}
//			}
//			else {
//				map3.put(frsDatas.getRackposition(), 1);
//				map2.put(frsDatas.getParts_code(), 1);
//				ls.add(frsDatas);
//			}
//		}
		
		if(datas.size()>0)
		{
			frds.operateTemp(lineName,datas);
			//frds.deleteDatas(lineName);
			//frds.addTemp(ls);
			map.put("lineName", lineName);
			datas=frds.getList(map);
		}
		
		
		return datas;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/refreshDatas",method=RequestMethod.POST)
	public Map<String,Object> refreshDatas(HttpSession session,FrsDatas fds)
	{
		FrsDatas ff=frds.getSettingDatas();
		FrsDatas ff1=(FrsDatas)session.getAttribute("fds");
		if(ff1==null) {
			fds.setLine_name("01");
			fds.setLimit_board(ff.getBasicNum());
		}
		else {
			fds.setLine_name(ff1.getLine_name());
			fds.setLimit_board(ff1.getLimit_board());
		}
		String rackid=(String)session.getAttribute("rackid");
		Map<String,Object> map=new HashMap<String, Object>();
		String pp="";
		try {
			if(fds.getPp()!=null) {
				pp=URLDecoder.decode(fds.getPp(),"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("fds", fds);
		//获得之前设置的值
		
		//获得下拉列表中的条件
		List<FrsDatas> datas = frds.getDatas(fds);
		List<FrsDatas> fd=new ArrayList<FrsDatas>();
		List<FrsDatas> fd1=new ArrayList<FrsDatas>();
		if(ff!=null) {
			
			fd= addDatas(datas,ff);
			fd1=handleDatas(fd,fds.getLine_name(),rackid);
			map.put("data", fd1);
			map.put("v", pp);
			session.setAttribute("fd1", fd1);
			return map;	
		}
		else {
			fd1=handleDatas(datas,fds.getLine_name(),rackid);
			map.put("data", fd1);
			map.put("v", pp);
			session.setAttribute("fd1", fd1);
			return map;
		}
		
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/getDatas1")
	public Map<String,Object> getDatas1(HttpSession session,FrsDatas fds)
	{
		session.setAttribute("set", fds);
		if(fds.getRackId()!=null&&fds.getRackId()!="") {
			session.setAttribute("rackid", fds.getRackId());
		}
		FrsDatas fdd =(FrsDatas) session.getAttribute("fds");
		if(fds.getLine_name()==null||fds.getLine_name()=="") {
			fds.setLine_name("01");
		}
		fds.setLimit_board(fds.getBasicNum());
		List<FrsDatas> datas = frds.getDatas(fds);
		Map<String,Object> map1=new HashMap<String,Object>();
		//首先判断表中是否有数据，如果没有就添加，否则是更新
		int flag = frds.getSets();
		
		List<FrsDatas> fd=new ArrayList<FrsDatas>();
		if(flag>0) {
			if(fds.getBasicNum()!=null && fds.getBasicNum()!=""|| fds.getLimit_length()!=null &&fds.getLimit_length()!="" || fds.getLimit_time()!=null &&fds.getLimit_time()!="") {
				fd= addDatas(datas,fds);
				frds.updateSets(fds);
				map1.put("status", "12");
				fd=handleDatas(fd,fds.getLine_name(),fds.getRackId());
				map1.put("data", fd);
				session.setAttribute("fd1", fd);
			}
			else {
				frds.updateSets(fds);
				map1.put("status", "12");
				fd=handleDatas(datas,fds.getLine_name(),fds.getRackId());
				map1.put("data", fd);
				session.setAttribute("fd1", fd);
			}
			
		}
		else {
			if(fds.getBasicNum()!=null && fds.getBasicNum()!=""|| fds.getLimit_length()!=null &&fds.getLimit_length()!="" || fds.getLimit_time()!=null &&fds.getLimit_time()!="") {
				frds.insertSets(fds);
				fd= addDatas(datas,fds);
				map1.put("status", "12");
				datas=handleDatas(fd,fds.getLine_name(),fds.getRackId());
				map1.put("data", datas);
				session.setAttribute("fd1", datas);
			}
			else {
				map1.put("status", "12");
				datas=handleDatas(datas,fds.getLine_name(),fds.getRackId());
				map1.put("data", datas);
				session.setAttribute("fd1", datas);
			}
		}
		return map1;
	}
	
	
	@RequestMapping("/hideSelectedColumn")
	public String hideSelectedColumn()
	{
		return "hideColumn";
	}
	
	
	
	@RequestMapping("/to_frsHideColumn")
	public String to_frsHideColumn(String arr,Model req)
	{
		try {
			arr=URLDecoder.decode(arr,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.addAttribute("col", arr);
		return "frs";
	}
	
	@ResponseBody
	@RequestMapping("/FRSOutDeal")
	public Map<String,Object> FRSOutDeal(HttpSession session,String did,String pp)
	{
		long startTime=System.currentTimeMillis();
		boolean flag=false;
		String p="";
		try {
			if(pp!=null) {
				p=URLDecoder.decode(pp,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long startTime5=System.currentTimeMillis();
		int rows=frds.findDid(did);
		System.out.println("did"+(System.currentTimeMillis()-startTime5)*0.001);
		Map<String,Object> map = new HashMap<String, Object>();
		FrsDatas fdd =(FrsDatas) session.getAttribute("fds");
		int res=-1;
		
		
		List<FrsDatas> datas = new ArrayList<FrsDatas>();
		List<FrsDatas> fs=(List<FrsDatas>)session.getAttribute("fd1");
		long startTime3=System.currentTimeMillis();
		FrsDatas fff = frds.getGcode(did);
		System.out.println("Gcode"+(System.currentTimeMillis()-startTime3)*0.001);
		System.out.println(session.getAttribute("operator"));
		long startTime4=System.currentTimeMillis();
		if(fff!=null)
		{
			for (int i=0;i<fs.size();i++) {
				if(fs.get(i).getParts_code().equals(fff.getParts_code())&&fs.get(i).getRackposition().equals(fff.getRackposition())) {
					flag=true;
					fs.remove(i);
					break;
				}
			}
		}
		
		System.out.println("集合"+(System.currentTimeMillis()-startTime4)*0.001);
		if(rows>0&&flag)
		{
			if(fdd!=null) {
				fdd.setDid(did);
				long startTime2=System.currentTimeMillis();
				res=frds.getFRSOutDeal(fdd,(String)session.getAttribute("operator"));
				System.out.println("存储过程"+(System.currentTimeMillis()-startTime2)*0.001);
			}
			else {
				fdd.setLine_name("01");
				fdd.setLimit_board("100");
				fdd.setDid(did);
				long startTime2=System.currentTimeMillis();
				res=frds.getFRSOutDeal(fdd,(String)session.getAttribute("operator"));	
				System.out.println("存储过程"+(System.currentTimeMillis()-startTime2)*0.001);
			}
			//首先判断表中是否有数据，如果没有就添加，否则是更新
			//FrsDatas ff=frds.getSettingDatas();
			if(res==0) {
				//frds.deleteDid(did,fdd.getLine_name());
				//List<FrsDatas> list = frds.getList(fdd.getLine_name());
				
				map.put("status", res);
				map.put("data", fs);
				map.put("v", p);
			}
			else {
				//List<FrsDatas> list = frds.getList(fdd.getLine_name());
				map.put("status", res);
				map.put("data", fs);
				map.put("v", p);
			}
			
		}
		else {
			//List<FrsDatas> list = frds.getList(fdd.getLine_name());
			map.put("status", 5);
			map.put("data", fs);
			map.put("v", p);
		}
		System.out.println("出库用的总时间"+(System.currentTimeMillis()-startTime)*0.001);
		return map;
		
	}

	private List<FrsDatas> addDatas(List<FrsDatas> datas,FrsDatas fds)
	{
		List<FrsDatas> fd=new ArrayList<FrsDatas>();
		for (int i=datas.size()-1;i>=0;i--) {
				if(fds.getLimit_length()!=null&&fds.getLimit_length()!=""&&fds.getLimit_time()!=null&&fds.getLimit_time()!=""&&fds.getBasicNum()!=null&&fds.getBasicNum()!=""
						&&datas.get(i).getLimit_length()!=null&&datas.get(i).getLimit_length()!=""&&datas.get(i).getLimit_time()!=""&&datas.get(i).getLimit_time()!=null
						&&datas.get(i).getLimit_board()!=null&&datas.get(i).getLimit_board()!="") {
					if(Double.parseDouble(fds.getLimit_length())>Double.parseDouble(datas.get(i).getLimit_length().trim())
							||Integer.parseInt(datas.get(i).getLimit_time())<Integer.parseInt(fds.getLimit_time())
							||Integer.parseInt(datas.get(i).getLimit_board())<Integer.parseInt(fds.getBasicNum())) {
						fd.add(datas.get(i));
					}
				}
					
					else if(fds.getLimit_time()!=null&&fds.getLimit_time()!=""&&fds.getLimit_length()!=null&&fds.getLimit_length()!=""
							&&datas.get(i).getLimit_length()!=null&&datas.get(i).getLimit_length()!=""&&datas.get(i).getLimit_time()!=""&&datas.get(i).getLimit_time()!=null) {
					if(Integer.parseInt(datas.get(i).getLimit_time())<Integer.parseInt(fds.getLimit_time())
							||Double.parseDouble(fds.getLimit_length())>Double.parseDouble(datas.get(i).getLimit_length().trim())) {
						fd.add(datas.get(i));
					}
				}
					else if(fds.getBasicNum()!=null&&fds.getBasicNum()!=""&&fds.getLimit_time()!=null&&fds.getLimit_time()!=""
							&&datas.get(i).getLimit_time()!=""&&datas.get(i).getLimit_time()!=null
							&&datas.get(i).getLimit_board()!=null&&datas.get(i).getLimit_board()!="") {
					if(Integer.parseInt(datas.get(i).getLimit_board())<Integer.parseInt(fds.getBasicNum())
							||Integer.parseInt(datas.get(i).getLimit_time())<Integer.parseInt(fds.getLimit_time())) {
						fd.add(datas.get(i));
					}
					}
					else if(fds.getBasicNum()!=null&&fds.getBasicNum()!=""&&fds.getLimit_length()!=null&&fds.getLimit_length()!=""
							&&datas.get(i).getLimit_length()!=null&&datas.get(i).getLimit_length()!=""&&datas.get(i).getLimit_board()!=null&&datas.get(i).getLimit_board()!="") {
						if(Integer.parseInt(datas.get(i).getLimit_board())<Integer.parseInt(fds.getBasicNum())
								||Integer.parseInt(datas.get(i).getLimit_length())<Integer.parseInt(fds.getLimit_length())) {
							fd.add(datas.get(i));
						}
						}
					else if(fds.getLimit_length()!=null&&fds.getLimit_length()!=""&&datas.get(i).getLimit_length()!=null&&datas.get(i).getLimit_length()!="") {
						if(Double.parseDouble(fds.getLimit_length())>Double.parseDouble(datas.get(i).getLimit_length().trim())
								) {
							fd.add(datas.get(i));
						}
					}
					
					else if(fds.getLimit_time()!=null&&fds.getLimit_time()!=""&&datas.get(i).getLimit_time()!=""&&datas.get(i).getLimit_time()!=null) {
						if(Integer.parseInt(datas.get(i).getLimit_time())<Integer.parseInt(fds.getLimit_time())
								) {
							fd.add(datas.get(i));
						}
					}
					else if(fds.getBasicNum()!=null&&fds.getBasicNum()!=""&&datas.get(i).getLimit_board()!=null&&datas.get(i).getLimit_board()!="") {
						if(Integer.parseInt(datas.get(i).getLimit_board())<Integer.parseInt(fds.getBasicNum())
								) {
							fd.add(datas.get(i));
						}
					}
				}
				
		return fd;
	}
	
	
}
