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

CREATE TABLE lol_board(
	bno int PRIMARY	KEY AUTO_INCREMENT,
    teamn VARCHAR(255) not null,
    teamk INT not null,
    teamd INT not null,
    teama INT not null,
    teamc VARCHAR(255) not null,
    victory VARCHAR(20) DEFAULT "패",
    updateDate TIMESTAMP DEFAULT now()
);

DESC lol_board;
SELECT * FROM lol_board;





























