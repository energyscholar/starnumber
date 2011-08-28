-- script to populate starnumber.lines

delete from starnumber.lines;

INSERT INTO STARNUMBER.LINES (line_name, user_id, line_type_number)
VALUES ( '7827*7829' , 2 , 1 );

INSERT INTO STARNUMBER.LINES (line_name, user_id, line_type_number)
VALUES ( 'DID Lux' , 2 , 1 );

INSERT INTO STARNUMBER.LINES (line_name, user_id, line_type_number)
VALUES ( 'The Internet' , 2 , 2 );

INSERT INTO STARNUMBER.LINES (line_name, user_id, line_type_number)
VALUES ( 'DID Logic' , 2 , 3 );

INSERT INTO STARNUMBER.LINES (line_name, user_id, line_type_number)
VALUES ( 'RD1' , 2 , 4 );

INSERT INTO STARNUMBER.LINES (line_name, user_id, line_type_number)
VALUES ( 'Lux Cell' , 2 , 5 );

select * from starnumber.lines;