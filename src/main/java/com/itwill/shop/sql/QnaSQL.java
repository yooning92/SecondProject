package com.itwill.shop.sql;

public class QnaSQL {
	public static final String QNA_CREATE =
			"insert into qna(q_no, q_title, u_id, q_content, q_groupno, q_step) values(qna_q_no_seq.nextval, ?, ?, ?, qna_q_no_seq.currval, 0)";

	public static final String QNA_SELECT_ALL = 
			"select * FROM (SELECT rownum idx, s.* FROM(SELECT q_no, q_title, u_id, q_date, q_readcount, q_groupno, q_step, q_depth FROM qna ORDER BY q_groupno DESC, q_step ASC)s)WHERE idx >= ? AND idx <= ?";
	
	public static final String QNA_DELETE_NO = 
			"DELETE qna WHERE q_no = ?";
	
	public static final String QNA_UPDATE = 
			"UPDATE qna SET q_title = ?, q_content = ?, u_id = ? WHERE q_no = ?";
	
	public static final String QNA_SELECT_BY_NO = 
			"SELECT q_no, q_title, u_id, q_content, q_date, q_readcount, q_groupno, q_step, q_depth FROM qna WHERE q_no = ?";

	public static final String QNA_REPLY_CREATE = 
			"INSERT INTO qna(q_no, q_title, u_id, q_content, q_groupno, q_step, q_depth) VALUES (qna_q_no_seq.nextval, ?, ?, ?, ?, ?, ?)";
	
	public static final String QNA_SORT = 
			"UPDATE qna SET q_step = q_step + 1 WHERE q_step > ? AND q_groupno = ?";
	
	public static final String QNA_REPLY_CHECK = 
			"SELECT count(*) cnt FROM qna WHERE q_groupno = ? AND q_depth >= ? AND q_step >= ? ORDER BY q_step, q_depth ASC";
	
	public static final String QNA_READCOUNTUP = 
			"UPDATE qna SET q_readcount = q_readcount+1 WHERE q_no = ?";
	
	public static final String QNA_COUNT = 
			"SELECT COUNT(*) FROM qna";
}