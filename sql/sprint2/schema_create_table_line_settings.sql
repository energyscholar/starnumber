-- Create table line_settings, which holds dynamically configured data settings
-- This SQL script creates the table.

DROP TABLE IF EXISTS STARNUMBER.LINE_PROFILE_SETTINGS;

CREATE TABLE  STARNUMBER.LINE_PROFILE_SETTINGS (
  line_setting_id serial primary key,
  line_profile_id int REFERENCES STARNUMBER.line_profiles (line_profile_id),
  setting_number int REFERENCES STARNUMBER.SETTINGS (SETTING_NUMBER),
  setting_value VARCHAR(256)
);

COMMENT ON TABLE STARNUMBER.LINE_PROFILE_SETTINGS IS 'This table tracks dynamically generated name, value pairs that apply to lines';

