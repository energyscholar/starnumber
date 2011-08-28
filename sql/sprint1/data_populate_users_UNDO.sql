-- SQL that deletes users added in similarly named script


DELETE FROM STARNUMBER.USERS WHERE
	USERNAME = 'testuser' OR
	USERNAME = 'testuser1' OR
	USERNAME ='testuser2';
commit;

