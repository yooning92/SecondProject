DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE orderitem CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE categorys CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

CREATE TABLE userinfo(
		u_id                          		VARCHAR2(50)		 NULL ,
		u_pw                          		VARCHAR2(50)		 NULL ,
		u_name                        		VARCHAR2(50)		 NULL ,
		u_email                       		VARCHAR2(100)		 NULL ,
		u_address                     		VARCHAR2(100)		 NULL ,
		u_phone                       		VARCHAR2(15)		 NULL 
);


CREATE TABLE categorys(
		cg_no                         		NUMBER(10)		 NULL ,
		cg_name                       		VARCHAR2(50)		 NULL 
);


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(100)		 NULL ,
		p_price                       		NUMBER(10)		 NULL ,
		p_image                       		VARCHAR2(100)		 NULL ,
		p_desc                        		VARCHAR2(100)		 NULL ,
		p_click_count                 		NUMBER(10)		 NULL ,
		cg_no                         		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE cart(
		c_no                          		NUMBER(10)		 NULL ,
		c_qty                         		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_c_no_SEQ;

CREATE SEQUENCE cart_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_desc                        		VARCHAR2(200)		 NULL ,
		o_date                        		DATE		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE orderitem(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE orderitem_oi_no_SEQ;

CREATE SEQUENCE orderitem_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE qna(
		q_no                          		NUMBER(10)		 NULL ,
		q_title                       		VARCHAR2(200)		 NULL ,
		q_content                     		VARCHAR2(3000)		 NULL ,
		q_date                        		DATE		 DEFAULT sysdate		 NULL ,
		q_category                    		VARCHAR2(100)		 NULL ,
		q_readcount                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		q_groupno                     		NUMBER(10)		 NULL ,
		q_step                        		NUMBER(10)		 DEFAULT 0		 NULL ,
		q_depth                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		u_id                          		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE qna_q_no_SEQ;

CREATE SEQUENCE qna_q_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE review(
		r_no                          		NUMBER(10)		 NULL ,
		r_title                       		VARCHAR2(100)		 NULL ,
		r_content                     		VARCHAR2(1000)		 NULL ,
		r_date                        		DATE		 DEFAULT sysdate		 NULL ,
		r_rating                      		NUMBER(10)		 DEFAULT 0		 NULL ,
		r_image                       		VARCHAR2(50)		 NULL ,
		r_click_count                 		NUMBER(10)		DEFAULT 0 NULL ,
		u_id                          		VARCHAR2(50)		 NULL ,
		oi_no                         		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_r_no_SEQ;

CREATE SEQUENCE review_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE notice(
		n_no                          		NUMBER(10)		 NULL ,
		n_title                       		VARCHAR2(100)		 NULL ,
		n_content                     		VARCHAR2(1000)		 NULL ,
		n_date                        		DATE		 NULL 
);

DROP SEQUENCE notice_n_no_SEQ;

CREATE SEQUENCE notice_n_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (u_id);

ALTER TABLE categorys ADD CONSTRAINT IDX_categorys_PK PRIMARY KEY (cg_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (cg_no) REFERENCES categorys (cg_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) ON DELETE set null;

ALTER TABLE orderitem ADD CONSTRAINT IDX_orderitem_PK PRIMARY KEY (oi_no);
ALTER TABLE orderitem ADD CONSTRAINT IDX_orderitem_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE orderitem ADD CONSTRAINT IDX_orderitem_FK1 FOREIGN KEY (o_no) REFERENCES orders (o_no) ON DELETE CASCADE;

ALTER TABLE qna ADD CONSTRAINT IDX_qna_PK PRIMARY KEY (q_no);
ALTER TABLE qna ADD CONSTRAINT IDX_qna_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (r_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) ON DELETE set null;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (oi_no) REFERENCES orderitem (oi_no) ON DELETE CASCADE;

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (n_no);

