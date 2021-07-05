use spr1;

CREATE TABLE tbl_reply(
	rno int PRIMARY	KEY AUTO_INCREMENT,
    bno int not null,
    reply VARCHAR(512) not null,
    replyer VARCHAR(59) not null,
    replyDate TIMESTAMP DEFAULT now(),
    updateDate TIMESTAMP DEFAULT now(),
    FOREIGN KEY (bno) REFERENCES tbl_board(bno)
);

SELECT * FROM tbl_board
ORDER BY bno desc;

SELECT * FROM tbl_reply;

DELETE from tbl_reply
where rno BETWEEN '11' and '40';

ALTER TABLE tbl_reply AUTO_INCREMENT = 20;

CREATE TABLE lol_board(
	bno int PRIMARY	KEY AUTO_INCREMENT,
    name VARCHAR(255) not null,
    K INT not null,
    D INT not null,
    A INT not null,
    champ VARCHAR(255) not null,
    victory VARCHAR(20) DEFAULT "패",
    updateDate TIMESTAMP DEFAULT now()
);

drop table lol_board;

-- 여기다!!! 여기야 ㅅㅂ 여기서 작업해!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DESC lol_board;
SELECT * FROM lol_board;
DELETE from lol_board;
ALTER TABLE lol_board AUTO_INCREMENT = 1;

select name, 
	COUNT(name) as '총판수',
    count(if(victory='승',1,null)) as '승리 횟수', 
    truncate( (K+A)/D,0 ) as 'kda',
	truncate(count(if(victory='승',1,null)) / COUNT(name) * 100 , 0) as winrate
from lol_board 
GROUP BY name
ORDER BY winrate DESC;

SELECT b.bno, b.title, b.content, b.writer, b.regdate, b.updatedate, count(r.rno)
FROM tbl_board b left join tbl_reply r ON b.bno = r.bno
GROUP BY b.bno
ORDER BY b.bno desc
limit 10, 10;





























