package com.prod.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class ProdVO implements Serializable {
	private String prod_no;
	private String store_no;
	private String prod_name;
	private String bean_type;
	private String bean_grade;
	private String bean_contry;
	private String bean_region;
	private String bean_farm;
	private String bean_farmer;
	private Integer bean_el;
	private String proc;
	private String roast;
	private Integer bean_attr_acid;
	private Integer bean_attr_aroma;
	private Integer bean_attr_body;
	private Integer bean_attr_after;
	private Integer bean_attr_bal;
	private String bean_aroma;
	private Integer prod_price;
	private Double prod_wt;
	private Integer send_fee;
	private Integer prod_sup;
	private String prod_cont;
	private byte[] prod_pic1;
	private byte[] prod_pic2;
	private byte[] prod_pic3;
	private String prod_stat;
	private Date ed_time;
		
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getStore_no() {
		return store_no;
	}
	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getBean_type() {
		return bean_type;
	}
	public void setBean_type(String bean_type) {
		this.bean_type = bean_type;
	}
	public String getBean_grade() {
		return bean_grade;
	}
	public void setBean_grade(String bean_grade) {
		this.bean_grade = bean_grade;
	}
	public String getBean_contry() {
		return bean_contry;
	}
	public void setBean_contry(String bean_contry) {
		this.bean_contry = bean_contry;
	}
	public String getBean_region() {
		return bean_region;
	}
	public void setBean_region(String bean_region) {
		this.bean_region = bean_region;
	}
	public String getBean_farm() {
		return bean_farm;
	}
	public void setBean_farm(String bean_farm) {
		this.bean_farm = bean_farm;
	}
	public String getBean_farmer() {
		return bean_farmer;
	}
	public void setBean_farmer(String bean_farmer) {
		this.bean_farmer = bean_farmer;
	}
	public Integer getBean_el() {
		return bean_el;
	}
	public void setBean_el(Integer bean_el) {
		this.bean_el = bean_el;
	}
	public String getProc() {
		return proc;
	}
	public void setProc(String proc) {
		this.proc = proc;
	}
	public String getRoast() {
		return roast;
	}
	public void setRoast(String roast) {
		this.roast = roast;
	}
	public Integer getBean_attr_acid() {
		return bean_attr_acid;
	}
	public void setBean_attr_acid(Integer bean_attr_acid) {
		this.bean_attr_acid = bean_attr_acid;
	}
	public Integer getBean_attr_aroma() {
		return bean_attr_aroma;
	}
	public void setBean_attr_aroma(Integer bean_attr_aroma) {
		this.bean_attr_aroma = bean_attr_aroma;
	}
	public Integer getBean_attr_body() {
		return bean_attr_body;
	}
	public void setBean_attr_body(Integer bean_attr_body) {
		this.bean_attr_body = bean_attr_body;
	}
	public Integer getBean_attr_after() {
		return bean_attr_after;
	}
	public void setBean_attr_after(Integer bean_attr_after) {
		this.bean_attr_after = bean_attr_after;
	}
	public Integer getBean_attr_bal() {
		return bean_attr_bal;
	}
	public void setBean_attr_bal(Integer bean_attr_bal) {
		this.bean_attr_bal = bean_attr_bal;
	}
	public String getBean_aroma() {
		return bean_aroma;
	}
	public void setBean_aroma(String bean_aroma) {
		this.bean_aroma = bean_aroma;
	}
	public Integer getProd_price() {
		return prod_price;
	}
	public void setProd_price(Integer prod_price) {
		this.prod_price = prod_price;
	}
	public Double getProd_wt() {
		return prod_wt;
	}
	public void setProd_wt(Double prod_wt) {
		this.prod_wt = prod_wt;
	}
	public Integer getSend_fee() {
		return send_fee;
	}
	public void setSend_fee(Integer send_fee) {
		this.send_fee = send_fee;
	}
	public Integer getProd_sup() {
		return prod_sup;
	}
	public void setProd_sup(Integer prod_sup) {
		this.prod_sup = prod_sup;
	}
	public String getProd_cont() {
		return prod_cont;
	}
	public void setProd_cont(String prod_cont) {
		this.prod_cont = prod_cont;
	}
	public byte[] getProd_pic1() {
		return prod_pic1;
	}
	public void setProd_pic1(byte[] prod_pic1) {
		this.prod_pic1 = prod_pic1;
	}
	public byte[] getProd_pic2() {
		return prod_pic2;
	}
	public void setProd_pic2(byte[] prod_pic2) {
		this.prod_pic2 = prod_pic2;
	}
	public byte[] getProd_pic3() {
		return prod_pic3;
	}
	public void setProd_pic3(byte[] prod_pic3) {
		this.prod_pic3 = prod_pic3;
	}
	public String getProd_stat() {
		return prod_stat;
	}
	public void setProd_stat(String prod_stat) {
		this.prod_stat = prod_stat;
	}
	public Date getEd_time() {
		return ed_time;
	}
	public void setEd_time(Date ed_time) {
		this.ed_time = ed_time;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bean_aroma == null) ? 0 : bean_aroma.hashCode());
		result = prime * result + ((bean_attr_acid == null) ? 0 : bean_attr_acid.hashCode());
		result = prime * result + ((bean_attr_after == null) ? 0 : bean_attr_after.hashCode());
		result = prime * result + ((bean_attr_aroma == null) ? 0 : bean_attr_aroma.hashCode());
		result = prime * result + ((bean_attr_bal == null) ? 0 : bean_attr_bal.hashCode());
		result = prime * result + ((bean_attr_body == null) ? 0 : bean_attr_body.hashCode());
		result = prime * result + ((bean_contry == null) ? 0 : bean_contry.hashCode());
		result = prime * result + ((bean_el == null) ? 0 : bean_el.hashCode());
		result = prime * result + ((bean_farm == null) ? 0 : bean_farm.hashCode());
		result = prime * result + ((bean_farmer == null) ? 0 : bean_farmer.hashCode());
		result = prime * result + ((bean_grade == null) ? 0 : bean_grade.hashCode());
		result = prime * result + ((bean_region == null) ? 0 : bean_region.hashCode());
		result = prime * result + ((bean_type == null) ? 0 : bean_type.hashCode());
		result = prime * result + ((ed_time == null) ? 0 : ed_time.hashCode());
		result = prime * result + ((proc == null) ? 0 : proc.hashCode());
		result = prime * result + ((prod_cont == null) ? 0 : prod_cont.hashCode());
		result = prime * result + ((prod_name == null) ? 0 : prod_name.hashCode());
		result = prime * result + ((prod_no == null) ? 0 : prod_no.hashCode());
		result = prime * result + Arrays.hashCode(prod_pic1);
		result = prime * result + Arrays.hashCode(prod_pic2);
		result = prime * result + Arrays.hashCode(prod_pic3);
		result = prime * result + ((prod_price == null) ? 0 : prod_price.hashCode());
		result = prime * result + ((prod_stat == null) ? 0 : prod_stat.hashCode());
		result = prime * result + ((prod_sup == null) ? 0 : prod_sup.hashCode());
		result = prime * result + ((prod_wt == null) ? 0 : prod_wt.hashCode());
		result = prime * result + ((roast == null) ? 0 : roast.hashCode());
		result = prime * result + ((send_fee == null) ? 0 : send_fee.hashCode());
		result = prime * result + ((store_no == null) ? 0 : store_no.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProdVO other = (ProdVO) obj;
		if (bean_aroma == null) {
			if (other.bean_aroma != null)
				return false;
		} else if (!bean_aroma.equals(other.bean_aroma))
			return false;
		if (bean_attr_acid == null) {
			if (other.bean_attr_acid != null)
				return false;
		} else if (!bean_attr_acid.equals(other.bean_attr_acid))
			return false;
		if (bean_attr_after == null) {
			if (other.bean_attr_after != null)
				return false;
		} else if (!bean_attr_after.equals(other.bean_attr_after))
			return false;
		if (bean_attr_aroma == null) {
			if (other.bean_attr_aroma != null)
				return false;
		} else if (!bean_attr_aroma.equals(other.bean_attr_aroma))
			return false;
		if (bean_attr_bal == null) {
			if (other.bean_attr_bal != null)
				return false;
		} else if (!bean_attr_bal.equals(other.bean_attr_bal))
			return false;
		if (bean_attr_body == null) {
			if (other.bean_attr_body != null)
				return false;
		} else if (!bean_attr_body.equals(other.bean_attr_body))
			return false;
		if (bean_contry == null) {
			if (other.bean_contry != null)
				return false;
		} else if (!bean_contry.equals(other.bean_contry))
			return false;
		if (bean_el == null) {
			if (other.bean_el != null)
				return false;
		} else if (!bean_el.equals(other.bean_el))
			return false;
		if (bean_farm == null) {
			if (other.bean_farm != null)
				return false;
		} else if (!bean_farm.equals(other.bean_farm))
			return false;
		if (bean_farmer == null) {
			if (other.bean_farmer != null)
				return false;
		} else if (!bean_farmer.equals(other.bean_farmer))
			return false;
		if (bean_grade == null) {
			if (other.bean_grade != null)
				return false;
		} else if (!bean_grade.equals(other.bean_grade))
			return false;
		if (bean_region == null) {
			if (other.bean_region != null)
				return false;
		} else if (!bean_region.equals(other.bean_region))
			return false;
		if (bean_type == null) {
			if (other.bean_type != null)
				return false;
		} else if (!bean_type.equals(other.bean_type))
			return false;
		if (ed_time == null) {
			if (other.ed_time != null)
				return false;
		} else if (!ed_time.equals(other.ed_time))
			return false;
		if (proc == null) {
			if (other.proc != null)
				return false;
		} else if (!proc.equals(other.proc))
			return false;
		if (prod_cont == null) {
			if (other.prod_cont != null)
				return false;
		} else if (!prod_cont.equals(other.prod_cont))
			return false;
		if (prod_name == null) {
			if (other.prod_name != null)
				return false;
		} else if (!prod_name.equals(other.prod_name))
			return false;
		if (prod_no == null) {
			if (other.prod_no != null)
				return false;
		} else if (!prod_no.equals(other.prod_no))
			return false;
		if (!Arrays.equals(prod_pic1, other.prod_pic1))
			return false;
		if (!Arrays.equals(prod_pic2, other.prod_pic2))
			return false;
		if (!Arrays.equals(prod_pic3, other.prod_pic3))
			return false;
		if (prod_price == null) {
			if (other.prod_price != null)
				return false;
		} else if (!prod_price.equals(other.prod_price))
			return false;
		if (prod_stat == null) {
			if (other.prod_stat != null)
				return false;
		} else if (!prod_stat.equals(other.prod_stat))
			return false;
		if (prod_sup == null) {
			if (other.prod_sup != null)
				return false;
		} else if (!prod_sup.equals(other.prod_sup))
			return false;
		if (prod_wt == null) {
			if (other.prod_wt != null)
				return false;
		} else if (!prod_wt.equals(other.prod_wt))
			return false;
		if (roast == null) {
			if (other.roast != null)
				return false;
		} else if (!roast.equals(other.roast))
			return false;
		if (send_fee == null) {
			if (other.send_fee != null)
				return false;
		} else if (!send_fee.equals(other.send_fee))
			return false;
		if (store_no == null) {
			if (other.store_no != null)
				return false;
		} else if (!store_no.equals(other.store_no))
			return false;
		return true;
	}

	
}
