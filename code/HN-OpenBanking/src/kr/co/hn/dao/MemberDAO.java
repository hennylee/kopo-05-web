package kr.co.hn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.co.hn.vo.MemberVO;
import kr.co.hn.util.ConnectionFactory;

public class MemberDAO {
	public int join(MemberVO member) {
		
		int result = -1;
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_member ");
		sql.append("(id, name,resident_num1,resident_num2 password, email_id, email_domain,tel1, tel2, tel3, post, basic_addr,detail_addr, type) ");
		sql.append("values(?, ?,?,? ?, ?, ?, ?, ?, ?, ?, ?, ?, 'U')");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){

			int loc = 1;
			pstmt.setString(loc++, member.getId() );
			pstmt.setString(loc++, member.getName());
			pstmt.setString(loc++, member.getResidentNum1());
			pstmt.setString(loc++, member.getResidentNum2());
			pstmt.setString(loc++, member.getPassword());
			pstmt.setString(loc++, member.getEmailId());
			pstmt.setString(loc++, member.getEmailDomain());
			pstmt.setString(loc++, member.getTel1());
			pstmt.setString(loc++, member.getTel2());
			pstmt.setString(loc++, member.getTel3());
			pstmt.setString(loc++, member.getPost());
			pstmt.setString(loc++, member.getBasicAddr());
			pstmt.setString(loc++, member.getDetailAddr());
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}