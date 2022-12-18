/*  [성윤 작성]
	public static final String REVIEW_SELECT_ALL_USER_BY_ID =
		(1)	"select * from review where u_id = ?;";
	
	public static final String REVIEW_SELECT_BY_NO_USER_ID = 
		(2)	"select * from review r join orderitem o on r.oi_no = o.oi_no where r.u_id = ? and o.p_no = ?;";
	
	public static final String REVIEW_UPDATE_BY_P_NO_USER_BY_ID = 
		(3)	"update review set r_title = ?, r_content = ? where u_id = ? and oi_no = ?;";
	
	public static final String REVIEW_DELETE_ALL_USER_BY_ID =
		(4)	"delete from review where u_id = ?;";
	
	public static final String REVIEW_DELETE_BY_NO_USER_BY_ID = 
		(5)	"delete from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no = ?) where u_id = ?;";
*/
/* ------ review insert------ */
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰1', '리뷰1 내용', 'test1', 1);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰2', '리뷰2 내용', 'test2', 2);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰3', '리뷰3 내용', 'test1', 3);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰4 제목', '리뷰4 내용', 'test6', 19);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰5 제목', '리뷰5 내용', 'test6', 22);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰5 제목', '리뷰5 내용', 'test6', 23);


--오류 보고 -ORA-02291: integrity constraint (M2205JDEVELOPER#TEAM3.IDX_REVIEW_FK0) violated - parent key not found
--insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰77 제목', '리뷰77 내용', 'test7', 24);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰6 제목', '리뷰6 내용', 'test6', 24);

select * from orders;

select * from cart;
select * from cart c join product p on c.p_no=p.p_no where c.u_id='user1';

--insert시, 해당 oi_no로 작성된 후기가 있는지 체크
select count(*) from review where oi_no=11;



/* ------ review select------ */
-- ***리뷰 선택***

-- (마이페이지-리뷰list) 로그인한 회원이 마이페이지?에서 리뷰를 모아서 볼 수 있음 -> u_id로 review 선택
--(1)
select * from review where u_id = 'test6';

-- (마이페이지-리뷰detail)로그인한 회원이 주문아이템번호로 리뷰 선택 -> 같은 상품을 여러개 살 수도 있음
select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.oi_no=7;

-- 어차피 u_id로 select된 리스트에서 선택하는 건데, u_id를 조건에 또 줘야할까?
--select * from review r join orderitem oi on r.oi_no = oi.oi_no where r.u_id = 'test6' and oi.oi_no=22;


-- u_id와 p_no로 review를 선택하고 리뷰와 주문아이템과 함께 보여줌 -> 로그인한 회원이 상품번호로 리뷰 선택
--select * from review r join orderitem oi on r.oi_no = oi.oi_no where r.u_id = 'test6';
--(2) 이건 언제 쓰이지??
select * from review r join orderitem oi on r.oi_no = oi.oi_no where r.u_id = 'test6' and p_no=11;


--(상품detail-리뷰list) 상품목록에서 리뷰를 보여주려면, p_no로 접근
select * from review r join orderitem oi on r.oi_no = oi.oi_no where p_no=1 order by o_no desc;

--(상품detail-리뷰detail) 
select * from review where r_no=26;

--(order_detail)작성된 리뷰가 있다면, 구매확정
--      >> 첫번째 리뷰작성시, check하는 경우
select count(*) from review r
join orderitem oi on r.oi_no=oi.oi_no
join orders o on oi.o_no=o.o_no
where o.o_no=7;


/* ----- review update ----*/
--(3) u_id와 oi_no가 모두 필요한가?
update review set r_title = ?, r_content = ? where u_id = ? and oi_no = ?;

-- update는 후기목록에서 선택할테니, pk이인 r_no로 접근해야하는건 아닌가?
update review set r_title = '9번 리뷰 제목_수정', r_content = '9번 리뷰 내용_수정' where r_no= 9;

--리뷰 수정
select * from review where r_no= 10;
update review set r_title = '(수정)리뷰 제목', r_content = '(수정)리뷰 내용', r_rating=5,r_image='a.jpg' where r_no= 10;

/* ----- review delete ----*/
--(4) u_id를 통해서 후기 전체삭제
--select * from review where u_id = 'test1';
--rollback;
delete from review where u_id = 'test1';

--(5) 1명의 유저가 같은 상품을 여러번 샀을 경우를 생각해보자-> r_no로 접근해야하지 않을까?
--      p_no의 후기 중에서 u_id를 고르니까..
delete from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no = 11) where u_id = 'test6';

--(마이페이지-후기)에서 1개의 후기 삭제
select * from review where r_no=26;
--delete from review where r_no=26;


--(상품페이지-후기)에서 1개의 후기 삭제
--select * from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no = 11);
select * from (select * from review r join orderitem o on r.oi_no = o.oi_no where o.p_no = 11) where r_no=26;

select * from review where r_no=26;
--delete from review where r_no=26;

--(주문내역 삭제)에서 o_no로 연관된 후기들 삭제
--select * from review r join orderitem oi on r.oi_no = oi.oi_no where oi.o_no = 7;
delete from review r join orderitem oi on r.oi_no = oi.oi_no where oi.o_no = 7;

--click count 증가
select * from review where r_no = 10;

update review set r_click_count=r_click_count+1 where r_no = 9;



desc review;
