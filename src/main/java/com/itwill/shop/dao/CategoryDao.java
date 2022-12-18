package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.Category;
import com.itwill.shop.sql.CategorySQL;


public class CategoryDao {
		private DataSource dataSource;
		public CategoryDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shop/common/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("user"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	
	//selectAll
	public List<Category> selectAll() throws Exception {
		List<Category> categoraysAll = new ArrayList<Category>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_SELECTALL);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			categoraysAll.add(new Category(rs.getInt("cg_no"),
							 			   rs.getString("cg_name")));
		}
		con.close();
		return categoraysAll;
	}
	//selectByName - Category category
	public Category CategoryByName(Category category)throws Exception {
		Category categoryByName  =null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_SLECTBYNAME);
		pstmt.setString(1, category.getCg_name());
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			categoryByName= new Category(rs.getInt("cg_no"),
										 rs.getString("cg_name"));
		}
		con.close();
		return categoryByName;
	}
//selectByName - String cg_name
	public Category CategoryByName(String cg_name)throws Exception{
	Category categoryByName =null;
	Connection con = dataSource.getConnection();
	PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_SLECTBYNAME);
	pstmt.setString(1, cg_name);
	ResultSet rs =pstmt.executeQuery();
	if(rs.next()) {
		categoryByName = new Category(rs.getInt("cg_no"),
									  rs.getString("cg_name"));
	}
	con.close();
	return categoryByName;
}

//selectByNo - Category category
	public Category CategoryByNo(Category category)throws Exception {
		Category categoryByNo = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_SELECTBYNO);
		pstmt.setInt(1, category.getCg_no());
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			categoryByNo = new Category(rs.getInt("cg_no"),
										rs.getString("cg_name"));
		}
		return categoryByNo;
	}
//selectByNo - int cg_no	
public Category categoryByNo(int cg_no)throws Exception {
	Category categoryByNo = null;
	Connection con = dataSource.getConnection();
	PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_SELECTBYNO);
	pstmt.setInt(1, cg_no);
	ResultSet rs= pstmt.executeQuery();
	if(rs.next()) {
		categoryByNo =new Category(rs.getInt("cg_no"),
								   rs.getString("cg_name"));
	}
	con.close();
	return categoryByNo;
}

/*****************관리자용********************************************/
//insert <관리자용> -Category category
public int insertCategory(Category category)throws Exception{
	Connection con = dataSource.getConnection();
	PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_INSERT);
	pstmt.setInt(1, category.getCg_no());
	pstmt.setString(2, category.getCg_name());
	int rowCount =pstmt.executeUpdate();
	return rowCount;
}
//insert <관리자용> -int cg_no, String cg_name
public int insertCategory(int cg_no,String cg_name)throws Exception{
	Connection con = dataSource.getConnection();
	PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_INSERT);
	pstmt.setInt(1, cg_no);
	pstmt.setString(2, cg_name);
	int rowCount =pstmt.executeUpdate();
	return rowCount;
}

//update <관리자용> - Category category
	public int categoryUpdate(Category category) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_UPDATE);
		pstmt.setString(1, category.getCg_name());
		pstmt.setInt(2, category.getCg_no());
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
//update <관리자용> - String cg_name, int cg_no
	public int categoryUpdate(String cg_name, int cg_no) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_UPDATE);
		pstmt.setString(1, cg_name);
		pstmt.setInt(2, cg_no);
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
	
	
//delete <관리자용> - Category category
	public int categoryDelete(Category category) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_DELETE);
		pstmt.setInt(1, category.getCg_no());
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
//delete <관리자용> - int cg_no
	public int categoryDelete(int cg_no) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CategorySQL.CATEGORAY_DELETE);
		pstmt.setInt(1, cg_no);
		int rowCount = pstmt.executeUpdate();
		con.close();
		return rowCount;
	}	
}
