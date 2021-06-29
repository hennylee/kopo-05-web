package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class memberDAO {
	/**
	 * 회원가입
	 */
	public int join(MemberVO member) {
		
		int result = -1;
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_member ");
		sql.append("(id, name, password, email_id, email_domain,tel1, tel2, tel3, post, basic_addr,detail_addr) ");
		sql.append("values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){

			pstmt.setString(1, member.getId() );
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getEmailId());
			pstmt.setString(5, member.getEmailDomain());
			pstmt.setString(6, member.getTel1());
			pstmt.setString(7, member.getTel2());
			pstmt.setString(8, member.getTel3());
			pstmt.setString(9, member.getPost());
			pstmt.setString(10, member.getBasicAddr());
			pstmt.setString(11, member.getDetailAddr());
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
