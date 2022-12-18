----------------------------------------------------------userinfo---------------------------------------------------------
--select
--ID로 회원 찾기
select u_id,u_pw,u_name,u_email,u_address,u_phone from userinfo where u_id='test2';

--모든 회원 찾기
select u_id,u_pw,u_name,u_email,u_address,u_phone from userinfo;

--ID 중복 체크
select count(*) cnt from userinfo where u_id='test3';


--update
--회원 정보 수정
update  userinfo set u_pw='pw100' ,u_name='이름수정',u_email='test100@test.com',u_address='주소수정',u_phone='999-9999-9999' where u_id='test1';


--delete
--회원 삭제
delete userinfo where u_id='test4';
---------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------product---------------------------------------------------------
--select
-- product 전체보기
select * from product;

-- product 상품번호(p_no)로 1개 보기
select * from product where p_no = 1 ;

-- product 상품이름(p_name)로 1개 보기
select * from product where p_name = '책상';



--update
-- product 상품번호(p_no)로 불러서 수정( 이름(p_no), 가격(p_price), 이미지(p_image), 상품설명(p_desc), 카테고리(cg_no)
update product set p_name='책상' ,p_price =100000 , p_image = 'desk.jpg' ,p_desc = '책상입니다' , cg_no =1  where p_no = 1 ;

-- 상품번호(p_no)로 클릭수(p_click_count) 증가
update product set p_click_count=p_click_count+1 where p_no =1;



--delete
-- product 상품번호(p_no)로 삭제
delete from product where p_no = 16;
---------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------category---------------------------------------------------------
--select
--카테고리 번호로 찾기 
select * from product p join categorys c on p.cg_no = c.cg_no where c.cg_no = 1;

--카테고리 이름으로 찾기
select * from product p join categorys c on p.cg_no = c.cg_no where c.cg_name='수납';

--selectAll 카테고리 전체찾기
select * from categorys;


--update
--update 카테고리 설정변경
update categorys set cg_no = 4,cg_name='데코,장식' where cg_no= 3;



--delete
--delete 카테고리 삭제
delete  from categorys where cg_no=4;

---------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------cart-----------------------------------------------------------
--select
--로그인한 test1님의 카트 리스트 불러오기
select * from cart c join product p on c.p_no=p.p_no where c.u_id='test1';

--로그인한 test1님의 카트 리스트에 제품넘버 1번의 존재여부 확인(0일 경우 insert,1이상일 경우 update)
select count(*) product_count from cart c where c.u_id='test1' and c.p_no=1;



--update
--test1님의 카트리스트에 있는 제품1번의 수량 2개 증가
update cart c set c_qty=c_qty+2 where c.u_id='test1' and c.p_no=1;



--delete
--test1님의 카트리스트에 있는 제품1번 삭제
delete from cart c where c.p_no=1;

--test1님의 카트리스트 전체삭제
delete from cart c where c.u_id = 'test1';
---------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------order-------------------------------------------------------------
/**************** orders_orderitem***************/
--select
-- 주문 & 주문 상세 전체 목록 (관리자)
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;

-- test2의 주문 한개(o_no=4) & 주문상세, 상품 정보 모두 보기
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id = 'test2' and o.o_no=4;

-- test2 고객의 주문 전체 목록
select * from orders where u_id = 'test2';

-- test3 고객 주문 & 주문 상세 전체 목록
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id='test3';

-- 멤버1명의 주문번호 4번의 주문 정보
select * from orders where o_no = 4;

-- 멤버1명의 주문번호 3번의 모든 상세 정보(여러개)
select * from orderitem where o_no = 3;



--delete
--주문번호 3번 삭제(주문1개삭제,주문상세삭제
--on delete cascade
delete from orderitem where o_no=3;
delete from orders where o_no=3;




-- test3 고객의 주문 내역 전체 삭제
--select
select * from orders;
select * from orderitem;
select * from orderitem where o_no=(select o_no from orders where u_id = 'test3');
select * from orders where u_id = 'test3';



--delete
delete from orderitem where o_no=(select o_no from orders where u_id = 'test3');
delete from orders where u_id = 'test3';



---------------------------------------------------------------------------------------------------------------------------



COMMIT;
