Sprint 1 Database changes are Disruptive, in that they change the schema.

Before running any of these scripts you must manually create the schema STARNUMBER , and also create the appropriate schema authorization.  Do this only once.

E.g.  Something like

CREATE SCHEMA STARNUMBER;
CREATE SCHEMA AUTHORIZATION joe;

Once you have created schema STARNUMBER, run SQL scripts in this order to create tables:


schema_create_table_users.sql
schema_create_table_user_profiles.sql



For some sample data:

data_populate_users.sql
data_populate_user_profiles.sql





Also remember to GRANT all required permissions!

*************  UNDO  *****************


To reverse this process, and restore the DB schema to its original state, run these SQL scripts in this order:




schema_create_table_user_profiles_UNDO.sql
schema_create_table_users_UNDO.sql

