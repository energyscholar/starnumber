-- populate table LINE_PROFILES with sample data

DELETE FROM STARNUMBER.LINE_PROFILES;


INSERT INTO STARNUMBER.LINE_PROFILES (line_profile_name, is_default, user_id, is_active)
VALUES ('Default' , true, 2, true );

INSERT INTO STARNUMBER.LINE_PROFILES (line_profile_name, is_default, user_id, is_active)
VALUES ('Default' , true, 1, true );

