package vo;

public class WareFlashSaleVo {
	// ��ʱ������
	private Integer id;// ID
	private Integer ware_id;// ��Ʒ
	private Float price;// �۸�
	private String start_time;// ��ʼʱ��
	private String end_time;// ����ʱ��
	private String state;// ״̬  1����   2��ɱ

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getWare_id() {
		return ware_id;
	}

	public void setWare_id(Integer ware_id) {
		this.ware_id = ware_id;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
