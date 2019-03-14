package com.dj.demo.service;

import java.util.List;
import java.util.Map;

import com.dj.demo.model.FrsDatas;

public interface FrsDataService {

	public List<FrsDatas> getDatas(FrsDatas fds);

	public List<FrsDatas> queryDatas(FrsDatas frs);

	public boolean addSets(FrsDatas fds);

	public FrsDatas getSettingDatas();

	public int getFRSOutDeal(FrsDatas fdd, String string);

	public int getSets();

	public void updateSets(FrsDatas fds);

	public void insertSets(FrsDatas fds);

	public int findDid(String did);

	public List<FrsDatas> getAll();

	public List<FrsDatas> findSameParts_code(Map<String, Object> map);

	public void addTemp(List<FrsDatas> ls);

	public List<FrsDatas> getList(Map<String, Object> map);

	public void deleteDatas(String lineName);

	public List<FrsDatas> getListByDid(String did);

	public FrsDatas getGcode(String did);

	public void deleteDid(String did, String string);

	public void operateTemp(String lineName, List<FrsDatas> ls);

	public String getBasicNum();
}
