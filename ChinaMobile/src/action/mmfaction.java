package action;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.crypto.Data;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import service.mmfservice;
import vo.AdvertVo;
import vo.ChildOrderVo;
import vo.MainOrderVo;
import vo.PhoneNumberVo;
import vo.PhoneSetMealVo;
import vo.ReceiveAddressVo;
import vo.ShoppingCarVo;
import vo.WareBrandVo;
import vo.WareColorVo;
import vo.WareFlashSaleVo;
import vo.WareVo;

public class mmfaction {
	private String ssw;
	private int id;
	private int px;
	private int ct;
	private int pp;
	private int lb;
	private int jg;
	private String [] checkboxs;
	private String pricemin;
	private int user_id;
	private int currPage;
	private int pageCount;
	private List list;
	private int count;
	private String uname;
	private String photo;
	private String idcarf;
	private String sad;
	private MainOrderVo mains;
	private ChildOrderVo childe;
	JSONObject json=new JSONObject();
	ApplicationContext ac=new ClassPathXmlApplicationContext("config-resource/aplicationContext.xml");
	mmfservice is= (mmfservice)ac.getBean("mmfService");
	public String list(){
		List xs=new ArrayList();//限时抢购
//		xs=is.selxsqg();
		System.out.println(xs.toString());
		return null;
	}
	public String addorder2(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date=df.format(new java.util.Date());
        //System.out.println(date);// new Date()为获取当前系统时间
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");//设置日期格式
        //System.out.println(df2.format(new java.util.Date()));// new Date()为获取当前系统时间
        String df3="t"+df2.format(new java.util.Date());
        df3= df3.replace(":","");
        df3+=mains.getUser_id()+(int)(Math.random()*100);
        
//		System.out.println("用户id"+mains.getUser_id());
//		System.out.println("总价"+mains.getTotal_price());
//		System.out.println("用户号码"+mains.getPhone_number());
//		System.out.println("身份证号"+mains.getIdcard());
//		System.out.println("收货地址"+mains.getReceive_address());
		mains.setPay_method("在线支付");
		mains.setBusiness_hall_id("1");
		mains.setMainordernum(df3);
		mains.setDatetime(date);
		mains.setState("未支付");


		
//		System.out.println(sad);
		String ls[]=sad.split(",");//物品颜色(id)
//		System.out.println(uname);
		String ln[]=uname.split(",");//名称id
//		System.out.println(photo);
		String lu[]=photo.split(",");//数量
		String gwc[]=pricemin.split(",");
		Integer s=is.addobjs(mains);
//		System.out.println(s);
//		System.out.println(childe.getReceive_user());//收货人
		String shr=childe.getReceive_user();
		for(int i=0;i<ln.length;i++){
			childe.setReceive_user(shr);
			childe.setMain_order_id(s);
			childe.setWare_type("普通");
			childe.setDelivery_method("送货上门");
			childe.setSurface("PhoneNumberVo");
			childe.setState("未支付");
			childe.setColorid(Integer.parseInt(ls[i]));
			childe.setWare_id(Integer.parseInt(ln[i]));
			childe.setWarenum(Integer.parseInt(lu[i]));
//			System.out.println(mains.getTotal_price());
			childe.setPrice(mains.getTotal_price());
			is.addobj(childe);
			childe.setId(null);
			if(Integer.parseInt(gwc[i])!=-1){
			is.delobjbyid("ShoppingCar", "id", Integer.parseInt(gwc[i]));
			}
		}
		is.updobj("Phone_Number", ""+ln[0], "禁用");
		sad=df3;//订单号
		ssw=mains.getTotal_price()+"";//价格
		id=s;
		return "tosuccess";
	}
	public String choose(){
		PhoneNumberVo ph=(PhoneNumberVo)is.selobjbyid(id+"", "PhoneNumberVo", "id");
//		System.out.println(ph.getBrand());
		List ps=is.selbydetermine("PhoneSetMealVo", "brand",ph.getBrand());
		
		json.put("ph", ph);
		json.put("ps", ps);
		return "success";
	}
	public String pro(){
//		System.out.println(ssw);
		return "tosuccesss";
	}
	public String tochooseno(){
		return "tochoose";
	}
	public String addorder(){//下单
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date=df.format(new java.util.Date());
//        System.out.println(date);// new Date()为获取当前系统时间
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");//设置日期格式
//        System.out.println(df2.format(new java.util.Date()));// new Date()为获取当前系统时间
        String df3="t"+df2.format(new java.util.Date());
        df3= df3.replace(":","");
        df3+=mains.getUser_id()+(int)(Math.random()*100);
        
//		System.out.println("用户id"+mains.getUser_id());
//		System.out.println("总价"+mains.getTotal_price());
		
//		System.out.println("用户号码"+mains.getPhone_number());
//		System.out.println("身份证号"+mains.getIdcard());
//		System.out.println("收货地址"+mains.getReceive_address());
		mains.setPay_method("在线支付");
		mains.setBusiness_hall_id("1");
		mains.setMainordernum(df3);
		mains.setDatetime(date);
		mains.setState("未支付");
		
		
//		System.out.println(sad);
		String ls[]=sad.split(",");//物品颜色(id)
//		System.out.println(uname);
		String ln[]=uname.split(",");//名称id
//		System.out.println(photo);
		String lu[]=photo.split(",");//数量
		String gwc[]=pricemin.split(",");
		Integer s=is.addobjs(mains);
//		System.out.println(s);
//		System.out.println(childe.getReceive_user());//收货人
		String shr=childe.getReceive_user();
		for(int i=0;i<ln.length;i++){
			childe.setReceive_user(shr);
			childe.setMain_order_id(s);
			childe.setWare_type("普通");
			childe.setDelivery_method("送货上门");
			childe.setSurface("wareVo");
			childe.setState("未支付");
			childe.setColorid(Integer.parseInt(ls[i]));
			childe.setWare_id(Integer.parseInt(ln[i]));
			childe.setWarenum(Integer.parseInt(lu[i]));
			WareColorVo w=(WareColorVo)is.selobjbyid(ls[i], "WareColorVo", "id");
//			System.out.println(w.getPrice());
			childe.setPrice(w.getPrice());
			is.addobj(childe);
			w.setStock_count(Integer.parseInt(w.getStock_count()-Integer.parseInt(lu[i])+""));
//			System.out.println(w.getId());
//			System.out.println(w.getColor());
//			System.out.println(w.getImage());
//			System.out.println(w.getState());
//			System.out.println(w.getPrice());
//			System.out.println(w.getStock_count());
//			System.out.println(w.getWare_id());
			is.updbyid("ware_color", "stock_count", w.getStock_count()+"", w.getId()+"");
			childe.setId(null);
			if(Integer.parseInt(gwc[i])!=-1){
			is.delobjbyid("ShoppingCar", "id", Integer.parseInt(gwc[i]));
			}
		}//pricemin
		sad=df3;//订单号
		ssw=mains.getTotal_price()+"";//价格
		id=s;
		return "tosuccess";
	}
	public String seldz(){
		list=is.selobjbyid("ReceiveAddressVo", "user_id",user_id);
//		System.out.println("数据"+list.size());
		ReceiveAddressVo ssd= (ReceiveAddressVo)list.get(0);
//		System.out.println(ssd.getAddress());
		json.put("dz", list);
		return "success";
	}
	public String tomain(){
//		System.out.println("用户ID"+user_id);
//		System.out.println(checkboxs.length);
		JSONArray a=new JSONArray();
		ssw="";
		sad="";
		uname="";
		photo="";//商品数量*
		pricemin="";//选中购物车id
		for (int i = 0; i < checkboxs.length; i++) {
//			System.out.println("选中购物车id"+checkboxs[i]);
			
			ShoppingCarVo s=(ShoppingCarVo)is.selobjbyid(checkboxs[i], "ShoppingCarVo", "id");
			//查物品
			WareVo w=(WareVo)is.selobjbyid(s.getWare_id()+"", "WareVo", "id");
			//查物品颜色
			WareColorVo wc=(WareColorVo)is.selobjbyid(s.getWare_color_id()+"", "WareColorVo", "id");
			if(w.getName()!=null){
			ssw+=w.getName()+"("+wc.getColor()+")"+"*"+s.getAmount()+"<br>";//物品详情
			sad+=s.getWare_color_id()+",";
			jg+=wc.getPrice()*s.getAmount();//总价格
			uname+=w.getId()+",";
			photo+=s.getAmount()+",";
			pricemin+=checkboxs[i]+",";
			}
			
			a.add(s);
		}
//		System.out.println(a.toJSONString());
//		System.out.println(1);
		return "topro_info";
	}
	public String toinfo(){
//		System.out.println("这里"+ssw);
		return "topro_info";
	}
	public String addcar(){
//		System.out.println("颜色id"+pp);
//		System.out.println("单价"+pricemin);
//		System.out.println("数量"+px);
//		System.out.println("总价"+ssw);
//		System.out.println("用户"+user_id);
//		System.out.println("物品"+id);
		
		ShoppingCarVo sho=new ShoppingCarVo();
		sho.setAmount(px);
		sho.setState("有效");
		sho.setTotal_price(Float.parseFloat(ssw));
		sho.setUnit_price(Float.parseFloat(pricemin));
		sho.setWare_color_id(pp);
		sho.setUser_id(user_id);
		sho.setWare_id(id);
		is.addobj(sho);
		json.put("msg", "加入成功");
		return "success";
	}
	public String delbyid(){
//		System.out.println(id);
		is.delobjbyid("shoppingcar", "id", id);
		return "success";
	}
	public String toCar(){
		return "toCar";
	}
	public String shoppingcar(){
//		System.out.println("chaxun"+id);
		List shopcar=is.selobjbyid("ShoppingCarVo", "user_id", id);
//		System.out.println(shopcar.size());
		json.put("shop",shopcar);
		return "success";
	}
	public String index(){//跳转到商品详情
//		System.out.println(id);
		
		return "topro_detail";
	}
	
