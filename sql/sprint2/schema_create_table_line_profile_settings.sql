-- Create table line_profile_settings, which ties profiles to line settings
-- This SQL script creates the table.

DROP TABLE IF EXISTS STARNUMBER.LINE_PROFILE_SETTINGS;

CREATE TABLE  starnumber.line_profile_settings (
  line_profile_setting_id serial primary key,
  line_profile_id int REFERENCES starnumber.line_profiles (line_profile_id),
  setting_number int REFERENCES starnumber.settings (setting_number),
  setting_value VARCHAR(256)
);

COMMENT ON TABLE STARNUMBER.LINE_PROFILE_SETTINGS IS 'This table stores name-value pairs that will be sent to Kamailio.  Name-value pairs stored in this table should not be required for central database search.';

