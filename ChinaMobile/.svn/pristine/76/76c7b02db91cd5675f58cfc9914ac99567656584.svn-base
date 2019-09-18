package service.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import common.Hibernate_Dao;
import service.FssService;

public class FssServiceimpl extends Hibernate_Dao implements FssService {
	public String cs() {
		// TODO Auto-generated method stub
		return "fssserviceImpl";
	}

	@Override
	// 获得总行数
	public Integer DataCount(String voName) {
		return DataCount_Dao(voName);
	}

	@Override
	// 分页获得表数据
	public List getTableList(String voName, int currPage, int pageCount) {
		// TODO Auto-generated method stub
		return pageByHQL("from " + voName + " order by id asc", currPage,
				pageCount);
	}

	@Override
	// 改变状态
	public boolean changeState(String voName, String state, String id) {
		return ChangeState_Dao(voName, state, id);
	}

	@Override
	// 添加数据
	public boolean SaveVo(Object obj) {
		return Save_Dao(obj);
	}

	@Override
	// 修改数据
	public boolean UpdateVo(Object obj) {
		// TODO Auto-generated method stub
		return Update_Dao(obj);
	}
	//获得条件搜索分页列表
	@Override
	public List getSearchList(String voName,String column,String chars,int currPage, int pageCount) {
		// TODO Auto-generated method stub
		return getSearchList_Dao("from "+voName+" where concat("+column+") like '"+chars+"'", currPage, pageCount);
	}
	//获得条件搜索的表的所有列名称
	@Override
	public List getTableColumns(String tableName) {
		// TODO Auto-generated method stub
		return getTableColumns_Dao(tableName);
	}
	
	@Override
	public Integer SearchDataCount(String voName,String column,String chars) {
		// TODO Auto-generated method stub
		return DataCount_Dao(voName+" where concat("+column+") like '"+chars+"'");
	}
}
