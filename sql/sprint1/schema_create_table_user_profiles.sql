-- starnumber registered users may have several profiles.  This tables represents a user profile.
-- SQL script deletes existing USER_PROFILES table, if it exists, then rebuilds it.  All data will be lost.
-- Note the fully qualified table name.  It is also fine to USE STARNUMBER.


DROP TABLE IF EXISTS starnumber.user_profiles;

CREATE TABLE  STARNUMBER.user_profiles (
	
  user_profile_id serial primary key,
  owner_user_id int REFERENCES STARNUMBER.user (user_id) ,
  operator_user_id int ,	
  user_profile_name varchar(50), 
  last_user_uppate DATE
);

COMMENT ON TABLE STARNUMBER.USERS IS 'user_profile of a starNumber registered user, field is_admin will be subsumed by role in Starnumber Version 2.0';

commit;





