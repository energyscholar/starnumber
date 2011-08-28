-- Table to create administrative comment strings for building Starnumber apps
--  Note that this feature is NOT implemented in a secure way, so do NOT 
-- allow any production systems to have this SQL in it!

DROP TABLE IF EXISTS STARNUMBER.ADMIN_COMMENTS;

CREATE TABLE  STARNUMBER.ADMIN_COMMENTS (
  ADMIN_COMMENT_ID serial primary key,
  admin_comment varchar(256),
  create_time DATE,
  last_update_time DATE
);
COMMENT ON TABLE STARNUMBER.admin_comments IS 'administrative comment strings for building Starnumber apps. Insecure!! Not to be in produciton!';

INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 1');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 2');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 3');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 4');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 5');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 6');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 7');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 8');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 9');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 10');
INSERT INTO STARNUMBER.ADMIN_COMMENTS (ADMIN_COMMENT) VALUES ('test comment 11');


commit;
