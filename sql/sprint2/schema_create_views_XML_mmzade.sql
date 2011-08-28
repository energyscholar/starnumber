xml_ver_1
SELECT xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_1_user_profiles.user_profile_name, xml_ver_1_pre_1_user_profiles.user_id, xml_ver_1_pre_1_user_profiles.username, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_2_lines.line_name, xml_ver_1_pre_2_lines.uri, xml_ver_1_pre_2_lines.is_active, xml_ver_1_pre_2_lines.line_type_number, xml_ver_1_pre_2_lines.line_type_description, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_3_line_profiles.line_profile_name, xml_ver_1_pre_4_settings.setting_number, xml_ver_1_pre_4_settings.setting_description, xml_ver_1_pre_4_settings.setting_value_type, xml_ver_1_pre_4_settings.setting_value, xml_ver_1_pre_4_settings.line_setting_id
   FROM xml_ver_1_pre_1_user_profiles
   LEFT JOIN xml_ver_1_pre_2_lines ON xml_ver_1_pre_1_user_profiles.user_profile_id = xml_ver_1_pre_2_lines.user_profile_id
   LEFT JOIN xml_ver_1_pre_3_line_profiles ON xml_ver_1_pre_2_lines.line_id = xml_ver_1_pre_3_line_profiles.line_id
   LEFT JOIN xml_ver_1_pre_4_settings ON xml_ver_1_pre_3_line_profiles.line_profile_id = xml_ver_1_pre_4_settings.line_profile_id
  ORDER BY xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_4_settings.line_setting_id;

xml_ver_1_pre_1_user_profiles

 SELECT user_profiles.user_profile_id, user_profiles.user_profile_name, users.user_id, users.username
   FROM user_profiles
   LEFT JOIN users ON user_profiles.owner_user_id = users.user_id
  WHERE user_profiles.user_profile_id = 3;

xml_ver_1_pre_2_lines

 SELECT lines.line_id, lines.line_name, lines.user_profile_id, lines.uri, lines.is_active, line_types.line_type_number, line_types.line_type_description
   FROM lines
   LEFT JOIN line_types ON lines.line_type_number = line_types.line_type_number
  WHERE lines.user_profile_id = 3;

xml_ver_1_pre_3_line_profiles

 SELECT line_profiles.line_profile_id, line_profiles.line_profile_name, line_profiles.line_id
   FROM line_profiles
   LEFT JOIN lines ON line_profiles.line_id = lines.line_id
  WHERE lines.user_profile_id = 3;

xml_ver_1_pre_4_settings

 SELECT line_profile_settings.line_profile_id, line_profiles.line_id, line_profile_settings.setting_number, settings.setting_description, settings.setting_value_type, line_profile_settings.setting_value, line_profile_settings.line_setting_id
   FROM line_profile_settings
   LEFT JOIN settings ON line_profile_settings.setting_number = settings.setting_number
   LEFT JOIN line_profiles ON line_profile_settings.line_profile_id = line_profiles.line_profile_id
   LEFT JOIN lines ON line_profiles.line_id = lines.line_id
  WHERE lines.user_profile_id = 3;

xml_ver_1_test

SELECT XMLELEMENT(NAME user_profile, XMLATTRIBUTES('3' AS user_profile_id, 'testuser profile 3' AS user_profile_name), XMLELEMENT(NAME line, XMLATTRIBUTES('1' AS line_id), XMLELEMENT(NAME line_profile, XMLATTRIBUTES('1' AS line_profile_id), 
'line profile content'))) AS query_to_xml;

xml_ver_1_xml

 SELECT query_to_xml('SELECT xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_1_user_profiles.user_profile_name, xml_ver_1_pre_1_user_profiles.user_id, xml_ver_1_pre_1_user_profiles.username, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_2_lines.line_name, xml_ver_1_pre_2_lines.uri, xml_ver_1_pre_2_lines.is_active, xml_ver_1_pre_2_lines.line_type_number, xml_ver_1_pre_2_lines.line_type_description, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_3_line_profiles.line_profile_name, xml_ver_1_pre_4_settings.setting_number, xml_ver_1_pre_4_settings.setting_description, xml_ver_1_pre_4_settings.setting_value_type, xml_ver_1_pre_4_settings.setting_value, xml_ver_1_pre_4_settings.line_setting_id
   FROM xml_ver_1_pre_1_user_profiles
   LEFT JOIN xml_ver_1_pre_2_lines ON xml_ver_1_pre_1_user_profiles.user_profile_id = xml_ver_1_pre_2_lines.user_profile_id
   LEFT JOIN xml_ver_1_pre_3_line_profiles ON xml_ver_1_pre_2_lines.line_id = xml_ver_1_pre_3_line_profiles.line_id
   LEFT JOIN xml_ver_1_pre_4_settings ON xml_ver_1_pre_3_line_profiles.line_profile_id = xml_ver_1_pre_4_settings.line_profile_id
  ORDER BY xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_4_settings.line_setting_id;'::text, true, true, ''::text) AS query_to_xml;

