package service;

import java.util.List;

import vo.ChildOrderVo;
import vo.MainOrderVo;
import vo.ManagerVo;
import vo.UsersVo;
import vo.WareFlashSaleVo;
import vo.WareVo;

public interface gjservice {
	public String cs();

	// ��ѯ�ֲ�ͼ
	public List selRotationlmage();

	// ��ѯ��Ʒ��
	public List selware(String w, String nr);

	// ��ѯ���Ź������Ʒ
	public List selgroup();

	// ����������ѯ��Ʒ
	public List selwarebycount();

	// ���ݿ���ѯ��Ʒ
	public List selwarebystock();

	// ��ѯ�绰�����
	public List selphonenumber(String type);

	// ��ѯ�绰�ײͱ�
	public List selphonesetmeal();

	// ��ѯ��������
	public List selnotice(String type);

	// �û���¼
	public UsersVo seluser(UsersVo m);

	// ����id��ѯ�Ӷ�����
	public ChildOrderVo selchildorder(Integer id);

	// ����������id��ѯ����Ӧ�Ķ���
	public MainOrderVo selbymainid(Integer mainid);

	// ��ѯ���
	public List selactivity();

	// ��ѯ��ʱ����
	public WareFlashSaleVo selxsqg();

	// ��ѯ��ɱ
	public WareFlashSaleVo selms();

	// ����id��ѯ��Ʒ
	public WareVo selwarebyid(Integer id);

	public List GWareList(String sql, int currPage, int PageCount);

	public Integer GWareCount(String sql);

	public List TableList(String voName);

	public Integer DataCount(String voName);

	public Object selById(String voName, Integer id);

	public Object getAddress(String voName, Integer user_id);

	public List selByCondition(String voName, String condition);

	public List getGroupDetail(Integer ware_id, Integer currPage,
			Integer pageCount);

	public List getMainOrder(Integer id);

	public List getChildOrder(String id);
	
	public void updateVo(Object obj);
	
	public List getUserComment(Integer user_id);
}