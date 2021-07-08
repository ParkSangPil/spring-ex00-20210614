use spr1;

create TABLE tbl_member(
	userid VARCHAR(50) PRIMARY key,
    userpw VARCHAR(100) not null,
    username VARCHAR(100) not null,
    regdate TIMESTAMP DEFAULT now(),
    updateDate timestamp default now(),
    enabled TINYINT(1) DEFAULT 1
    
);

create table tbl_member_auth (
	id int PRIMARY key AUTO_INCREMENT,
    userid VARCHAR(50) not null,
    auth VARCHAR(50) not null,
    FOREIGN KEY (userid) REFERENCES tbl_member(userid)

);

SELECT * from tbl_member;
SELECT * from tbl_member_auth;

delete from tbl_member where username = '상필ㅠㅠㅋㅋ';

SELECT
			m.userid userid,
			m.userpw userpw,
			m.username username,
			m.enabled enabled,
			m.regdate regdate,
			m.updateDate updateDate,
			a.auth auth
		FROM
			tbl_member m LEFT JOIN tbl_member_auth a ON m.userid = a.userid
		WHERE
			m.userid = 'admin';









