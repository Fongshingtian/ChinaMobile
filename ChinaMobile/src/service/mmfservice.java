package service;

import java.util.List;

import vo.ChildOrderVo;
import vo.MainOrderVo;
import vo.PhoneNumberVo;
import vo.WareBrandVo;
import vo.WareColorVo;
import vo.WareFlashSaleVo;
import vo.WareVo;
import vo.UserCommentVo;


public interface mmfservice {
	public String cs();
	public List selwares(String w);
	public List seltg();
	public List selwares();
	public List selcity();
	public int selcount();
	public List selpp();//品牌
	public List sellb();//类别
	public int selwarescount();
	public List selwaresbypage(int currPage,int pageCount);
	public List selwaresbypage(int ct,int pp,int lb,int currPage,int pageCount,int px,int jg);
	public int selwarescountby(int ct,int pp,int lb,int jg);
	public WareFlashSaleVo selxsqg();//查询限时抢购
	public WareFlashSaleVo selms();//查询秒杀
	public WareVo selwarebyid(Integer id);
	public MainOrderVo selmainorder(String zm,String bh);
	public List selchildorder(String zddh);
	public ChildOrderVo selchildorderbyid(int id);
	public MainOrderVo selmainorderbyid(int id);
	public PhoneNumberVo selphonenumberbyid(int id);
	public WareBrandVo selbrandbyid(int id);
	public List selobjbyid(String obj, String idname,int id);
	public Object selobjbyid(String id,String obj, String iname);
	public boolean delobjbyid(String obj,String iname,int id);
	public List selbydetermine(String obj,String iname,String mine);
	public boolean addobj(Object ss);
	public Integer addobjs(Object ss);
	public boolean updobj(Object na,String iname,String sn);
	public boolean upd(WareColorVo ware);
	public boolean updbyid(String voName,String uname,String state,String id);
}
