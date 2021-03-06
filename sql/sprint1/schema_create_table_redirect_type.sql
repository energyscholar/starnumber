-- Table to create redirect types available to Kamailio
-- examples:  Stateless, Stateful, Media pass-through
-- This SQL script both creates the table and populate it.
-- For a more complicated table the add and insert scripts should be seperate

DROP TABLE IF EXISTS STARNUMBER.REDIRECT_TYPE;

CREATE TABLE  STARNUMBER.REDIRECT_TYPE (
  REDIRECT_TYPE_ID serial primary key,
  redirect_type_name varchar(80) DEFAULT NULL,
  is_supported boolean default false,
  create_time DATE,
  last_update_time DATE
);
COMMENT ON TABLE STARNUMBER.REDIRECT_TYPE IS 'The type of Kamailio SIP connection redirect currently prefered';


-- Now we insert some records.  This will only change as Starnumber adds support for new redirect types.

INSERT INTO STARNUMBER.REDIRECT_TYPE (REDIRECT_TYPE_NAME, IS_SUPPORTED)
VALUES (
'Stateless',
TRUE
);

INSERT INTO STARNUMBER.REDIRECT_TYPE (REDIRECT_TYPE_NAME, IS_SUPPORTED)
VALUES (
'Stateful',
FALSE
);

INSERT INTO STARNUMBER.REDIRECT_TYPE (REDIRECT_TYPE_NAME, IS_SUPPORTED)
VALUES (
'Media pass-through',
FALSE
);

SELECT COUNT(REDIRECT_TYPE_ID) FROM STARNUMBER.REDIRECT_TYPE;


commit;
