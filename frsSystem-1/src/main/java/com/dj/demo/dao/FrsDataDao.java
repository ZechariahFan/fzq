package com.dj.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dj.demo.model.FrsDatas;

public interface FrsDataDao {

	public List<FrsDatas> getDatas(Map<String, Object> map);

	public int addSets(FrsDatas fds);

	public FrsDatas getSettingDatas();

	public void getFRSOutDeal(Map<String, Object> map);

	public int getSets();

	public void updateSets1(FrsDatas fds);

	public void insertSets(FrsDatas fds);

	public int findDid(String did);

	public List<FrsDatas> getAll();

	public String getGcode(String did);

	public String getVrack_position(String did);

	public void insertSql(FrsDatas fdd);

	public String getQty(String did);

	public List<FrsDatas> findSameParts_code(Map<String, Object> m);

	public void addTemp( List<FrsDatas> ls);

	public List<FrsDatas> getList(Map<String, Object> m);

	public void deleteDatas(@Param("lineName") String lineName);

	public List<FrsDatas> getListByDid(@Param("did")String did);

	public FrsDatas  getGcodeByRackInfo(@Param("did")String did);

	public void deleteDid(String did, @Param("lineName") String lineName);

	public String getBasicNum();

}
