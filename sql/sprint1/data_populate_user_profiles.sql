-- SQL that deletes all users and repopulates table users to a known state


DELETE FROM STARNUMBER.user_profiles WHERE 1=1;


-- Create user_profile testuser
INSERT INTO starnumber.user_profiles (owner_user_id, user_profile_name) VALUES (
1,
'testuser profile 1'
);

INSERT INTO starnumber.user_profiles (owner_user_id, user_profile_name) VALUES (
2,
'testuser profile 2'
);


INSERT INTO starnumber.user_profiles (owner_user_id, user_profile_name) VALUES (
3,
'testuser profile 3'
);


commit;

SELECT * FROM STARNUMBER.user_profiles;



