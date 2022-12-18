------회원 데이터------
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test1', 'pw1', '김유저1', 'kim1@tmrw_house.com', '서울시 강남구', '010-0000-0000');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test2', 'pw2', '안유저2', 'an2@tmrw_house.com', '인천시 계양구', '010-1111-1111');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test3', 'pw3', '박유저3', 'park3@tmrw_house.com', '대구시', '010-2222-2222');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test4', 'pw4', '최유저4', 'choi4@tmrw_house.com', '부산시', '010-3333-3333');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test5', 'pw5', '정유저5', 'jeong5@tmrw_house.com', '안산시', '010-4444-4444');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test6', 'pw6', '강유저6', 'kang6@tmrw_house.com', '안양시', '010-5555-5555');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test7', 'pw7', '조유저7', 'joh7@tmrw_house.com', '광주시', '010-6666-6666');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test8', 'pw8', '윤유저8', 'yoon8@tmrw_house.com', '울산시', '010-7777-7777');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('admin', '1111', '관리자', 'admin@admin.com', '관리부서', '010-1234-5678');
-----카테고리 데이터----
insert into categorys(cg_no, cg_name) values(1, '수납');
insert into categorys(cg_no, cg_name) values(2, '가구');
insert into categorys(cg_no, cg_name) values(3, '가전제품');
insert into categorys(cg_no, cg_name) values(4, '조명');
insert into categorys(cg_no, cg_name) values(5, '주방용품');

------상품 데이터------
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '2층선반'||product_p_no_seq.currval, 200000, 'shelf1.jpg', '2층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '다용도선반'||product_p_no_seq.currval, 150000, 'shelf2.jpg', '다용도선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '3층선반'||product_p_no_seq.currval, 300000, 'shelf3.jpg', '3층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '2층선반'||product_p_no_seq.currval, 500000, 'shelf4.jpg', '2층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '3층선반'||product_p_no_seq.currval, 120000, 'shelf5.jpg', '3층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '3층선반'||product_p_no_seq.currval, 700000, 'shelf6.jpg', '3층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '3층선반'||product_p_no_seq.currval, 200000, 'shelf7.jpg', '3층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '3층선반'||product_p_no_seq.currval, 500000, 'shelf8.jpg', '4층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '4층선반'||product_p_no_seq.currval, 200000, 'shelf9.jpg', '5층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '5층선반'||product_p_no_seq.currval, 150000, 'shelf10.jpg', '3층선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '높은책상'||product_p_no_seq.currval, 320000, 'table1.jpg', '책상입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '넓은책상'||product_p_no_seq.currval,100000, 'table2.jpg', '책상2입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '책상다리'||product_p_no_seq.currval,20000, 'table3.jpg', '책상3입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '3층책상'||product_p_no_seq.currval, 50000, 'table4.jpg', '의자입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '수납침대'||product_p_no_seq.currval,30000, 'bed1.jpg', '침대입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '낮은침대'||product_p_no_seq.currval,250000, 'bed2.jpg', '침대입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '높은침대'||product_p_no_seq.currval,250000, 'bed3.jpg', '침대입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '의자1'||product_p_no_seq.currval,250000, 'chair1.jpg', '의자1입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '의자2'||product_p_no_seq.currval,350000, 'chair2.jpg', '의자2입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '색상의자'||product_p_no_seq.currval,550000, 'chair3.jpg', '색상의자입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '에어컨'||product_p_no_seq.currval, 250000, 'homeappliances1.jpg', '에어컨입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '에어컨2'||product_p_no_seq.currval,340000, 'homeappliances2.jpg', '에어컨입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '모니터'||product_p_no_seq.currval, 430000, 'homeappliances3.jpg', '모니터입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '모니터2'||product_p_no_seq.currval,350000, 'homeappliances4.jpg', '모니터입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '밥솥'||product_p_no_seq.currval, 550000, 'homeappliances7.jpg', '밥솥입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '전자레인지'||product_p_no_seq.currval,250000, 'homeappliances8.jpg', '전자레인지입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '청소기'||product_p_no_seq.currval, 550000, 'homeappliances9.jpg', '청소기입니다', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '밝은조명'||product_p_no_seq.currval, 520000, 'light1.jpg', '밝은조명입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '스탠드조명'||product_p_no_seq.currval,210000, 'light2.jpg','스탠드조명입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '조명전구'||product_p_no_seq.currval, 270000, 'light3.jpg', '조명전구입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '조명전구'||product_p_no_seq.currval, 570000, 'light4.jpg', '조명전구입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '조명전구'||product_p_no_seq.currval, 370000, 'light5.jpg', '조명전구입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '조명전구'||product_p_no_seq.currval, 150000, 'light6.jpg', '조명전구입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '조명전구'||product_p_no_seq.currval, 120000, 'light7.jpg', '조명전구입니다', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '양은냄비'||product_p_no_seq.currval, 1000, 'pot1.jpg', '양은냄비1입니다', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '숟가락1'||product_p_no_seq.currval, 2000, 'spoon1.jpg', '숟가락1입니다', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '숟가락2'||product_p_no_seq.currval, 3000, 'spoon2.jpg', '숟가락2입니다', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '젓가락1'||product_p_no_seq.currval, 3000, 'chopstick1.jpg', '젓가락1입니다', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '프라이팬1'||product_p_no_seq.currval, 5000, 'pan1.jpg', '프라이팬1입니다', 0, 5);

