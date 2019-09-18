package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSONObject;

import service.gjservice;
import vo.ChildOrderVo;
import vo.MainOrderVo;
import vo.PhoneNumberVo;
import vo.ReceiveAddressVo;
import vo.UsersVo;
import vo.WareFlashSaleVo;
import vo.WareGroupBuyingVo;
import vo.WareVo;

public class gjaction {
	JSONObject json = new JSONObject();

	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"config-resource/aplicationContext.xml");
	gjservice is = (gjservice) ac.getBean("gjService");

	// �ֻ�����
	PhoneNumberVo pn = new PhoneNumberVo();

	private Integer currpage;
	private Integer pagecount;
	// �û�����
	private UsersVo user;
	private String msg;// ��½ʧ�ܷ���һ����Ϣ
	private WareVo ware;
	private WareGroupBuyingVo group;
	private ReceiveAddressVo address;
	private List list;
	private Integer id;
	// �Ӷ���
	private ChildOrderVo child;

	// ������
	private MainOrderVo mains;
	// �ļ��ϴ�-��ز���
	private File[] imgs;
	private String[] imgsFileName;// +System.getProperty("file.separator")-
	private String savepath = ServletActionContext.getServletContext()
			.getRealPath("imgs") + System.getProperty("file.separator");
	private String[] imgsContentType;

	// -----------------------------����-------------------------
	public String list() {
		System.out.println("gjService");
		System.out.println(is.cs());
		return null;
	}

	// ��ѯ�ֲ�ͼ
	public String allRotationImage() {
		List rlist = is.selRotationlmage();
		json.put("rlist", rlist);
		// System.out.println(json.toJSONString());
		return "success";
	}

	// ��ѯ��Ʒ��
	public String selwares() {

		List tj = new ArrayList();
		tj = is.selware("tj", "����");
		// System.out.println(tj.size());
		List rx = new ArrayList();
		rx = is.selware("rx", "����");
		// System.out.println(rx.size());
		List xp = new ArrayList();
		xp = is.selware("xp", "����");
		// System.out.println(xp.size());

		List rp = new ArrayList();
		rp = is.selware("rp", "����");
		// System.out.println(rp.size());

		// ��ѯ״̬Ϊ��������Ʒ
		List qg = new ArrayList();
		qg = is.selware("type", "����");

		// ��ѯ�вμ��Ź������Ʒ
		List group = new ArrayList();
		group = is.selgroup();
		// System.out.println(group.size());
		System.out.println(1);
		// ����������ѯ��Ʒ
		List xl = new ArrayList();
		xl = is.selwarebycount();
		// System.out.println(xl.size());
		System.out.println(1);
		// ���ݿ���ѯ��Ʒ
		List kc = new ArrayList();
		kc = is.selwarebystock();
		System.out.println(1);
		json.put("tj", tj);

		json.put("rx", rx);
		json.put("xp", xp);
		json.put("rp", rp);
		json.put("tg", group);
		json.put("xl", xl);
		json.put("kc", kc);

		json.put("qg", qg);
		// System.out.println(tj.toString());
		return "success";
	}

	// ��ѯ�绰�����
	public String allphonenumber() {
		// System.out.println("��ѯ�绰�����");
		List list1 = is.selphonenumber("��ͨ");
		List list2 = is.selphonenumber("����");

		json.put("list1", list1);
		json.put("list2", list2);

		return "success";
	}

	// ��ѯ��������
	public String allnotice() {
		List list1 = is.selnotice("�̳ǹ���");
		List list2 = is.selnotice("�����");
		json.put("list1", list1);
		json.put("list2", list2);
		return "success";
	}

	// ��ѯ�绰�ײͱ�
	public String allpsm() {
		List list = is.selphonesetmeal();
		json.put("list", list);
		System.out.println(json.toJSONString());
		return "success";
	}

	// �û���¼
	public String userlogin() {
		System.out.println("�û���¼");
		if (user.getName() == null || user.getName().equals("")
				|| user.getPassword() == null || user.getPassword().equals("")) {
			msg = "�����Ƿ��������˺Ÿ����룡";
			// ʧ��ֱ�ӷ���ҳ��
			return "tologin";
		}

		UsersVo m = is.seluser(user);
		if (m == null) {
			// �����ݿ��̨û�в鵽���˻���ʱ�򣬷���null��ʱ���ڴ�һ��ֵȥǰ̨��ʾ
			msg = "�˺�������������ԣ�";
			return "tologin";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		// ���ҵ����󲢷�װ��session����
		session.setAttribute("m", m);
		session.setAttribute("user", m);
		System.out.println("��¼�ɹ���");
		System.out.println(m.getId());

		return "grzx";

	}

	// ��ѯ�Ӷ���
	public String childorder() {
		child = is.selchildorder(child.getId());

		// ����������id��ѯ����Ӧ�Ķ���
		mains = is.selbymainid(child.getMain_order_id());

		json.put("morder", mains);

		json.put("child", child);

		return "success";
	}

	// �ػ�ר��
	public String thzq() {
		List list = is.selactivity();

		// ��ʱ����
		WareFlashSaleVo xs = (WareFlashSaleVo) is.selxsqg();
		WareVo xsw = new WareVo();
		xsw = is.selwarebyid(xs.getWare_id());
		System.out.println("���" + xsw.getSale_count());

		// ��ɱ
		WareFlashSaleVo ms = (WareFlashSaleVo) is.selms();
		WareVo msw = new WareVo();
		msw = is.selwarebyid(ms.getWare_id());

		json.put("xs", xs);
		json.put("xsw", xsw);
		json.put("ms", ms);
		json.put("msw", msw);

		json.put("list", list);
		return "success";
	}

	// ��������������������������������������������������������˳����������������������������������������������������
	// �Ź�����json
	public String group() {
		List list = is.GWareList("select g.* ,w.name,w.price AS WARE_PRICE,w.photo "
								+ "from ware_group_buying g left join ware w on g.ware_id=w.id "
								+ "where g.state='����' and w.state='����' order by g.id",
						currpage, pagecount);
		Integer count = is.GWareCount("select count(*) from (select g.* ,w.name,w.price   AS WARE_PRICE,w.photo from ware_group_buying g left join ware w on g.ware_id=w.id where g.state='����'  and w.state='����' order by g.id)");
		json.put("data", list);
		json.put("count", count);
		System.out.println("����������������������������group����������������������������");
		System.out.println(json.toJSONString());
		return "success";
	}

	// ȥ�Ź��������
	public String toGroup() {
		System.out.println("����������������������������toGroup����������������������������");
		group = (WareGroupBuyingVo) is.selById("WareGroupBuyingVo", id);
		id = ware.getId();
		return "toGroup";
	}

	// ����Ź���Ʒ����
	public String groupDetail() {
		System.out.println("����������������������������groupDetail����������������������������");
		if (msg.equals("never")) {
			ware = (WareVo) is.selById("WareVo", id);
			int count = is
					.DataCount("UserCommentVo where state='����' and ware_id="
							+ id);
			int totalpage = (count - 1) / pagecount + 1;
			list = is.selByCondition("WareColorVo", "where ware_id=" + id);
			json.put("color", list);
			json.put("ware", ware);
			json.put("count", count);
			json.put("totalpage", totalpage);
		}
		list = is.getGroupDetail(id, currpage, pagecount);
		json.put("detail", list);
		System.out.println(json.toJSONString());
		return "success";
	}

	// ��ö���
	public String getOrder() {
		System.out.println("����������������������������getOrder����������������������������");
		List<Map> main = is.getMainOrder(id);
		for (Map m : main) {
			m.put("CHILD", is.getChildOrder(m.get("ID") + ""));
		}
		json.put("order", main);
		System.out.println(json.toJSONString());
		return "success";
	}

	// ����б�
	public String tableList() {
		List list = is.TableList(msg);
		json.put("data", list);
		System.out.println("����������������������������tableList����������������������������");
		System.out.println(json.toJSONString());
		return "success";
	}

	// ����û���������
	public String getUserComment() {
		json.put("comment", is.getUserComment(id));
		System.out.println(json.toJSONString());
		System.out.println("����������������������������getComment����������������������������");
		return "success";
	}

	// ����ջ���ַ
	public String getAddresses() {
		ReceiveAddressVo r = (ReceiveAddressVo) is.getAddress(
				"ReceiveAddressVo", id);
		System.out.println("����������������������������getAddress����������������������������");
		json.put("address", r);
		System.out.println(json.toJSONString());
		return "success";
	}

	// �����û��ջ���ַ
	public String saveAddress() {
		System.out.println(json.toJSONString());
		System.out.println("����������������������������saveAddress����������������������������");
		address.setAddress(address.getAddress().substring(0,address.getAddress().length()-1));
		is.updateVo(address);
		//return "toCenter";
		return "success";
	}

	// �����û�����
	public String saveUser() {
		if (imgs != null) {
			DownLoadImgs();
			user.setFace(imgsFileName[0]);
		}
		is.updateVo(user);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		// ���ҵ����󲢷�װ��session����
		session.setAttribute("m", user);
		session.setAttribute("user", user);
		System.out.println("����������������������������saveUser����������������������������");
		return "toCenter";
	}

	// ----------------------------����ͼƬ-----------------------------
	public String DownLoadImgs() {
		for (int i = 0; i < imgs.length; i++) {
			try {
				File file = new File(savepath);
				if (!file.exists()) {
					file.mkdirs();
				}
				String savename = UUID.randomUUID().toString()
						+ imgsFileName[i].substring(
								imgsFileName[i].indexOf(".") - 1,
								imgsFileName[i].length());
				imgsFileName[i] = savename;
				FileOutputStream fos = new FileOutputStream(this.savepath
						+ this.imgsFileName[i]);
				FileInputStream fis = new FileInputStream(this.imgs[i]);
				byte[] bs = new byte[1024];
				int real = fis.read(bs);
				while (real > 0) {
					fos.write(bs, 0, real);
					real = fis.read(bs);
				}
				fos.close();
				fis.close();
			} catch (Exception e) {
				System.out.println("�����ˣ�");
			}
		}
		return null;
	}

	// ������������������������������������������������setter&&getter����������������������������������������
	public JSONObject getJson() {
		return json;
	}

	public void setJson(JSONObject json) {
		this.json = json;
	}

	public PhoneNumberVo getPn() {
		return pn;
	}

	public void setPn(PhoneNumberVo pn) {
		this.pn = pn;
	}

	public UsersVo getUser() {
		return user;
	}

	public void setUser(UsersVo user) {
		this.user = user;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public ChildOrderVo getChild() {
		return child;
	}

	public void setChild(ChildOrderVo child) {
		this.child = child;
	}

	public MainOrderVo getMains() {
		return mains;
	}

	public void setMains(MainOrderVo mains) {
		this.mains = mains;
	}

	public Integer getCurrpage() {
		return currpage;
	}

	public void setCurrpage(Integer currpage) {
		this.currpage = currpage;
	}

	public Integer getPagecount() {
		return pagecount;
	}

	public WareVo getWare() {
		return ware;
	}

	public void setWare(WareVo ware) {
		this.ware = ware;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public void setPagecount(Integer pagecount) {
		this.pagecount = pagecount;
	}

	public Integer getId() {
		return id;
	}

	public WareGroupBuyingVo getGroup() {
		return group;
	}

	public void setGroup(WareGroupBuyingVo group) {
		this.group = group;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setAddress(ReceiveAddressVo address) {
		this.address = address;
	}

	public File[] getImgs() {
		return imgs;
	}

	public void setImgs(File[] imgs) {
		this.imgs = imgs;
	}

	public String[] getImgsFileName() {
		return imgsFileName;
	}

	public void setImgsFileName(String[] imgsFileName) {
		this.imgsFileName = imgsFileName;
	}

	public String getSavepath() {
		return savepath;
	}

	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}

	public ReceiveAddressVo getAddress() {
		return address;
	}

	public String[] getImgsContentType() {
		return imgsContentType;
	}

	public void setImgsContentType(String[] imgsContentType) {
		this.imgsContentType = imgsContentType;
	}

}