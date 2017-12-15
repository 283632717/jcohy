package com.jcohy.model;
import javax.persistence.*;
import java.io.Serializable;


/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 2:06 2017/12/16
 * Email: jia_chao23@126.com
 * ClassName: Options
 * Description:
 **/

@Entity
@Table(name = "options")
public class Options extends AbstractModel implements Serializable {


	private static final long serialVersionUID = -7370664893843513614L;


	private String optionKey;

	private String optionValue;

	private String description;

	public String getOptionKey() {
		return optionKey;
	}

	public void setOptionKey(String optionKey) {
		this.optionKey = optionKey;
	}

	public String getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}