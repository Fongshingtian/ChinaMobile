package vo;

public class PhoneNumberVo {
	// 电话号码表
	private Integer id;// ID
	private String phone_number;// 手机号码
	private String city;// 号码城市
	private String brand;// 品牌
	private Float have_fare;// 内含话费
	private Float price;// 价格
	private String type;// 类型 （靓号？）
	private String state;// 状态

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Float getHave_fare() {
		return have_fare;
	}

	public void setHave_fare(Float have_fare) {
		this.have_fare = have_fare;
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
}
