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
ALTER TABLE lol_board ADD IPv6 VARCHAR(255);
ALTER TABLE lol_board DROP COLUMN IPv6;

CREATE TABLE lol_ip(
	IPv6 VARCHAR(50) not null,
	updateDate TIMESTAMP DEFAULT now()
);
desc lol_ip;
SELECT * from lol_ip;
DELETE from lol_ip;
drop table lol_ip;

drop table lol_board;

-- 여기다!!! 여기야 ㅅㅂ 여기서 작업해!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DESC lol_board;
SELECT * FROM lol_board;
DELETE from lol_board
where bno BETWEEN '291' and '300';
ALTER TABLE lol_board AUTO_INCREMENT = 291;

select name, 
	COUNT(name) as total,
    count(if(victory='승',1,null)) as wincnt, 
    truncate( (K+A)/D,0 ) as kda,
	truncate(count(if(victory='승',1,null)) / COUNT(name) * 100 , 0) as winrate
from lol_board 
GROUP BY name
ORDER BY winrate DESC;

SELECT b.bno, b.title, b.content, b.writer, b.regdate, b.updatedate, count(r.rno)
FROM tbl_board b left join tbl_reply r ON b.bno = r.bno
GROUP BY b.bno
ORDER BY b.bno desc
limit 10, 10;


UPDATE lol_board
SET name = '용병'
where name = '';

UPDATE lol_board
SET champ = '녹턴'
where bno = 60;




    select name, 
		COUNT(name) total,
	    COUNT(if(victory='승',1,null)) wincnt,
        (SUM(K) + SUM(A))/SUM(D) kda2,
        SUM((K + A)/D) kkk,
		truncate(count(if(victory='승',1,null)) / COUNT(name) * 100 , 0) winrate
	FROM lol_board 
	GROUP BY name
	ORDER BY winrate DESC, kda2 desc, total desc;



select DISTINCT champ, 
	COUNT(name) as total,
    count(if(victory='승',1,null)) as wincnt, 
    truncate((SUM(K) + SUM(A))/SUM(D) ,1 ) kda
from lol_board 
where name = '상필'
GROUP BY name;

select DISTINCT champ,
	count(champ) total,
    count(if(victory='승',1,null)) wincnt,
    truncate(count(if(victory='승',1,null)) / COUNT(champ) * 100 , 0) winrate
from lol_board
where name = '상필'
GROUP BY champ
ORDER BY winrate desc;


















