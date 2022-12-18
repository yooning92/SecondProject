desc orders;
desc orderitem;

/**************** orders_orderitem (쪼금 수정) ***************/
-- 7.주문 생성




insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');


insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);








-- 6.주문 & 주문 상세 전체 목록 (관리자)
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;

-- 1. test2의 주문 한개(o_no=4) & 주문상세, 상품 정보 모두 보기
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id = 'test2' and o.o_no=4;

-- 2. test2 고객의 주문 전체 목록
select * from orders where u_id = 'test2';


-- 3-1. test3 고객 주문 & 주문 상세 전체 목록
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id='test3';

-- 3-2. 
select * from orders o
join orderitem oi on  o.o_no = oi.o_no
join product p on oi.p_no = p.p_no 
where o.u_id='test3';



-- 4.멤버1명의 주문번호 4번의 주문 정보
select * from orders where o_no = 4;

-- 5.멤버1명의 주문번호 3번의 모든 상세 정보(여러개)
select * from orderitem where o_no = 3;


-- 8.주문번호 3번 삭제(주문1개삭제,주문상세삭제) -> 언제 일어나는 일? 주문 취소할때? 그래도 주문내역은 남지 않나?
--on delete cascade
delete from orderitem where o_no=3;
delete from orders where o_no=3;

-- 9.test3 고객의 주문 내역 전체 삭제 -> 언제 일어나는 일? 주문 취소할때? 그래도 주문내역은 남지 않나?

	select * from orders;
	select * from orderitem;
	select * from orderitem where o_no=(select o_no from orders where u_id = 'test3');
	select * from orders where u_id = 'test3';

delete from orderitem where o_no=(select o_no from orders where u_id = 'test3');
delete from orders where u_id = 'test3';

--update(X)
--주문내역을 수정하는 일은 발생하지 않아 작성하지 않았습니다.

--주문완료 내역 삭제

update orders set o_desc='[주문내역삭제]'||o_desc where o_no=10;
select * from orders where o_no=10;


--주문취소를 위한 select-update

select * from orders where o_no=3;
select * from orderitem where o_no=3;

select * from orders o
join orderitem oi on o.o_no=oi.o_no
where o.o_no=3;

update orderitem set oi_qty= where o_no=3;
update orders set o_desc='[주문취소]'||o_desc where o_no=9;

select * from product where p_name like 책상';

select * from orders o
join orderitem oi on o.o_no=oi.o_no
where o.o_no=3;

--orderservice에 추가
select * from orderitem oi join product p on oi.p_no=p.p_no;

select * from orders o
join orderitem oi
on o.o_no=oi.o_no
join product p
on oi.p_no=p.p_no
where oi.oi_no=36;


----serviceTest
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id ='test4' and o.o_no=7;




--한줄로 만들기 실패.. --- (결론)안되는 것 -> update에 inline은 안됨
/*
update (select * from orders o
join orderitem oi on o.o_no=oi.o_no
where o.o_no=3;) set o_desc='(1줄로수정)주문취소', oi_qty=99 
*/