/*
    cg_no =1  =>선반,수납 shelf
    cg_no =2  =>가구      table,bed,chair   
    cg_no =3  =>가전제품  homeappliances   
    cg_no =4  =>조명      lighting   
    cg_no =5  =>      
*/

------주문&주문상세-----
insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '선반 외 2개', sysdate-10, 200000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 5);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 10);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 1개', sysdate-15, 450000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 4);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 4, orders_o_no_seq.currval, 7);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '라디오 외 3개', sysdate-20, 450000, 'test2');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 10);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 14);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 19);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '조명 외 2개', sysdate-5, 350000, 'test2');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 14);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 1);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 5);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '침대 외 0개', sysdate-7, 100000, 'test3');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 9);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '침대 외 1개', sysdate-4, 100000, 'test3');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 9);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 1);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '숟가락 외 2개', sysdate-3, 200000, 'test4');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 4, orders_o_no_seq.currval, 18);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 19);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 20);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '청소기 외 2종', sysdate-5, 200000, 'test4');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 27);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 24);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 5, orders_o_no_seq.currval, 7);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '넓은책상 외 2개', sysdate-7, 200000, 'test4');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 4);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 8);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 7, orders_o_no_seq.currval, 12);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '에어컨 외 2개', sysdate-14, 450000, 'test5');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 21);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 11);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 28);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '밥솥 외 2개', sysdate-10, 450000, 'test5');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 25);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 1);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 35);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '조명전구 외 6개', sysdate-10, 450000, 'test5');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 30);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 2);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 12);

------카트 데이터------
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test1', 1);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test1', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test1', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 4, 'test2', 5);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test2', 6);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test3', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test3', 8);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 5, 'test4', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 5, 'test4', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test5', 1);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test5', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 4, 'test5', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test6', 9);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test6', 10);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test6', 11);


------공지 데이터------
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지1', '공지1 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지2', '공지2 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지3', '공지3 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지4', '공지4 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지5', '공지5 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지6', '공지6 내용', sysdate);

------리뷰 데이터------
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no)
values(REVIEW_R_NO_SEQ.nextval, '좋아요'||REVIEW_R_NO_SEQ.currval, '추천해요! 너무너무 만족스러운 구매였어요! 후회하지 않으실꺼에요! 절대로! 꼭사세요!'||REVIEW_R_NO_SEQ.currval, sysdate-7, 5, null, 3, 'test1', 1);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '아주 좋아요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-6, 4, null,2, 'test1', 2);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '만족해요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-5, 4, null, 1,'test1', 3);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '보통이에요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-4, 4, null,1,'test1', 4);

insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '보통이에요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-5, 4, null, 7, 'test2', 6);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '만족해요'||REVIEW_R_NO_SEQ.currval, '추천해요'||REVIEW_R_NO_SEQ.currval, sysdate-4, 5, null, 6, 'test2', 7);

insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '선물하기 좋아요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-3, 5, null, 10, 'test2', 9);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '좋아요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-2, 4, null, 8, 'test2',  10);

insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '보통이에요'||REVIEW_R_NO_SEQ.currval, '추천해요'||REVIEW_R_NO_SEQ.currval, sysdate-2, 4, null, 8, 'test3', 13);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '그냥 그래요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-4, 3, null, 5,'test3', 14);

insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '선물하기 좋아요'||REVIEW_R_NO_SEQ.currval, '좋아요'||REVIEW_R_NO_SEQ.currval, sysdate-3, 5, null, 12,'test4', 15);
insert into review(r_no, r_title, r_content, r_date, r_rating, r_image, r_click_count, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '재구매합니다'||REVIEW_R_NO_SEQ.currval, '추천해요'||REVIEW_R_NO_SEQ.currval, sysdate-1, 5, null, 15,'test4', 16);


------qna 데이터------
insert into qna(q_no, q_title, q_content, q_groupno, q_step, u_id) values(qna_q_no_seq.nextval, '문의 제목'||qna_q_no_seq.currval, '문의 내용'||qna_q_no_seq.currval, qna_q_no_seq.currval, 0, 'test1');
insert into qna(q_no, q_title, q_content, q_groupno, q_step, u_id) values(qna_q_no_seq.nextval, '문의 제목'||qna_q_no_seq.currval, '문의 내용'||qna_q_no_seq.currval, qna_q_no_seq.currval, 0, 'test1');
insert into qna(q_no, q_title, q_content, q_groupno, q_step, u_id) values(qna_q_no_seq.nextval, '문의 제목'||qna_q_no_seq.currval, '문의 내용'||qna_q_no_seq.currval, qna_q_no_seq.currval, 0, 'test1');

commit;