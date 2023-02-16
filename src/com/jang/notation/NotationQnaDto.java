package com.jang.notation;

import java.util.Date;

public class NotationQnaDto {
	private String nqID, content, img, 
	sub, mycolor, nkey, id;
	private Date wdate;

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getNqID() {
		return nqID;
	}

	public void setNqID(String nqID) {
		this.nqID = nqID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getMycolor() {
		return mycolor;
	}

	public void setMycolor(String mycolor) {
		this.mycolor = mycolor;
	}

	public String getNkey() {
		return nkey;
	}

	public void setNkey(String nkey) {
		this.nkey = nkey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
