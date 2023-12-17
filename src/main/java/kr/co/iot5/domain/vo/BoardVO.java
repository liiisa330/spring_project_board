package kr.co.iot5.domain.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int newNum 	;  
	private int num 	; //int PK 
	private String writer 	; //varchar(20) 
	private String subject ; //varchar(1000) 
	private String content ; //longtext 
	private String reg_date; //datetime 
	private int readcount; //int 
	private int lev 	; //int 
	private int step 	; //int 
	private int ref 	; //int 
	private String ip 		; //varchar(100) 
	private String passwd 	; //varchar(100) 
	private String email 	; //varchar(100)
	private int no;
	private int startRow;
	private int endRow;
}
