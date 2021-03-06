-- Create table line_profiles, which ties profiles to line settings
-- This SQL script creates the table.

DROP TABLE IF EXISTS STARNUMBER.LINE_PROFILES;

CREATE TABLE  STARNUMBER.LINE_PROFILES (
  line_profile_id serial primary key,
  line_profile_name VARCHAR(256),
  line_id int REFERENCES starnumber.lines (line_id)   
);

COMMENT ON TABLE STARNUMBER.LINE_PROFILES IS 'This table ties line_profile to line, and provides a useful descriptor';

