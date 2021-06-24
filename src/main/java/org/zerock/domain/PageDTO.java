package org.zerock.domain;

import lombok.Getter;

@Getter
public class PageDTO {

//	private int pageNum;
//	private int amount;
	private Criteria cri;
	
	private int startPage; // 현재 페이지 기준 시작 페이지
	private int endPage; // 현재 페이지 기준 마지막 페이지
	
	private boolean prev; // 1페이지가 아니면 이전페이지 버튼 표시 유무
	private boolean next; // 다음 페이지가 있으면 버튼 표시 유무
	
	private int total;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		
		int current = cri.getPageNum();
		int numPerPage = cri.getAmount();
		
		// 만약 현재 1~10page 사이에 있다면
		// 맨 왼쪽 시작은 1, 종료는 10 // 근데 전체 페이지가 10이하면? 
		
		// 11~20 사이면
		// 맨 왼쪽 11 오른쪽은 20
		
		this.endPage = ((current-1) / 10 + 1) * 10;
		this.startPage = endPage - 9;
		
		
		// 가장 마지막 페이지
		int realEnd = total / numPerPage;
		
		if(total % numPerPage != 0) {
			realEnd = realEnd + 1;
		}
		
		this.endPage = Math.min(endPage, realEnd); // 둘중 작은 값이 드루감
		
		
		// 이전 다음 표시 여부
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
		
	}
}
