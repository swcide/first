package com.practice.first.board.model.vo;

public class BoardDTO {
	
	private int prevBid;
	private int NextBid;
	
	
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public BoardDTO(int prevBid, int nextBid) {
		super();
		this.prevBid = prevBid;
		NextBid = nextBid;
	}



	public int getPrevBid() {
		return prevBid;
	}



	public void setPrevBid(int prevBid) {
		this.prevBid = prevBid;
	}



	public int getNextBid() {
		return NextBid;
	}



	public void setNextBid(int nextBid) {
		NextBid = nextBid;
	}



	@Override
	public String toString() {
		return "BoardDTO [prevBid=" + prevBid + ", NextBid=" + NextBid + "]";
	}
	
	

}
