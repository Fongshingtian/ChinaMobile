package vo;

public class ChildOrderVo {
	// �Ӷ�����
	private Integer id;// ID
	private Integer main_order_id;// ����Ӧ��������
	private Integer ware_id;// ����Ӧ����Ʒ
	private String ware_type;// �������ͣ��������Ź���
	private Float price;// �۸�
	private Integer warenum;// ����
	private String receive_user;//�ջ���
	private String delivery_method;// ���ͷ�ʽ
	private String surface;//��Ʒ��Ӧ�����ֻ��� wareVo�������phoneNumberVo��
	private Integer colorid;//��ɫid
	private String state;// ֧��״̬

	

	public String getSurface() {
		return surface;
	}

	public void setSurface(String surface) {
		this.surface = surface;
	}

	public String getDelivery_method() {
		return delivery_method;
	}

	public void setDelivery_method(String delivery_method) {
		this.delivery_method = delivery_method;
	}

	public Integer getWarenum() {
		return warenum;
	}

	public void setWarenum(Integer warenum) {
		this.warenum = warenum;
	}

	public String getReceive_user() {
		return receive_user;
	}

	public void setReceive_user(String receive_user) {
		this.receive_user = receive_user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMain_order_id() {
		return main_order_id;
	}

	public void setMain_order_id(Integer main_order_id) {
		this.main_order_id = main_order_id;
	}

	public Integer getWare_id() {
		return ware_id;
	}

	public void setWare_id(Integer ware_id) {
		this.ware_id = ware_id;
	}

	public String getWare_type() {
		return ware_type;
	}

	public void setWare_type(String ware_type) {
		this.ware_type = ware_type;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getColorid() {
		return colorid;
	}

	public void setColorid(Integer colorid) {
		this.colorid = colorid;
	}

}