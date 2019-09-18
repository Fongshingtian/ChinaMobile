package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSONObject;

import service.FssService;
import vo.ActivityVo;
import vo.AdvertVo;
import vo.BusinessHallVo;
import vo.ChildOrderVo;
import vo.CityVo;
import vo.MainOrderVo;
import vo.ManagerVo;
import vo.NoticeVo;
import vo.PhoneNumberVo;
import vo.PhoneSetMealVo;
import vo.ReceiveAddressVo;
import vo.RotationImageVo;
import vo.UserCommentVo;
import vo.UsersVo;
import vo.WareBargainVo;
import vo.WareBrandVo;
import vo.WareClassifyVo;
import vo.WareColorVo;
import vo.WareFlashSaleVo;
import vo.WareGroupBuyingVo;
import vo.WareVo;

public class fssaction {
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"config-resource/aplicationContext.xml");
	FssService fs = (FssService) ac.getBean("fssService");
	// --------------------------����--------------------------
	JSONObject data = new JSONObject();
	private Integer page;// ��ҳ����
	private Integer limit;// ��ҳ����
	private Integer code;// ��ҳ����
	private Integer count;// ��ҳ����
	private String voName;// vo����
	private String state;// ״̬
	private String id;// ״̬Id
	// ---------vo---------
	private UsersVo user;//
	private ManagerVo manager;//
	private WareVo ware=new WareVo();//
	private BusinessHallVo hall;
	private CityVo city;
	private NoticeVo notice;
	private PhoneNumberVo number;
	private PhoneSetMealVo meal;
	private RotationImageVo image;
	private UserCommentVo comment;
	private MainOrderVo main;
	private ChildOrderVo child;
	private ActivityVo activity;
	private ReceiveAddressVo address;
	private WareBargainVo bargain;
	private WareBrandVo brand;
	private WareClassifyVo classify;
	private WareColorVo color;
	private WareGroupBuyingVo group;
	private WareFlashSaleVo flash;
	private AdvertVo advert;
	private String pwd;
	private String name;
	// �ϴ�ͼƬ���
	private String existImgIndexs;
	private Integer existList;
	private Integer existParameter;
	private Integer existPhoto;
	private Integer existGuarantee;
	// �ļ��ϴ�-��ز���
	private File[] imgs;
	private String[] imgsFileName;// +System.getProperty("file.separator")-
	private String savepath = ServletActionContext.getServletContext()
			.getRealPath("imgs") + System.getProperty("file.separator");
	private String[] imgsContentType;
	
	                                                                                                                                                 
	// ------------------���������ѯ�б�--------------------------
	public String search() {
		// ƴ�ӵ������ַ���
		String columns = "";
		// �����б�
		String tableName = voName.substring(0, voName.length() - 2);
		if (tableName.equals("BusinessHall")) {
			tableName = "Business_Hall";
		} else if (tableName.equals("PhoneNumber")) {
			tableName = "Phone_Number";
		} else if (tableName.equals("MainOrder")) {
			tableName = "Main_Order";
		} else if (tableName.equals("PhoneSetMeal")) {
			tableName = "Phone_Set_Meal";
		} else if (tableName.equals("RotationImage")) {
			tableName = "Rotation_Image";
		} else if (tableName.equals("UserComment")) {
			tableName = "User_Comment";
		} else if (tableName.equals("WareBargain")) {
			tableName = "Ware_Bargain";
		} else if (tableName.equals("WareBrand")) {
			tableName = "Ware_Brand";
		} else if (tableName.equals("WareClassify")) {
			tableName = "Ware_Classify";
		} else if (tableName.equals("WareColor")) {
			tableName = "Ware_Color";
		} else if (tableName.equals("WareFlashSale")) {
			tableName = "Ware_Flash_Sale";
		} else if (tableName.equals("ChildOrder")) {
			tableName = "Child_Order";
		} else if (tableName.equals("WareGroupBuying")) {
			tableName = "Ware_Group_Buying";
		}
		List list = fs.getTableColumns(tableName);
		for (Object obj : list) {
			columns += obj + ",";
		}
		// ����ģ����ѯ����%
		char chars[] = state.toCharArray();
		String words = "%";
		for (int i = 0; i < chars.length; i++) {
			words += chars[i] + "%";
		}
		// ȥ�����һ������
		columns = columns.substring(0, columns.length() - 1);
		data.put("code", 0);
		data.put("count", fs.SearchDataCount(voName, columns, words));
		data.put("data", fs.getSearchList(voName, columns, words, page, limit));
		System.out.println(data.toJSONString());
		return "success";
	}

	// -------------------��������б�--------------------
	public String tableList() {
		System.out.println(voName);
		if (voName.equals("RotationImageVo")) {
			page = 1;
			limit = 1;
		} else if (voName.equals("AdvertVo")) {
			page = 1;
			limit = 1;
		} else if (voName.equals("ChildOrderVo")) {
			voName += " where main_order_id=" + id;
		}
		List list = (List) fs.getTableList(voName, page, limit);
		data.put("code", 0);
		data.put("count", fs.DataCount(voName));
		data.put("data", fs.getTableList(voName, page, limit));
		System.out.println(data.toJSONString());
		return "success";
	}

	// ---------------------�ı�״̬-------------------------
	public String changeState() {
		System.out.println("change");
		fs.changeState(voName, state, id);
		return "success";
	}

	// ----------------------���棨�޸�/������-----------------------
	public String saveVo() {
		Object obj = new Object();
		// ��Ʒ����
		if (voName.equals("Ware")) {
			// ���ѡ�����ļ���ȥ���� ���û��ֱ�Ӹ���
			System.out.println(ware.getIntroduction()); 
			if(ware!=null){
				if (imgs != null && !imgsFileName[0].equals("")) {
					// ����ͼƬ�ļ�
					DownLoadImgs();
					// ���ͼƬ���鱾���ڵ�ͼƬ�±�+�����ļ�����
					String eCount[] = existImgIndexs.split(",");
					// ���ͼƬ���������ļ�����
					int fCount = Integer.parseInt(eCount[eCount.length - 1]);
					// ���ͼƬ�����������͸���
					if (fCount != 0) {
						// ���ձ����ͼƬ����
						String details = "";
						// ���û�б����ڵ�ͼƬ�Ĳ���
						if (eCount.length == 1) {
							for (int i = 0; i < fCount; i++) {
								details += imgsFileName[i] + ",";
							}
							ware.setDetail(details.substring(0,
									details.length() - 1));
							System.out.println("�ޱ���" + details);
						} else {
							// �б�����Ҳ�������ģ���ϣ�
							// �ѱ����ڵ�ͼƬ���ָ������
							String eContent[] = ware.getDetail().split(",");
							// ��ñ����ڵ�ͼƬ��Ӧ���±�
							int eIndex[] = new int[eCount.length - 1];
							for (int i = 0; i < eIndex.length; i++) {
								eIndex[i] = Integer.parseInt(eCount[i]);
							}
							// ���ݱ����ڵ�ͼƬ�±�ƴ�ӳ�����detail
							int eTemp = 0;
							int nTemp = 0;
							for (int i = 0; i < fCount + eIndex.length; i++) {
								if (eIndex[eTemp] == i) { // 0-1 1-2// 0-0 1-3
									details += eContent[eTemp] + ",";
									if (eTemp < eIndex.length - 1) {
										eTemp++;
									}
								} else {
									details += imgsFileName[nTemp] + ",";
									if (nTemp < fCount - 1) {
										nTemp++;
									}
								}
							}
							System.out.println("���" + details);
							ware.setDetail(details.substring(0,
									details.length() - 1));
						}
					} else {
						System.out.println("detail������");
					}
					if (existGuarantee != -1 && existGuarantee != null) {
						ware.setGuarantee(imgsFileName[existGuarantee]);
					}
					if (existList != -1 && existList != null) {
						ware.setDetailed_list(imgsFileName[existList]);
					}
					if (existParameter != -1 && existParameter != null) {
						ware.setParameter(imgsFileName[existParameter]);
					}
					if (existPhoto != -1 && existPhoto != null) {
						ware.setPhoto(imgsFileName[existPhoto]);
					}
				} else {
					System.out.println("imgs Ϊ null");
				}
				if (ware.getId() != -1) {
					state = "��Ϊ��";
				}
				obj = ware;
			}else{
				return "ok";
			}
		} else if (voName.equals("Users")) {
			if (imgs != null) {
				DownLoadImgs();
				user.setFace(imgsFileName[0]);
			}
			if (user.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = user;
		} else if (voName.equals("Manager")) {

			if (manager.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = manager;
		} else if (voName.equals("Business_Hall")) {
			if (hall.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = hall;
		} else if (voName.equals("City")) {
			if (city.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = city;
		} else if (voName.equals("Notice")) {
			if (notice.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = notice;
		} else if (voName.equals("Phone_Number")) {
			if (number.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = number;
		} else if (voName.equals("Main_Order")) {
			if (main.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = main;
		} else if (voName.equals("Child_Order")) {
			existImgIndexs = "fss!tableList?voName=ChildOrderVo&id="+child.getMain_order_id();
			if (child.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = child;
		} else if (voName.equals("Phone_Set_Meal")) {
			if (meal.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = meal;
		} else if (voName.equals("Rotation_Image")) {
			if (imgs != null) {
				DownLoadImgs();
				int img1 = 0;
				int img2 = 1;
				int img3 = 2;
				int img4 = 3;
				if (image.getImage1().equals("null")) {
					image.setImage1(imgsFileName[img1]);
				} else {
					img4--;
					img3--;
					img2--;
				}
				if (image.getImage2().equals("null")) {
					image.setImage2(imgsFileName[img2]);
				} else {
					img4--;
					img3--;
				}
				if (image.getImage3().equals("null")) {
					image.setImage3(imgsFileName[img3]);
				} else {
					img4--;
				}
				if (image.getImage4().equals("null")) {
					image.setImage4(imgsFileName[img4]);
				}
			}
			if (image.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = image;
		} else if (voName.equals("User_Comment")) {
			if (comment.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = comment;
		} else if (voName.equals("Ware_Bargain")) {
			if (bargain.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = bargain;
		} else if (voName.equals("Ware_Brand")) {
			if (brand.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = brand;
		} else if (voName.equals("Ware_Classify")) {
			if (classify.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = classify;
		} else if (voName.equals("Ware_Color")) {
			if (imgs != null) {
				DownLoadImgs();
				color.setImage(imgsFileName[0]);
			}
			if (color.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = color;
		} else if (voName.equals("Ware_Flash_Sale")) {
			if (flash.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = flash;
		} else if (voName.equals("Advert")) {
			if (imgs != null) {
				DownLoadImgs();
				int img1 = 0;
				int img2 = 1;
				int img3 = 2;
				if (advert.getAdv1().equals("null")) {
					advert.setAdv1(imgsFileName[img1]);
				} else {
					img3--;
					img2--;
				}
				if (advert.getAdv2().equals("null")) {
					advert.setAdv2(imgsFileName[img2]);
				} else {
					img3--;
				}
				if (advert.getAdv3().equals("null")) {
					advert.setAdv3(imgsFileName[img3]);
				}
			}
			if (advert.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = advert;
		} else if (voName.equals("Ware_Group_Buying")) {
			if (group.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = group;
		}else if (voName.equals("Activity")) {
			if (imgs != null) {
				DownLoadImgs();
				activity.setImage(imgsFileName[0]);
			}
			if (activity.getId() != -1) {
				state = "��Ϊ��";
			}
			obj = activity;
		}
		//
		if (state == null) {
			fs.SaveVo(obj);
		} else {
			fs.UpdateVo(obj);
		}
		return "ok";
	}

	// -----------------------------����������ȥ�Ӷ�������---------------------------
	public String toChildOrder() {
		existImgIndexs = "fss!tableList?voName=ChildOrderVo&id="+id;
		return "toChild";
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

	// -----------------------------Set&Get-------------------------------

	public UsersVo getUser() {
		return user;
	}

	public BusinessHallVo getHall() {
		return hall;
	}

	public void setHall(BusinessHallVo hall) {
		this.hall = hall;
	}

	public void setUser(UsersVo user) {
		this.user = user;
	}

	public JSONObject getJson() {
		return data;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getVoName() {
		return voName;
	}

	public void setVoName(String voName) {
		this.voName = voName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public WareVo getWare() {
		return ware;
	}

	public void setWare(WareVo ware) {
		this.ware = ware;
	}

	public ManagerVo getManager() {
		return manager;
	}

	public void setManager(ManagerVo manager) {
		this.manager = manager;
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

	public String[] getImgsContentType() {
		return imgsContentType;
	}

	public void setImgsContentType(String[] imgsContentType) {
		this.imgsContentType = imgsContentType;
	}

	public File[] getImgs() {
		return imgs;
	}

	public void setImgs(File[] imgs) {
		this.imgs = imgs;
	}

	public String getExistImgIndexs() {
		return existImgIndexs;
	}

	public void setExistImgIndexs(String existImgIndexs) {
		this.existImgIndexs = existImgIndexs;
	}

	public JSONObject getData() {
		return data;
	}

	public Integer getExistList() {
		return existList;
	}

	public void setExistList(Integer existList) {
		this.existList = existList;
	}

	public Integer getExistParameter() {
		return existParameter;
	}

	public void setExistParameter(Integer existParameter) {
		this.existParameter = existParameter;
	}

	public Integer getExistPhoto() {
		return existPhoto;
	}

	public void setExistPhoto(Integer existPhoto) {
		this.existPhoto = existPhoto;
	}

	public Integer getExistGuarantee() {
		return existGuarantee;
	}

	public void setExistGuarantee(Integer existGuarantee) {
		this.existGuarantee = existGuarantee;
	}

	public CityVo getCity() {
		return city;
	}

	public void setCity(CityVo city) {
		this.city = city;
	}

	public NoticeVo getNotice() {
		return notice;
	}

	public void setNotice(NoticeVo notice) {
		this.notice = notice;
	}

	public PhoneNumberVo getNumber() {
		return number;
	}

	public void setNumber(PhoneNumberVo number) {
		this.number = number;
	}

	public PhoneSetMealVo getMeal() {
		return meal;
	}

	public void setMeal(PhoneSetMealVo meal) {
		this.meal = meal;
	}

	public RotationImageVo getImage() {
		return image;
	}

	public void setImage(RotationImageVo image) {
		this.image = image;
	}

	public UserCommentVo getComment() {
		return comment;
	}

	public void setComment(UserCommentVo comment) {
		this.comment = comment;
	}

	public MainOrderVo getMain() {
		return main;
	}

	public void setMain(MainOrderVo main) {
		this.main = main;
	}

	public ChildOrderVo getChild() {
		return child;
	}

	public void setChild(ChildOrderVo child) {
		this.child = child;
	}

	public ActivityVo getActivity() {
		return activity;
	}

	public void setActivity(ActivityVo activity) {
		this.activity = activity;
	}

	public ReceiveAddressVo getAddress() {
		return address;
	}

	public void setAddress(ReceiveAddressVo address) {
		this.address = address;
	}

	public WareBargainVo getBargain() {
		return bargain;
	}

	public void setBargain(WareBargainVo bargain) {
		this.bargain = bargain;
	}

	public WareBrandVo getBrand() {
		return brand;
	}

	public void setBrand(WareBrandVo brand) {
		this.brand = brand;
	}

	public WareClassifyVo getClassify() {
		return classify;
	}

	public void setClassify(WareClassifyVo classify) {
		this.classify = classify;
	}

	public WareColorVo getColor() {
		return color;
	}

	public void setColor(WareColorVo color) {
		this.color = color;
	}

	public WareFlashSaleVo getFlash() {
		return flash;
	}

	public void setFlash(WareFlashSaleVo flash) {
		this.flash = flash;
	}

	public AdvertVo getAdvert() {
		return advert;
	}

	public void setAdvert(AdvertVo advert) {
		this.advert = advert;
	}

	public WareGroupBuyingVo getGroup() {
		return group;
	}

	public void setGroup(WareGroupBuyingVo group) {
		this.group = group;
	}

}