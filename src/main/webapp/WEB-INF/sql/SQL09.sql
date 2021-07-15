use spr1;

create table persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);

desc persistent_logins;

SELECT * FROM tbl_board
ORDER BY bno desc;
desc tbl_member;
SELECT * FROM tbl_member;
SELECT * FROM tbl_member_auth;

DELETE from tbl_member where userid = '';


select * FROM tbl_reply;

update tbl_board
set writer = 'member';

update tbl_reply
set replyer = 'member';

select now();

alter table tbl_board
add FOREIGN KEY (writer) REFERENCES tbl_member(userid);

alter table tbl_reply
add FOREIGN KEY (replyer) REFERENCES tbl_member(userid);

DESC tbl_board;
desc tbl_reply;
SELECT * FROM tbl_board_file;
desc tbl_board_file;
SELECT * FROM user_review_file;

DROP table user;
drop table b2buser;

CREATE TABLE user(
	bno int PRIMARY	KEY AUTO_INCREMENT,
    userid VARCHAR(50) not null,
    userpw VARCHAR(500) not null,
    userName VARCHAR(50) not null,
    userAddress VARCHAR(50) not null,
    birthDate TIMESTAMP DEFAULT now(),
    userPhonenum int(50) not null,
    userEmail VARCHAR(50) not null,
    userSex int(5) not null,
    userNickname VARCHAR(50) not null
);

CREATE TABLE b2buser(
	bno int PRIMARY	KEY AUTO_INCREMENT,
    userid VARCHAR(50) not null,
    userpw VARCHAR(500) not null,
    userName VARCHAR(50) not null,
    userAddress VARCHAR(50) not null,
    birthDate TIMESTAMP DEFAULT now(),
    userPhonenum int(50) not null,
    userEmail VARCHAR(50) not null,
    userSex int(5) not null,
    userNickname VARCHAR(50) not null
);

SELECT * FROM user;
SELECT * FROm b2buser;

delete from user;
delete from b2buser;


















