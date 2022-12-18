package com.itwill.shop.dao.test;

import java.util.ArrayList;
import java.util.Date;

import com.itwill.shop.dao.ReviewDao;
import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;
import com.itwill.shop.dto.review.Review;


public class ReviewDaoTestMain {
	public static void main(String[] args) throws Exception {
		ReviewDao reviewDao = new ReviewDao();
		
		ArrayList<Review> reviewList = new ArrayList<Review>();
		/*
		 * 	private int r_no;
			private String r_title;
			private String r_content;
			
			private Date r_date;
			private int r_rating;
			private String r_image;
			private int r_click_count;
			
			private String u_id;
			
			private OrderItem orderItem;	// oi_no
		 */
		Review findReview = new Review(0, null, null, null, 0, null, 0, "test6", null);
		
		/* ------ review select------ */
		System.out.println("1.(마이페이지-리뷰list)로그인한 회원이 마이페이지에서 리뷰를 모아서 볼 수 있음");
		reviewList=
		reviewDao.selectAllByUserId(findReview);
		for (Review review : reviewList) {
			System.out.println(review);
		}
		
		System.out.println("2.(마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택");
		findReview =
		reviewDao.selectByOrderitemNo(new Review(0, null, null, null, 0, null, 0, "test6", new OrderItem(22, 0, 0, null)));
		System.out.println(findReview);
		
		System.out.println("3.(마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택");
		int p_no=10;
		Product product = new Product(p_no, null, 0, null, null, 0, null);
		findReview=new Review(0, null, null, null, 0, null, 0, "test6", new OrderItem(0, 0, 0,product));
		reviewList=
				reviewDao.selectAllByProductNo(findReview);
		for (Review review : reviewList) {
			System.out.println(review);
		}
		
		System.out.println("4.(상품detail-리뷰detail) 리뷰list에서 r_no로 접근");
		findReview=new Review(11, null, null, null, 0, null, 0, "test6", new OrderItem(0, 0, 0,product));
		findReview=
		reviewDao.selectByReviewNo(findReview);
		System.out.println(findReview);
		
		/* ----- review update ----*/
		System.out.println("5.후기detail에서 r_no로 후기 업데이트");
		int r_no=5;
		
		findReview=new Review(r_no, null, null, null, 0, null, 0, "test6", new OrderItem(0, 0, 0,product));
		int result = reviewDao.updateByReviewNo(findReview);
		System.out.println(result);
		
		/* ----- review delete ----*/
		System.out.println("6. u_id로 후기 전체삭제");
		findReview=new Review(0, null, null, null, 0, null, 0, "test6", new OrderItem(0, 0, 0,product));
		result=
		reviewDao.deleteByUserId(findReview);
		System.out.println(result);
		
		System.out.println("7.r_no로 후기 1개삭제");
		findReview=new Review(24, null, null, null, 0, null, 0, "test6", new OrderItem(0, 0, 0,product));
		result=
		reviewDao.deleteByReviewNo(findReview);
		System.out.println(result);
		
		/* ------ review insert------ */
		System.out.println("8.리뷰 작성");
		findReview=new Review(0, "리뷰_daoTestMain", "리뷰_daoTestMain 진행중",null, 0, null,0,"test6", 
								new OrderItem(11, 0, 0, 
										new Product(11, null, 0, null, null, 0, null)));
		result=
				reviewDao.createReview(findReview);
		System.out.println(result);
		
		System.out.println("9.리뷰 작성시, 기존에 작성된 리뷰가 있는지 orderItem_no로 체크");
		findReview= new Review(24, null, null, null, 0, null, 0, "test6", new OrderItem(11, 0, 0, null));
		result=
		reviewDao.isExistedReviewByOrderitemNo(findReview);
		System.out.println(result);
		
		
		
	}

}
