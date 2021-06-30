Create DATABASE spr1;
use spr1;

CREATE table tbl_board (
	bno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) not NULL,
    content VARCHAR(2000) not null,
    writer VARCHAR(50) not null,
    regdata TIMESTAMP DEFAULT NOW(),
    updatedate TIMESTAMP DEFAULT NOW()
);

CREATE table lol_board (
	bno INT PRIMARY KEY AUTO_INCREMENT,
    team1 VARCHAR(2000) not NULL,
    team2 VARCHAR(2000) not null,
    winner VARCHAR(50) not null,
    regdata TIMESTAMP DEFAULT NOW()
);
DROP TABLE lol_board;

SELECT * FROM tbl_board;
SELECT * FROM tbl_reply;

select * from lol_board;
desc lol_board;

-- 댓글이 있는 게시물 조회
SELECT
distinct (b.bno)
FROM tbl_board b JOIN tbl_reply r ON b.bno = r.bno;

SELECT * FROM tbl_reply;

	private int bno;
	private String teamn;
	private int teamk;
	private int teamd;
	private int teama;
	private String teamc;
	private String victory;
	private Date regdate;

INSERT INTO table (teamn, teamk, teamd, teama, teamc, victory)
VALUES (#{teamn}, #{teamk}, #{teamd}, #{teama}, #{teamc}, #{victory})





