Sprint 2 Database changes are Disruptive, in that they change the schema.


Once you have created schema STARNUMBER, run SQL scripts in this order to create tables:

schema_create_table_line_types.sql
schema_create_table_lines.sql
schema_create_table_settings.sql
schema_create_table_line_profiles.sql
schema_create_table_line_settings.sql



For some sample data:






Also remember to GRANT all required permissions!

*************  UNDO  *****************


To reverse this process, and restore the DB schema to its original state, run these SQL scripts in this order:

schema_create_table_line_settings_undo.sql
schema_create_table_line_profiles_undo.sql
schema_create_table_settings_undo.sql
schema_create_table_lines_undo.sql
schema_create_table_line_types_undo.sql