	public String indexs(){//商品详情
		System.out.println("查看商品详情"+id);
		List wares=is.selwaresbypage(1, 4);//热卖
		WareVo ware=is.selwarebyid(id);//商品
		List clist=is.selobjbyid("WareColorVo", "ware_id", id);//商品颜色图片
		List userc=is.selobjbyid("UserCommentVo", "ware_id", id);//商品评论
		json.put("wares", wares);
		json.put("ware", ware);
		json.put("clist", clist);
		json.put("userc", userc);
		return "success";
	}
	public String xj(){//选机中心
		
		List city=new ArrayList();
		city=is.selcity();
		List pp=new ArrayList();
		pp=is.selpp();
		List lb=new ArrayList();
		lb=is.sellb();
		
		count=is.selwarescount();
		if(currPage==0){
			currPage=1;
		}
		if(pageCount==0){
			pageCount=10;
		}
		List ware=new ArrayList();
		ware=is.selwaresbypage(currPage, pageCount);
		
		WareFlashSaleVo xs=(WareFlashSaleVo) is.selxsqg();
		WareVo xsw=new WareVo();
		xsw=is.selwarebyid(xs.getWare_id());
//		System.out.println("查出"+xsw.getSale_count());
		
		WareFlashSaleVo ms=(WareFlashSaleVo) is.selms();
		WareVo msw =new WareVo();
		msw=is.selwarebyid(ms.getWare_id());
		AdvertVo adv=(AdvertVo)is.selobjbyid(1+"", "AdvertVo", "id");
		int count=is.selcount();
		json.put("city", city);
		json.put("pp", pp);
		json.put("lb", lb);
		json.put("ware", ware);
//		System.out.println(adv.getAdv1());
		json.put("ct", ct);
		json.put("adv", adv.getAdv1());
		json.put("pp", pp);
		json.put("lb", lb);
		json.put("xs", xs);
		json.put("xsw", xsw);
//		System.out.println(json.toJSONString());
		json.put("ms", ms);
		json.put("msw", msw);
		json.put("count", count);
		json.put("currPage", currPage);
		json.put("ys", (count+pageCount-1)/pageCount);
//		System.out.println("当前页数"+(count+pageCount-1)/pageCount);
		return "success";
	}
	public String xzsj(){
		
//		System.out.println("城市"+ct);
//		System.out.println("品牌"+pp);
//		System.out.println("类别"+lb);
//		System.out.println("排序"+px);
//		System.out.println("价格"+jg);
		
		if(currPage==0){
			currPage=1;
		}
		if(pageCount==0){
			pageCount=10;
		}
//		System.out.println(currPage);
		int cts=is.selwarescountby(ct, pp, lb,jg);
//		System.out.println(cts);
		List li=is.selwaresbypage(ct,pp,lb, currPage, pageCount,px,jg);
//		System.out.println(pageCount);
		
		json.put("li", li);
		json.put("counts", cts);
		json.put("currPage", currPage);
//		System.out.println("当前页数"+(cts+pageCount-1)/pageCount);
		json.put("ys", (cts+pageCount-1)/pageCount);
//		System.out.println(json.toJSONString());
		return "success";
	}
	public String selchild(){
		WareVo l=is.selwarebyid(id);
		json.put("ware", l);
//		System.out.println("查询物品");
//		System.out.println(l.getName());
//		System.out.println(l.getPhoto());
		return "success";
	}
	public String selcolor(){
		//System.out.println(id);
		WareColorVo color=(WareColorVo)is.selobjbyid(id+"","WareColorVo", "id");
//		System.out.println(color.getId());
		json.put("color", color);
		return "success";
	}
	public String seldld(){
		return "toorderinfo";
	}
	public String seldd(){
//		System.out.println("号"+ssw);
//		System.out.println(pricemin);
		MainOrderVo m=is.selmainorder(pricemin, ssw);
		List child = null;
		if(m!=null){
			System.out.println(m.getId());
			child=is.selchildorder(m.getId()+"");
		}
		System.out.println("子订单");
		System.out.println("查询完成");
		json.put("li", child);
		json.put("main", m);
		System.out.println(json.toJSONString());
		return "success";
	}
	public String detail(){
		//System.out.println(id);
		return "todetail";
	}
	public String todetail(){
		//System.out.println(id);
		ChildOrderVo child=is.selchildorderbyid(id);
		MainOrderVo main=is.selmainorderbyid(child.getMain_order_id());
		String photo=null;
		String name=null;
		String price=null;
		String brand=null;
		if(child.getSurface().equals("wareVo")){
		WareVo ware=is.selwarebyid(child.getWare_id());
		photo=ware.getPhoto();
		name=ware.getName();
		price=ware.getPrice()+"";
		WareBrandVo br=is.selbrandbyid(ware.getBrand_id());
		brand=br.getName();
		}else{
			PhoneNumberVo phone=is.selphonenumberbyid(id);
			photo="images/img/orderCheck.gif";
			name=phone.getPhone_number();
			price=phone.getPrice()+"";
			brand=phone.getBrand();
		}
		json.put("child", child);
		json.put("main", main);
		json.put("photo", photo);
		json.put("name", name);
		json.put("price", price);
		json.put("brand", brand);
		return "success";
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public JSONObject getJson() {
		return json;
	}
	public void setJson(JSONObject json) {
		this.json = json;
	}
	
	public String getPricemin() {
		return pricemin;
	}
	public void setPricemin(String pricemin) {
		this.pricemin = pricemin;
	}
	public int getCt() {
		return ct;
	}
	public void setCt(int ct) {
		this.ct = ct;
	}
	public int getPp() {
		return pp;
	}
	public void setPp(int pp) {
		this.pp = pp;
	}
	public int getLb() {
		return lb;
	}
	public void setLb(int lb) {
		this.lb = lb;
	}
	public int getPx() {
		return px;
	}
	public void setPx(int px) {
		this.px = px;
	}
	public String getSsw() {
		return ssw;
	}
	public void setSsw(String ssw) {
		this.ssw = ssw;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getJg() {
		return jg;
	}

	public void setJg(int jg) {
		this.jg = jg;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String[] getcheckboxs() {
		return checkboxs;
	}
	public void setcheckboxs(String[] checkboxs) {
		this.checkboxs = checkboxs;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getIdcarf() {
		return idcarf;
	}
	public void setIdcarf(String idcarf) {
		this.idcarf = idcarf;
	}
	public String getSad() {
		return sad;
	}
	public void setSad(String sad) {
		this.sad = sad;
	}
	public MainOrderVo getMains() {
		return mains;
	}
	public void setMains(MainOrderVo mains) {
		this.mains = mains;
	}
	public ChildOrderVo getChilde() {
		return childe;
	}
	public void setChilde(ChildOrderVo childe) {
		this.childe = childe;
	}
}