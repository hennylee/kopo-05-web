package kr.co.hn.vo;

public class QNABoradVO {
/*
CREATE TABLE HN_QNA(
    no NUMBER(38),
    group_no number(38), -- 글그룹 (= 최상단 부모글번호)
    group_order number(38) default 0, -- 그룹 동일 depth간 순서? (글번호로 정렬 가능할듯)
    group_depth number(38) default 0, -- 그룹 내 depth
    parent_no  number(38), -- 직계 부모 글번호
    writer varchar2(20),
    subject varchar2(200),
    content varchar2(4000),
    type char(1) default 'Q',
    view_cnt number(38) default 0,
    regdate date default sysdate,
    CONSTRAINT hn_qna_no_pk PRIMARY key(no)  
);
 */
	
    private int no;
    private int group_no; // 글그룹 (= 최상단 부모글번호)
    private int group_order; // 그룹 동일 depth간 순서? (글번호로 정렬 가능할듯)
	private int group_depth; // 그룹 내 depth
	private int parent_no; // 직계 부모 글번호
	private String writer;
	private String subject;
	private String content;
	private String type;
	private int view_cnt;
	private String regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public int getGroup_order() {
		return group_order;
	}
	public void setGroup_order(int group_order) {
		this.group_order = group_order;
	}
	public int getGroup_depth() {
		return group_depth;
	}
	public void setGroup_depth(int group_depth) {
		this.group_depth = group_depth;
	}
	public int getParent_no() {
		return parent_no;
	}
	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "QNABoradVO [no=" + no + ", group_no=" + group_no + ", group_order=" + group_order + ", group_depth="
				+ group_depth + ", parent_no=" + parent_no + ", writer=" + writer + ", subject=" + subject
				+ ", content=" + content + ", type=" + type + ", view_cnt=" + view_cnt + ", regdate=" + regdate + "]";
	}

	
	
	
	
	
}
