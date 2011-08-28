-- Table to create table lines, both incoming and outgoing
-- This SQL script creates the table.

DROP TABLE IF EXISTS starnumber.lines;

CREATE TABLE  starnumber.lines (
  line_id serial primary key,
  line_name varchar(80),
  line_type_number int REFERENCES starnumber.line_types (line_type_number),
  user_profile_id int REFERENCES starnumber.user_profiles (user_profile_id),
  uri varchar(256),
  is_active BOOLEAN	
);

COMMENT ON TABLE STARNUMBER.lines IS 'This table tracks incoming and outgoing lines';




