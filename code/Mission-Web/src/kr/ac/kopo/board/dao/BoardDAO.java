package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	/**
	 * 새글등록
	 */
	public void insert(BoardVO board) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content) ");
		sql.append("	values(seq_t_board_no.nextval, ? , ? , ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 전체 게시글 조회
	 */
	public List<BoardVO> selectAll(){
		List<BoardVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("	from t_board ");
		sql.append("	order by no desc ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int no 			= rs.getInt("no");
				String title 	= rs.getString("title");
				String writer 	= rs.getString("writer");
				String regDate 	= rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				// 글 하나에 대한 객체를 List에 담기
				list.add(board);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 게시글 1개 조회
	 */
	public BoardVO selectOne(int boardNo) {
		BoardVO board = new BoardVO();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("	, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("	from t_board ");
		sql.append("	where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			board.setNo(rs.getInt("no"));
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setContent(rs.getString("content"));
			board.setViewCnt(rs.getInt("view_cnt"));
			board.setRegDate(rs.getString("reg_date"));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	/**
	 * 조회수 증가
	 */
	public void incrementViewCNT(int boardNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append(" set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, boardNo);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 게시물 삭제
	 */
	public void delete(int boardNo) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from t_board where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 게시물 수정
	 */
	
	public void update(BoardVO board) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board set  ");
		sql.append("title = ? , content = ? ");
		sql.append("where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
