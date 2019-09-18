package service.impl;

import java.util.ArrayList;
import java.util.List;

import common.Hibernate_Dao;
import service.gjservice;
import vo.ChildOrderVo;
import vo.MainOrderVo;
import vo.ManagerVo;
import vo.RotationImageVo;
import vo.UsersVo;
import vo.WareFlashSaleVo;
import vo.WareVo;

public class gjserviceImpl extends Hibernate_Dao implements gjservice {
	public String cs() {
		// TODO Auto-generated method stub
		return "gjserviceImpl";
	}

	@Override
	public List selRotationlmage() {

		return sel("from RotationImageVo");
	}

	@Override
	public List selware(String w, String rn) {
		List list = new ArrayList();
		list = sel("from WareVo where " + w + "='" + rn + "'");
		return list;
	}

	@Override
	public List selgroup() {
		// TODO Auto-generated method stub
		return sel("from WareVo where type='抢购'");
	}

	// where rownum<4 order by sale_count
	@Override
	public List selwarebycount() {
		// TODO Auto-generated method stub
		return sel("from WareVo");
	}

	@Override
	public List selwarebystock() {
		// TODO Auto-generated method stub
		return sel("from WareVo order by stock_count ");
	}

	@Override
	public List selphonenumber(String type) {
		// TODO Auto-generated method stub
		return sel("from PhoneNumberVo where type= '" + type + "' ");
	}

	@Override
	public List selphonesetmeal() {
		// TODO Auto-generated method stub
		return sel("from PhoneSetMealVo");
	}

	@Override
	public List selnotice(String type) {
		// TODO Auto-generated method stub
		return sel("from NoticeVo where type= '" + type + "' ");
	}

	@Override
	public UsersVo seluser(UsersVo m) {
		// TODO Auto-generated method stub
		return (UsersVo) selobjunique("from UsersVo g where g.phone_number='"
				+ m.getName() + "' and g.password='" + m.getPassword() + "'");
	}

	@Override
	public ChildOrderVo selchildorder(Integer id) {

		return (ChildOrderVo) selbyid("from ChildOrderVo where id=" + id);
	}

	@Override
	public MainOrderVo selbymainid(Integer mainid) {
		// TODO Auto-generated method stub
		return (MainOrderVo) selbyid("from ChildOrderVo where main_order_id="
				+ mainid);
	}
	
	@Override
	public List selactivity() {
		// TODO Auto-generated method stub
		return sel("from ActivityVo");
	}

	// 查询限时抢购
	public WareFlashSaleVo selxsqg() {
		return (WareFlashSaleVo) selbyid("from WareFlashSaleVo where state='启用'");
	}

	// 查询秒杀
	public WareFlashSaleVo selms() {
		return (WareFlashSaleVo) selbyid("from WareFlashSaleVo where state='启用'");
	}

	// 根据id查询商品
	public WareVo selwarebyid(Integer id) {
		// TODO Auto-generated method stub
		return (WareVo) selbyid("from WareVo where id=" + id);
	}

	@Override
	// 获得团购商品列表
	public List GWareList(String sql, int currpage, int pagecount) {
		return pageBySQL(sql, currpage, pagecount);
	}

	@Override
	// 获得列表
	public List TableList(String voName) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().find("from " + voName + " order by name");
	}

	// 获得团购商品数据条数
	@Override
	public Integer GWareCount(String sql) {
		return GWDataCount_Dao(sql);
	}

	// 获得总数据条数
	@Override
	public Integer DataCount(String voName) {
		return DataCount_Dao(voName);
	}

	// 根据ID和VO名查询
	@Override
	public Object selById(String voName, Integer id) {
		// TODO Auto-generated method stub

		return selbyid("from " + voName + " where id=" + id);
	}

	// 获得收货地址
	public Object getAddress(String voName, Integer id) {
		// TODO Auto-generated method stub

		return selbyid("from " + voName + " where user_id=" + id);
	}

	// 根据条件查询
	@Override
	public List selByCondition(String voName, String condition) {
		// TODO Auto-generated method stub
		return sel("from " + voName + " " + condition);
	}
	//获得团购详细内容
	@Override
	public List getGroupDetail(Integer ware_id, Integer currPage,
			Integer pageCount) {
		return pageBySQL(
				"select wc.*,u.name,u.face from(select c.* from user_comment c left join ware w on w.id=c.ware_id where c.state='启用' and c.ware_id="
						+ ware_id
						+ " order by datetime)wc  left join users u on u.id=wc.user_id",
				currPage, pageCount);
	}
	//获得主订单
	@Override
	public List getMainOrder(Integer id) {
		// TODO Auto-generated method stub
		return pageBySQL(
				"select m.*,b.address from main_order m , business_hall b where b.id=m.business_hall_id and m.user_id="
						+ id, 1, 9999);
	}
	//获得子订单
	@Override
	public List getChildOrder(String id) {
		// TODO Auto-generated method stub
		return pageBySQL(
				"select c.*,w.photo,w.name,wc.color,wc.price as cprice,w.introduction from child_order c,ware w,ware_color wc where w.id=c.ware_id and c.main_order_id ="
						+ id + " and wc.id=c.colorid", 1, 9999);
	}
	//修改对象
	@Override
	public void updateVo(Object obj) {
		// TODO Auto-generated method stub
		Update_Dao(obj);
	}
	//获得用户所有评论
	@Override
	public List getUserComment(Integer id) {
		// TODO Auto-generated method stub
		return pageBySQL("select c.*,w.introduction,w.price from user_comment c,ware w where w.id= c.ware_id and c.user_id="+id, 1, 9999);
	}
}
