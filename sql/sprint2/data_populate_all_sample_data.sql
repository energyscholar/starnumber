-- populate the USER data

INSERT INTO starnumber.users VALUES (1, 'testuser', 'password', 'testuser@example.com', false, NULL, NULL);
INSERT INTO starnumber.users VALUES (2, 'testuser1', 'password1', 'testuser1@example.com', false, NULL, NULL);
INSERT INTO starnumber.users VALUES (3, 'testuser2', 'password2', 'testuser2@example.com', false, NULL, NULL);

-- populate the user_profiles data

INSERT INTO starnumber.user_profiles VALUES (1, 1, 'testuser profile 1', false, NULL);
INSERT INTO starnumber.user_profiles VALUES (2, 2, 'testuser profile 2', false, NULL);
INSERT INTO starnumber.user_profiles VALUES (3, 3, 'testuser profile 3', false, NULL);


-- populate the line_types data 

INSERT INTO starnumber.line_types VALUES (1, 1, 'Inbound SN');
INSERT INTO starnumber.line_types VALUES (2, 2, 'outbound internet');
INSERT INTO starnumber.line_types VALUES (3, 3, 'SIP out to VOIP provider');
INSERT INTO starnumber.line_types VALUES (4, 4, 'Registered Device');
INSERT INTO starnumber.line_types VALUES (5, 5, 'PSTN destination');
INSERT INTO starnumber.line_types VALUES (6, 6, 'SIP URI Destination');

-- populate the lines data

INSERT INTO starnumber.lines VALUES (1, 'My first starnumber', 1, 3, '7827*7829@starnumber.net', true);
INSERT INTO starnumber.lines VALUES (2, 'Pbxes uri mmzade-29', 6, 3, 'mmzade-29@pbxes.org', true);
INSERT INTO starnumber.lines VALUES (3, 'Registered Device', 4, 3, 'Charlie@starnumber.net', true);
INSERT INTO starnumber.lines VALUES (4, 'Bruce''s sip2sip', 6, 3, 'brucepjsip@sip2sip.info', true);


-- populate the line_profiles data

INSERT INTO starnumber.line_profiles VALUES (1, 'Default', 1);
INSERT INTO starnumber.line_profiles VALUES (2, 'Default', 2);
INSERT INTO starnumber.line_profiles VALUES (3, 'Default', 3);
INSERT INTO starnumber.line_profiles VALUES (4, 'Default', 4);



-- populate the settings data

INSERT INTO starnumber.settings VALUES (2, 2, 'Varchar', 'redirect type. stateless, statefull, media');
INSERT INTO starnumber.settings VALUES (1, 1, 'Int', 'Ring On Destination Line ID');


-- populate the line_profile_settings data

INSERT INTO starnumber.line_profile_settings VALUES (1, 1, 1, '2');
INSERT INTO starnumber.line_profile_settings VALUES (2, 2, 2, 'stateless');
INSERT INTO starnumber.line_profile_settings VALUES (3, 3, 2, 'media');
INSERT INTO starnumber.line_profile_settings VALUES (4, 1, 1, '3');
INSERT INTO starnumber.line_profile_settings VALUES (5, 1, 1, '4');
INSERT INTO starnumber.line_profile_settings VALUES (6, 4, 2, 'statefull');

