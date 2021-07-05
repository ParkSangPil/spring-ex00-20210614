USE spr1;

desc tbl_board;

CREATE TABLE tbl_board_file(
	id int PRIMARY key AUTO_INCREMENT,
	bno int REFERENCES tbl_board(bno),
	fileName VARCHAR(200) not null
);

SELECT * FROM tbl_board_file;














