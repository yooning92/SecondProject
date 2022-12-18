package com.itwill.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.dto.CartItem;
import com.itwill.shop.dto.Category;
import com.itwill.shop.dto.Product;
import com.itwill.shop.sql.CartSQL;



public class CartDao {
	
	private DataSource dataSource;
	public CartDao()throws Exception {
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
	
	
	/*
	 1. 카트리스트 불러오기
	 */
	public List<CartItem> getCartItem(String sU_Id)throws Exception{
		
		List<CartItem> cartItemList = new ArrayList<CartItem>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(CartSQL.CART_LIST_SELECT_BY_USERID);
		pstmt.setString(1, sU_Id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			CartItem cartItem =
					new CartItem(rs.getInt("c_no"),
								 rs.getInt("c_qty"), 
								 sU_Id, 
								 new Product(rs.getInt("p_no"), 
										 	 rs.getString("p_name"), 
										 	 rs.getInt("p_price"), 
										 	 rs.getString("p_image"), 
										 	 rs.getString("p_desc"), 
										 	 rs.getInt("p_click_count"), 
										 	 new Category(rs.getInt("cg_no"), 
										 			null)));
			cartItemList.add(cartItem);
		}
		con.close();
		return cartItemList;
	}
	
	/*
	 2. 카트리스트 존재여부 확인
	 */
	public int cartProductCount(CartItem cartItem) throws Exception{
		 Connection con=dataSource.getConnection();
		 PreparedStatement pstmt=con.prepareStatement(CartSQL.CART_SELECT_COUNT_BY_USERID_P_NO);
		 pstmt.setString(1, cartItem.getU_id());
		 pstmt.setInt(2, cartItem.getProduct().getP_no());
		 ResultSet rs = pstmt.executeQuery();
		 rs.next();
		 int product_count = rs.getInt("product_count");
		 con.close();
		return product_count;
	}
	
	/*
	 3. 카트 insert
	 */
	public int add(CartItem cartItem)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCount = 0;
		try {
		con = dataSource.getConnection();
		pstmt= con.prepareStatement(CartSQL.CART_INSERT_LIST);
		pstmt.setInt(1, cartItem.getC_qty());
		pstmt.setString(2, cartItem.getU_id());
		pstmt.setInt(3, cartItem.getProduct().getP_no());
		rowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {				
				con.close();
			}
		}
		return rowCount;
	}
	
	/*
	 4.카트 update
	 */
	public int update(CartItem cartItem)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_USERID_C_NO);
		pstmt.setInt(1,cartItem.getC_qty());
		pstmt.setString(2,cartItem.getU_id());
		pstmt.setInt(3,cartItem.getC_no());
		rowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
			con.close();
			}
		}
		return  rowCount;
	}
	/*
	 4. 카트업데이트(프로덕트 리스트에서)
	 */
	public int updateFromProduct(CartItem cartItem)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(CartSQL.CART_UPDATE);
		pstmt.setInt(1,cartItem.getC_qty());
		pstmt.setString(2,cartItem.getU_id());
		pstmt.setInt(3,cartItem.getProduct().getP_no());
		rowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
			con.close();
			}
		}
		return  rowCount;
	}
	
	/*
	 5. 유저 1명의 카트 전체삭제
	 */
	public int deleteCart(String sU_Id)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(CartSQL.CART_DELETE_BY_USERID);
			pstmt.setString(1, sU_Id);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
	
	/*
	 6.카트 한개 삭제(pk로 삭제)
	 */
	public int deleteCartByNo(int c_no)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(CartSQL.CART_DELETE_BY_C_NO);
			pstmt.setInt(1, c_no);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
	
	/*
	 7. 카트에 있는 물품 하나 선택
	 */
	public CartItem getCartItemByCNo(int c_no)throws Exception{
		CartItem cartItem = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_C_No);
			pstmt.setInt(1, c_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cartItem = new CartItem(rs.getInt("c_no"),
						 				rs.getInt("c_qty"), 
										rs.getString("u_id"), 
										 new Product(rs.getInt("p_no"), 
												 	 rs.getString("p_name"), 
												 	 rs.getInt("p_price"), 
												 	 rs.getString("p_image"), 
												 	 rs.getString("p_desc"), 
												 	 rs.getInt("p_click_count"), 
												 	 new Category(rs.getInt("cg_no"), 
												 			null)));
			}
			
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		
		return cartItem;
	}
}
