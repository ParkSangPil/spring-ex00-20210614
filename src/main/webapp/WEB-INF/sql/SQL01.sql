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
    team VARCHAR(255) not NULL,
    champ VARCHAR(255) not NUll,
    regdata TIMESTAMP DEFAULT NOW()
);
DROP TABLE lol_board;

SELECT * FROM tbl_board;











