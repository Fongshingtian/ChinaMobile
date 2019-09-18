package vo;

public class WareGroupBuyingStageVo {
	// 团购表
	private Integer id;// ID
	private Integer group_id;// 商品
	private Float stage1_price;// 详情
	private Float stage2_price;// 详情
	private Float stage3_price;// 详情

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGroup_id() {
		return group_id;
	}

	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}

	public Float getStage1_price() {
		return stage1_price;
	}

	public void setStage1_price(Float stage1_price) {
		this.stage1_price = stage1_price;
	}

	public Float getStage2_price() {
		return stage2_price;
	}

	public void setStage2_price(Float stage2_price) {
		this.stage2_price = stage2_price;
	}

	public Float getStage3_price() {
		return stage3_price;
	}

	public void setStage3_price(Float stage3_price) {
		this.stage3_price = stage3_price;
	}
}
