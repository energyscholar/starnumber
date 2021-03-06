-- SQL script deletes existing USERS table, if it exists, then rebuilds it.  All data will be lost.
-- Note the fully qualified table name.  It is also fine to USE STARNUMBER.


DROP TABLE IF EXISTS STARNUMBER.USERS;

CREATE TABLE  STARNUMBER.USERS (
  user_id serial primary key,
  username varchar(50) DEFAULT NULL,
  password varchar(50) DEFAULT NULL,
  email varchar(256) DEFAULT NULL,
  is_admin boolean default false,
  create_time DATE,
  last_update_time DATE
);

COMMENT ON TABLE STARNUMBER.USERS IS 'starNumber registered users';


commit;





