package service;

import java.util.List;

public interface FssService {
	public String cs();
	//��÷�ҳ�б�
	public List getTableList(String voName, int currPage, int pageCount);
	//���������
	public Integer DataCount(String voName);
	//�ı�״̬
	public boolean changeState(String voName, String state, String id);
	//�������
	public boolean SaveVo(Object obj);
	//�޸�
	public boolean UpdateVo(Object obj);
	//�������������ҳ�б�
	public List getSearchList(String voName,String column,String chars,int currPage, int pageCount);
	//������������ı������������
	public List getTableColumns(String tableName);
	//��������Ĵ��ڵ�������
	public Integer SearchDataCount(String voName,String column,String chars);
}
