-- Table to create table line_types
-- Line types include incoming, outgoing, and bi-directional.
-- This is a dictionary table
-- This SQL script creates the table.

DROP TABLE IF EXISTS STARNUMBER.LINE_TYPES;

CREATE TABLE  STARNUMBER.LINE_TYPES (
  line_type_id serial primary key,
  line_type_number int UNIQUE,
  line_type_description varchar(80)
);

COMMENT ON TABLE STARNUMBER.LINE_TYPES IS 'This dictionary table tracks the possible types of line';

-- populate line types

DELETE FROM STARNUMBER.LINE_TYPES;

INSERT INTO STARNUMBER.LINE_TYPES (line_type_number,LINE_TYPE_DESCRIPTION)
VALUES ( 1, 'Inbound SN'  );

INSERT INTO STARNUMBER.LINE_TYPES (line_type_number,LINE_TYPE_DESCRIPTION)
VALUES ( 2, 'outbound internet'  );

INSERT INTO STARNUMBER.LINE_TYPES (line_type_number,LINE_TYPE_DESCRIPTION)
VALUES ( 3, 'SIP out to VOIP provider'  );

INSERT INTO STARNUMBER.LINE_TYPES (line_type_number,LINE_TYPE_DESCRIPTION)
VALUES ( 4, 'Registered Device'  );

INSERT INTO STARNUMBER.LINE_TYPES (line_type_number,LINE_TYPE_DESCRIPTION)
VALUES ( 5, 'PSTN destination'  );

INSERT INTO STARNUMBER.LINE_TYPES (line_type_number,LINE_TYPE_DESCRIPTION)
VALUES ( 6, 'SIP URI Destination'  );

select * from starnumber.line_types;