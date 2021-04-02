package com.practice.first.board.model.vo;

import java.sql.Date;

public class Reply {
	
	private int rId;
	private String rContent;
	private int refBid;
	private String rWriter;
	private Date rCreateDate;
	private Date rmodifyDate;
	private String rStatus;
	private int refRid;
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(int rId, String rContent, int refBid, String rWriter, Date rCreateDate, Date rmodifyDate,
			String rStatus, int refRid) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.rCreateDate = rCreateDate;
		this.rmodifyDate = rmodifyDate;
		this.rStatus = rStatus;
		this.refRid = refRid;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getRefBid() {
		return refBid;
	}
	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public Date getrCreateDate() {
		return rCreateDate;
	}
	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}
	public Date getRmodifyDate() {
		return rmodifyDate;
	}
	public void setRmodifyDate(Date rmodifyDate) {
		this.rmodifyDate = rmodifyDate;
	}
	public String getrStatus() {
		return rStatus;
	}
	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}
	public int getRefRid() {
		return refRid;
	}
	public void setRefRid(int refRid) {
		this.refRid = refRid;
	}
	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWriter=" + rWriter
				+ ", rCreateDate=" + rCreateDate + ", rmodifyDate=" + rmodifyDate + ", rStatus=" + rStatus + ", refRid="
				+ refRid + "]";
	}

	
	
}
