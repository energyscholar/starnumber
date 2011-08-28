-- Table to create calling destinations
-- Each destination on this table should be associated witha  registered user.
-- In other words, these are phones (hard or soft) that can be REACHED by calling a starnumber

DROP TABLE IF EXISTS STARNUMBER.DESTINATIONS;

CREATE TABLE  STARNUMBER.DESTINATIONS (
   destination_ID SERIAL,
  DESTINATION_NAME varchar(80) DEFAULT NULL,
  DESTINATION_URI varchar(256) DEFAULT NULL,
  SN_ID INT REFERENCES STARNUMBER.STARNUMBERS (STARNUMBER_ID),
  REDIRECT_TYPE_ID INT REFERENCES STARNUMBER.REDIRECT_TYPE (REDIRECT_TYPE_ID) ,
  DESTINATION_TYPE_ID INT REFERENCES STARNUMBER.DESTINATION_TYPE (DESTINATION_TYPE_ID),
  IS_ACTIVE BOOLEAN DEFAULT false,
  ACCEPTS_SMS BOOLEAN DEFAULT false,
  FORWARD_CALLS BOOLEAN DEFAULT false,
  create_time DATE,
  last_update_time DATE

);

-- Now we insert some records.  This will only change as Starnumber adds support for new destination phone types.

COMMENT ON TABLE STARNUMBER.DESTINATIONS IS 'Master table of all destination phones (hard or soft) affiliated with USERS who have registered. ';

commit;


