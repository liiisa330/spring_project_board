package kr.co.iot5.domain.vo;

import lombok.Data;

@Data
public class PageVO {
  private int allCnt;
  private int pageCnt;
  private int curPage;
  private int curBlock;
  private int blockCnt;
}
