/* product table
이름            널?       유형            
------------- -------- ------------- 
P_NO          NOT NULL NUMBER(10)    
P_NAME                 VARCHAR2(100) 
P_PRICE                NUMBER(10)    
P_IMAGE                VARCHAR2(100) 
P_DESC                 VARCHAR2(100) 
P_CLICK_COUNT          NUMBER(10)    
CG_NO                  NUMBER(10)    
*/ 

/*  categorys
3	가전제품
1	수납
2	가구

select * from categorys;
*/

/* product
1	책상	100000	desk.jpg	책상입니다	0	2
2	의자	50000	chair.jpg	의자입니다	0	2
3	선반	200000	rack.jpg	선반입니다	0	1
4	침대	250000	bed.jpg	침대입니다	0	2
5	신발장	150000	shoe_rack.jpg	신발장입니다	0	1
6	수납장	100000	storage_closet.jpg	수납장입니다	0	1
*/

----- << product select (join X) >>
desc product;

-- product 전체보기
select * from product;
-- product 상품번호(p_no)로 1개 보기
select * from product where p_no = 1 ;
-- product 상품이름(p_name)로 1개 보기
select * from product where p_name = '책상';


----- << product update >>
-- product 상품번호(p_no)로 불러서 수정( 이름(p_no), 가격(p_price), 이미지(p_image), 상품설명(p_desc), 카테고리(cg_no)
update product set p_name='책상' ,p_price =100000 , p_image = 'desk.jpg' ,p_desc = '책상입니다' , cg_no =1  where p_no = 1 ;
-- 상품번호(p_no)로 클릭수(p_click_count) 증가
update product set p_click_count=p_click_count+1 where p_no =1;


----- << product delete >>
-- product 상품번호(p_no)로 삭제
delete from product where p_no = 16;

