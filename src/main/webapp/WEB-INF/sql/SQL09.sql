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
SELECT * FROM tbl_member;
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





















