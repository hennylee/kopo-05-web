package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
	/**
	 * t_board의 시퀀스를 추출하는 메소드
	 */
	public int selectNo() {
		String sql = "select seq_t_board_no.nextval from dual";
		int no = -1;
		
		try(
				
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			
		) {
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return no;
	}
	
	
	/**
	 * 새글등록
	 */
	public void insert(BoardVO board) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content) ");
		/* sql.append("	values(seq_t_board_no.nextval, ? , ? , ?) "); */
		sql.append(" values(?, ? , ? , ?) "); 
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			/*
			index 번호로 추출하게 되면, 쿼리가 변경될때마다 번호를 바꿔줘야 하기 때문에, 
			(1) 컬럼명으로 데이터를 추출하거나
			(2) int loc = 1;을 만들어주고 loc++로 index 번호를 변수화해주는 것이 좋다.  
			 */
			int loc = 1;
			
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			
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
	public BoardVO selectByNo(int boardNo) {
		BoardVO board = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("	, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("  from t_board ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardVO();

				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setViewCnt(rs.getInt("view_cnt"));
				board.setRegDate(rs.getString("reg_date"));
			}
			
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
		sql.append(" 	set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");
		
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
		sql.append("	title = ? , content = ? ");
		sql.append("  where no = ? ");
		
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
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	/////////////                     t_board_file의 CRUD							//////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	
	/**
	 * 
	 */
	public void insertFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file(no, board_no, file_ori_name ");
		sql.append("	, file_save_name, file_size) ");
		sql.append("  values(seq_t_board_file_no.nextval, ?,?,?,?) ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			int loc = 1;
			pstmt.setInt(loc++ , fileVO.getBoardNo());
			pstmt.setString(loc++ , fileVO.getFileOriName());
			pstmt.setString(loc++ , fileVO.getFileSaveName());
			pstmt.setInt(loc++ , fileVO.getFileSize());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	public List<BoardFileVO> selectFilesByNo(int boardNo) {
		List<BoardFileVO> fileList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append("	from t_board_file ");
		sql.append("  where board_no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardFileVO fileVO = new BoardFileVO();
				
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));
				
				fileList.add(fileVO);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return fileList;
	}
	
}
