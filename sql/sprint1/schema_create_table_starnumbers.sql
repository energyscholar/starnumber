-- SQL script deletes existing USERS table, if it exists, then rebuilds it.  All data will be lost.
-- Note the fully qualified table name.  It is also fine to USE STARNUMBER.


DROP TABLE IF EXISTS STARNUMBER.STARNUMBERS;

CREATE TABLE  STARNUMBER.STARNUMBERS (
  starnumber_id serial primary key,
  user_id INT REFERENCES STARNUMBER.USERS (USER_ID),
  sn VARCHAR(20),
  create_time DATE,
  last_update_time DATE
);

COMMENT ON TABLE STARNUMBER.USERS IS 'StarNumbers, abbreviated sn';


commit;





