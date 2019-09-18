package service;

import java.util.List;

public interface FssService {
	public String cs();
	//获得分页列表
	public List getTableList(String voName, int currPage, int pageCount);
	//获得总行数
	public Integer DataCount(String voName);
	//改变状态
	public boolean changeState(String voName, String state, String id);
	//保存添加
	public boolean SaveVo(Object obj);
	//修改
	public boolean UpdateVo(Object obj);
	//获得条件搜索分页列表
	public List getSearchList(String voName,String column,String chars,int currPage, int pageCount);
	//获得条件搜索的表的所有列名称
	public List getTableColumns(String tableName);
	//获得搜索的存在的总行数
	public Integer SearchDataCount(String voName,String column,String chars);
}
