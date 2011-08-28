-- Create table dial_patterns, which has logic to determine outbound lines
-- This SQL script creates the table.

DROP TABLE IF EXISTS STARNUMBER.DIAL_PATTERNS;

CREATE TABLE  STARNUMBER.DIAL_PATTERNS (
  dial_pattern_id serial primary key,
  user_id int REFERENCES STARNUMBER.USERS (USER_ID),
  line_id int REFERENCES STARNUMBER.LINES (LINE_ID),
  dial_pattern_name VARCHAR(256),
  rule VARCHAR(256)  
);

COMMENT ON TABLE STARNUMBER.DIAL_PATTERNS IS 'This table calls logic to determine outbound lines';

