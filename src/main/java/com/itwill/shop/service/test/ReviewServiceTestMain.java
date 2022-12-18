package com.itwill.shop.service.test;

import java.util.ArrayList;
import java.util.Date;

import com.itwill.shop.dto.OrderItem;
import com.itwill.shop.dto.Product;
import com.itwill.shop.dto.review.Review;
import com.itwill.shop.service.ReviewService;

public class ReviewServiceTestMain {

	public static void main(String[] args) throws Exception {
		
		ReviewService reviewService = new ReviewService();
		Review review = new Review(0, null, null, null, 0, null, 0, "test6", null);
		
		ArrayList<Review> reviewList=
		reviewService.selectAllByUserId(review);
		System.out.println(reviewList);
		
		review = new Review(10, null, null, null, 0, null, 0, "test6", null);
		System.out.println(reviewService.updateClickCountByReviewNo(review));
		System.out.println(reviewService.selectByReviewNo(review));

		review = new Review(10, null, null, null, 0, null, 0, "test6", null);
		//System.out.println(reviewService.updateByReviewNo(review));
		
		Product product = new Product(1,null,0,null,null,0,null);
		System.out.println(	reviewService.selectAllByProductNo(new Review(0,null,null,null,0,null,0,null,
													new OrderItem(0,0,0,
																	product
																))));
		
		ArrayList<Review> arrayList = new ArrayList<Review>(0);
		arrayList.size();
		System.out.println(arrayList.size());
		
		//System.out.println(reviewService.deleteByReviewNo(new Review(19, null, null, null, 0, null, 0, "test6", null)));
		int o_no=0;
		System.out.println("o_no로 작성된 review_count");
		System.out.println(reviewService.countReviewByOrderNo(o_no));
		review = new Review(15, null, null, null, 0, null, 0, "test6", null);
		review = reviewService.selectByReviewNo(review);
		System.out.println(review.getR_content().length());
		/*
		public static final String CREATE_REVIEW =
				"insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no)\n"
				+ "values(REVIEW_R_NO_SEQ.nextval, ?, ?, sysdate, ?, ?, 0, ?, ?);";
		 */
		/*
		 	private int r_no;
			private String r_title;
			private String r_content;
			
			private Date r_date;
			private int r_rating;
			private String r_image;
			private int r_click_count;
			
			private String u_id;
			
			private OrderItem orderItem;	// oi_no
		 */
		review = new Review(0, "청소할때 기분이 좋아요~ ", "청소할때 기분이 좋아요~ 청소할때 기분이 좋아요~ 청소할때 기분이 좋아요~ 청소할때 기분이 좋아요~ 청소할때 기분이 좋아요~ ", null,  5, null, 0, "test4", new OrderItem(48,0,0,null));
		
		System.out.println(reviewService.createReview(review));
		
	}

}
