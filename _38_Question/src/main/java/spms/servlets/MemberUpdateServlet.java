package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;
import spms.vo.Member;

@WebServlet("/member/update")
@SuppressWarnings("serial")
public class MemberUpdateServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MemberUpdateServlet::doGet() 호출");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
		      ServletContext sc = this.getServletContext();
		      conn = (Connection) sc.getAttribute("conn"); 

		      MemberDao memberDao = new MemberDao();
		      memberDao.setConnection(conn);
		       
		      Member member = memberDao.selectOne(
		          Integer.parseInt(req.getParameter("no")));

		      req.setAttribute("member", member);
			/*
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("driver"));
			conn = DriverManager.getConnection(
						sc.getInitParameter("url"),
						sc.getInitParameter("username"),
						sc.getInitParameter("password")
					);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(
					"SELECT mno,email,mname,cre_date FROM members" +
					" WHERE mno=" + req.getParameter("no")
					);
			
			if (rs.next()) {
				req.setAttribute("member", 
					new Member()
						.setNo(rs.getInt("MNO"))
						.setEmail(rs.getString("EMAIL"))
						.setName(rs.getString("MNAME"))
						.setCreatedDate(rs.getDate("CRE_DATE")));
				
			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}
			*/
			
			RequestDispatcher rd = req.getRequestDispatcher(
					"/member/MemberUpdateForm.jsp");
			rd.forward(req, resp);			
			

		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}finally {
			try {if(rs!=null) rs.close();} catch(Exception e) {}
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
			//try {if(conn!=null) conn.close();} catch(Exception e) {}			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MemberUpdateServlet::doPost() 호출");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
		      ServletContext sc = this.getServletContext();
		      conn = (Connection) sc.getAttribute("conn"); 

		      MemberDao memberDao = new MemberDao();
		      memberDao.setConnection(conn);
		         
		      memberDao.update(new Member()
				      .setNo(Integer.parseInt(req.getParameter("no")))
				      .setName(req.getParameter("name"))
				      .setEmail(req.getParameter("email")));			
			
			/*
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("driver"));
			conn = DriverManager.getConnection(
						sc.getInitParameter("url"),
						sc.getInitParameter("username"),
						sc.getInitParameter("password")
					);
			stmt = conn.prepareStatement(
						"UPDATE members SET email=?, mname=?, mod_date=NOW()"
					+ " WHERE mno=?"
					);
			stmt.setString(1,  req.getParameter("email"));
			stmt.setString(2,  req.getParameter("name"));
			stmt.setInt(3,  Integer.parseInt(req.getParameter("no")));
			stmt.executeUpdate();
			*/
			
			resp.sendRedirect("list");
			
		}catch(Exception e) {
			//throw new ServletException(e);
			e.printStackTrace();
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}finally {
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
			//try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
	}
}












