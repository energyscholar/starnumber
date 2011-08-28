-- SQL that populates the phones table with test data
-- Created by Bruce


DELETE FROM STARNUMBER.DESTINATIONS WHERE 1=1;

INSERT INTO STARNUMBER.DESTINATIONS ( destination_name, destination_uri, sn_id, redirect_type_id, destination_type_id, is_active, accepts_sms, forward_calls  )

VALUES (
'my iPhone',
'sip:127.0.0.1:5080',
2,
1,
1,
true,
true,
true
);

INSERT INTO STARNUMBER.DESTINATIONS ( destination_name, destination_uri, sn_id, redirect_type_id, destination_type_id, is_active, accepts_sms, forward_calls  )
VALUES (
'my droid',
'sip:127.0.0.1:5080',
2,
2,
1,
true,
true,
true
);

INSERT INTO STARNUMBER.DESTINATIONS ( destination_name, destination_uri, sn_id, redirect_type_id, destination_type_id, is_active, accepts_sms, forward_calls  )
VALUES (
'my windows 7',
'sip:127.0.0.1:5080',
3,
3,
1,
true,
true,
true
);

INSERT INTO STARNUMBER.DESTINATIONS ( destination_name, destination_uri, sn_id, redirect_type_id, destination_type_id, is_active, accepts_sms, forward_calls  )
VALUES (
'my DroidX',
'sip:127.0.0.1:5090',
3,
2,
1,
false,
false,
true
);



commit;

SELECT * FROM STARNUMBER.DESTINATIONS;
