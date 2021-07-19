package kr.co.hn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.hn.util.ConnectionFactory;
import kr.co.hn.vo.QNABoradVO;

public class QNABoardDAO {

	public int insertQ(QNABoradVO vo) {
		
		int result = -1;
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into hn_qna( ");
		sql.append("    no, group_no, parent_no, writer, subject, content ");
		sql.append(" )values( ");
		sql.append("    SEQ_HN_QNA.nextval, ");
		sql.append("    SEQ_HN_QNA.currval, ");
		sql.append("    SEQ_HN_QNA.currval, ");
		sql.append("    ?, ?, ?) ");
		
		/*
insert into hn_qna(
    no, group_no, parent_no, writer, subject, content
)values(
    SEQ_HN_QNA.nextval,
    SEQ_HN_QNA.currval,
    SEQ_HN_QNA.currval,
    ?, ?, ?);
		 */
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			int loc = 1;
			pstmt.setString(loc++, vo.getWriter());
			pstmt.setString(loc++, vo.getSubject());
			pstmt.setString(loc++, vo.getContent());

			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public static void main(String[] args) {
		
		QNABoradVO vo = new QNABoradVO();
		vo.setWriter("haeni");
		vo.setSubject("#2 : 테스트");
		vo.setContent("내용무");
		
		QNABoardDAO dao = new QNABoardDAO();
		int result = dao.insertQ(vo);
		
		System.out.println(result);
		
	}
}
