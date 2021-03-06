--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.4
-- Started on 2011-08-28 16:36:25

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 27305)
-- Name: starnumber; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA starnumber;


ALTER SCHEMA starnumber OWNER TO postgres;

SET search_path = starnumber, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1546 (class 1259 OID 27397)
-- Dependencies: 7
-- Name: line_profile_settings; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE line_profile_settings (
    line_setting_id integer NOT NULL,
    line_profile_id integer,
    setting_number integer,
    setting_value character varying(256)
);


ALTER TABLE starnumber.line_profile_settings OWNER TO postgres;

--
-- TOC entry 1879 (class 0 OID 0)
-- Dependencies: 1546
-- Name: TABLE line_profile_settings; Type: COMMENT; Schema: starnumber; Owner: postgres
--

COMMENT ON TABLE line_profile_settings IS 'This table tracks dynamically generated name, value pairs that apply to lines';


--
-- TOC entry 1544 (class 1259 OID 27384)
-- Dependencies: 7
-- Name: line_profiles; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE line_profiles (
    line_profile_id integer NOT NULL,
    line_profile_name character varying(256),
    line_id integer
);


ALTER TABLE starnumber.line_profiles OWNER TO postgres;

--
-- TOC entry 1880 (class 0 OID 0)
-- Dependencies: 1544
-- Name: TABLE line_profiles; Type: COMMENT; Schema: starnumber; Owner: postgres
--

COMMENT ON TABLE line_profiles IS 'This table ties line_profile to line, and provides a useful descriptor';


--
-- TOC entry 1543 (class 1259 OID 27382)
-- Dependencies: 7 1544
-- Name: line_profiles_line_profile_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE line_profiles_line_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.line_profiles_line_profile_id_seq OWNER TO postgres;

--
-- TOC entry 1881 (class 0 OID 0)
-- Dependencies: 1543
-- Name: line_profiles_line_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE line_profiles_line_profile_id_seq OWNED BY line_profiles.line_profile_id;


--
-- TOC entry 1882 (class 0 OID 0)
-- Dependencies: 1543
-- Name: line_profiles_line_profile_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('line_profiles_line_profile_id_seq', 5, true);


--
-- TOC entry 1545 (class 1259 OID 27395)
-- Dependencies: 7 1546
-- Name: line_settings_line_setting_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE line_settings_line_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.line_settings_line_setting_id_seq OWNER TO postgres;

--
-- TOC entry 1883 (class 0 OID 0)
-- Dependencies: 1545
-- Name: line_settings_line_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE line_settings_line_setting_id_seq OWNED BY line_profile_settings.line_setting_id;


--
-- TOC entry 1884 (class 0 OID 0)
-- Dependencies: 1545
-- Name: line_settings_line_setting_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('line_settings_line_setting_id_seq', 7, true);


--
-- TOC entry 1538 (class 1259 OID 27330)
-- Dependencies: 7
-- Name: line_types; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE line_types (
    line_type_id integer NOT NULL,
    line_type_number integer,
    line_type_description character varying(80)
);


ALTER TABLE starnumber.line_types OWNER TO postgres;

--
-- TOC entry 1885 (class 0 OID 0)
-- Dependencies: 1538
-- Name: TABLE line_types; Type: COMMENT; Schema: starnumber; Owner: postgres
--

COMMENT ON TABLE line_types IS 'This dictionary table tracks the possible types of line';


--
-- TOC entry 1537 (class 1259 OID 27328)
-- Dependencies: 1538 7
-- Name: line_types_line_type_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE line_types_line_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.line_types_line_type_id_seq OWNER TO postgres;

--
-- TOC entry 1886 (class 0 OID 0)
-- Dependencies: 1537
-- Name: line_types_line_type_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE line_types_line_type_id_seq OWNED BY line_types.line_type_id;


--
-- TOC entry 1887 (class 0 OID 0)
-- Dependencies: 1537
-- Name: line_types_line_type_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('line_types_line_type_id_seq', 6, true);


--
-- TOC entry 1540 (class 1259 OID 27358)
-- Dependencies: 7
-- Name: lines; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE lines (
    line_id integer NOT NULL,
    line_name character varying(80),
    line_type_number integer,
    user_profile_id integer,
    uri character varying(256),
    is_active boolean
);


ALTER TABLE starnumber.lines OWNER TO postgres;

--
-- TOC entry 1888 (class 0 OID 0)
-- Dependencies: 1540
-- Name: TABLE lines; Type: COMMENT; Schema: starnumber; Owner: postgres
--

COMMENT ON TABLE lines IS 'This table tracks incoming and outgoing lines';


--
-- TOC entry 1539 (class 1259 OID 27356)
-- Dependencies: 1540 7
-- Name: lines_line_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE lines_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.lines_line_id_seq OWNER TO postgres;

--
-- TOC entry 1889 (class 0 OID 0)
-- Dependencies: 1539
-- Name: lines_line_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE lines_line_id_seq OWNED BY lines.line_id;


--
-- TOC entry 1890 (class 0 OID 0)
-- Dependencies: 1539
-- Name: lines_line_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('lines_line_id_seq', 4, true);


--
-- TOC entry 1542 (class 1259 OID 27376)
-- Dependencies: 7
-- Name: settings; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE settings (
    setting_id integer NOT NULL,
    setting_number integer,
    setting_value_type character varying(80),
    setting_description character varying(256)
);


ALTER TABLE starnumber.settings OWNER TO postgres;

--
-- TOC entry 1891 (class 0 OID 0)
-- Dependencies: 1542
-- Name: TABLE settings; Type: COMMENT; Schema: starnumber; Owner: postgres
--

COMMENT ON TABLE settings IS 'This table tracks dynamically generated name, value pairs.  TODO: consider refactor';


--
-- TOC entry 1541 (class 1259 OID 27374)
-- Dependencies: 1542 7
-- Name: settings_setting_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE settings_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.settings_setting_id_seq OWNER TO postgres;

--
-- TOC entry 1892 (class 0 OID 0)
-- Dependencies: 1541
-- Name: settings_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE settings_setting_id_seq OWNED BY settings.setting_id;


--
-- TOC entry 1893 (class 0 OID 0)
-- Dependencies: 1541
-- Name: settings_setting_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('settings_setting_id_seq', 2, true);


--
-- TOC entry 1536 (class 1259 OID 27321)
-- Dependencies: 1844 7
-- Name: user_profiles; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE user_profiles (
    user_profile_id integer NOT NULL,
    owner_user_id integer,
    user_profile_name character varying(50),
    is_admin boolean DEFAULT false,
    last_user_uppate date
);


ALTER TABLE starnumber.user_profiles OWNER TO postgres;

--
-- TOC entry 1535 (class 1259 OID 27319)
-- Dependencies: 1536 7
-- Name: user_profiles_user_profile_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE user_profiles_user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.user_profiles_user_profile_id_seq OWNER TO postgres;

--
-- TOC entry 1894 (class 0 OID 0)
-- Dependencies: 1535
-- Name: user_profiles_user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE user_profiles_user_profile_id_seq OWNED BY user_profiles.user_profile_id;


--
-- TOC entry 1895 (class 0 OID 0)
-- Dependencies: 1535
-- Name: user_profiles_user_profile_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('user_profiles_user_profile_id_seq', 3, true);


--
-- TOC entry 1534 (class 1259 OID 27309)
-- Dependencies: 1839 1840 1841 1842 7
-- Name: users; Type: TABLE; Schema: starnumber; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(50) DEFAULT NULL::character varying,
    password character varying(50) DEFAULT NULL::character varying,
    email character varying(256) DEFAULT NULL::character varying,
    is_admin boolean DEFAULT false,
    create_time date,
    last_update_time date
);


ALTER TABLE starnumber.users OWNER TO postgres;

--
-- TOC entry 1896 (class 0 OID 0)
-- Dependencies: 1534
-- Name: TABLE users; Type: COMMENT; Schema: starnumber; Owner: postgres
--

COMMENT ON TABLE users IS 'user_profile of a starNumber registered user, field is_admin will be subsumed by role in Starnumber Version 2.0';


--
-- TOC entry 1533 (class 1259 OID 27307)
-- Dependencies: 7 1534
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: starnumber; Owner: postgres
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE starnumber.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 1897 (class 0 OID 0)
-- Dependencies: 1533
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: starnumber; Owner: postgres
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- TOC entry 1898 (class 0 OID 0)
-- Dependencies: 1533
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('users_user_id_seq', 3, true);


--
-- TOC entry 1547 (class 1259 OID 27430)
-- Dependencies: 1640 7
-- Name: xml_ver_1_pre_1_user_profiles; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1_pre_1_user_profiles AS
    SELECT user_profiles.user_profile_id, user_profiles.user_profile_name, users.user_id, users.username FROM (user_profiles LEFT JOIN users ON ((user_profiles.owner_user_id = users.user_id))) WHERE (user_profiles.user_profile_id = 3);


ALTER TABLE starnumber.xml_ver_1_pre_1_user_profiles OWNER TO postgres;

--
-- TOC entry 1548 (class 1259 OID 27439)
-- Dependencies: 1641 7
-- Name: xml_ver_1_pre_2_lines; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1_pre_2_lines AS
    SELECT lines.line_id, lines.line_name, lines.user_profile_id, lines.uri, lines.is_active, line_types.line_type_number, line_types.line_type_description FROM (lines LEFT JOIN line_types ON ((lines.line_type_number = line_types.line_type_number))) WHERE (lines.user_profile_id = 3);


ALTER TABLE starnumber.xml_ver_1_pre_2_lines OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 27443)
-- Dependencies: 1642 7
-- Name: xml_ver_1_pre_3_line_profiles; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1_pre_3_line_profiles AS
    SELECT line_profiles.line_profile_id, line_profiles.line_profile_name, line_profiles.line_id FROM (line_profiles LEFT JOIN lines ON ((line_profiles.line_id = lines.line_id))) WHERE (lines.user_profile_id = 3);


ALTER TABLE starnumber.xml_ver_1_pre_3_line_profiles OWNER TO postgres;

--
-- TOC entry 1550 (class 1259 OID 27451)
-- Dependencies: 1643 7
-- Name: xml_ver_1_pre_4_settings; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1_pre_4_settings AS
    SELECT line_profile_settings.line_profile_id, line_profiles.line_id, line_profile_settings.setting_number, settings.setting_description, settings.setting_value_type, line_profile_settings.setting_value, line_profile_settings.line_setting_id FROM (((line_profile_settings LEFT JOIN settings ON ((line_profile_settings.setting_number = settings.setting_number))) LEFT JOIN line_profiles ON ((line_profile_settings.line_profile_id = line_profiles.line_profile_id))) LEFT JOIN lines ON ((line_profiles.line_id = lines.line_id))) WHERE (lines.user_profile_id = 3);


ALTER TABLE starnumber.xml_ver_1_pre_4_settings OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 27455)
-- Dependencies: 1644 7
-- Name: xml_ver_1; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1 AS
    SELECT xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_1_user_profiles.user_profile_name, xml_ver_1_pre_1_user_profiles.user_id, xml_ver_1_pre_1_user_profiles.username, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_2_lines.line_name, xml_ver_1_pre_2_lines.uri, xml_ver_1_pre_2_lines.is_active, xml_ver_1_pre_2_lines.line_type_number, xml_ver_1_pre_2_lines.line_type_description, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_3_line_profiles.line_profile_name, xml_ver_1_pre_4_settings.setting_number, xml_ver_1_pre_4_settings.setting_description, xml_ver_1_pre_4_settings.setting_value_type, xml_ver_1_pre_4_settings.setting_value, xml_ver_1_pre_4_settings.line_setting_id FROM (((xml_ver_1_pre_1_user_profiles LEFT JOIN xml_ver_1_pre_2_lines ON ((xml_ver_1_pre_1_user_profiles.user_profile_id = xml_ver_1_pre_2_lines.user_profile_id))) LEFT JOIN xml_ver_1_pre_3_line_profiles ON ((xml_ver_1_pre_2_lines.line_id = xml_ver_1_pre_3_line_profiles.line_id))) LEFT JOIN xml_ver_1_pre_4_settings ON ((xml_ver_1_pre_3_line_profiles.line_profile_id = xml_ver_1_pre_4_settings.line_profile_id))) ORDER BY xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_4_settings.line_setting_id;


ALTER TABLE starnumber.xml_ver_1 OWNER TO postgres;

--
-- TOC entry 1553 (class 1259 OID 27478)
-- Dependencies: 1646 7
-- Name: xml_ver_1_test; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1_test AS
    SELECT XMLELEMENT(NAME user_profile, XMLATTRIBUTES('3' AS user_profile_id, 'testuser profile 3' AS user_profile_name), XMLELEMENT(NAME line, XMLATTRIBUTES('1' AS line_id), XMLELEMENT(NAME line_profile, XMLATTRIBUTES('1' AS line_profile_id), XMLELEMENT(NAME line_profile_settings, XMLATTRIBUTES('1' AS line_profile_setting_id)), XMLELEMENT(NAME line_profile_settings, XMLATTRIBUTES('2' AS line_profile_setting_id))))) AS query_to_xml;


ALTER TABLE starnumber.xml_ver_1_test OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 27470)
-- Dependencies: 1645 7
-- Name: xml_ver_1_xml; Type: VIEW; Schema: starnumber; Owner: postgres
--

CREATE VIEW xml_ver_1_xml AS
    SELECT query_to_xml('SELECT xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_1_user_profiles.user_profile_name, xml_ver_1_pre_1_user_profiles.user_id, xml_ver_1_pre_1_user_profiles.username, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_2_lines.line_name, xml_ver_1_pre_2_lines.uri, xml_ver_1_pre_2_lines.is_active, xml_ver_1_pre_2_lines.line_type_number, xml_ver_1_pre_2_lines.line_type_description, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_3_line_profiles.line_profile_name, xml_ver_1_pre_4_settings.setting_number, xml_ver_1_pre_4_settings.setting_description, xml_ver_1_pre_4_settings.setting_value_type, xml_ver_1_pre_4_settings.setting_value, xml_ver_1_pre_4_settings.line_setting_id
   FROM xml_ver_1_pre_1_user_profiles
   LEFT JOIN xml_ver_1_pre_2_lines ON xml_ver_1_pre_1_user_profiles.user_profile_id = xml_ver_1_pre_2_lines.user_profile_id
   LEFT JOIN xml_ver_1_pre_3_line_profiles ON xml_ver_1_pre_2_lines.line_id = xml_ver_1_pre_3_line_profiles.line_id
   LEFT JOIN xml_ver_1_pre_4_settings ON xml_ver_1_pre_3_line_profiles.line_profile_id = xml_ver_1_pre_4_settings.line_profile_id
  ORDER BY xml_ver_1_pre_1_user_profiles.user_profile_id, xml_ver_1_pre_2_lines.line_id, xml_ver_1_pre_3_line_profiles.line_profile_id, xml_ver_1_pre_4_settings.line_setting_id;'::text, true, true, ''::text) AS query_to_xml;


ALTER TABLE starnumber.xml_ver_1_xml OWNER TO postgres;

--
-- TOC entry 1849 (class 2604 OID 27400)
-- Dependencies: 1546 1545 1546
-- Name: line_setting_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE line_profile_settings ALTER COLUMN line_setting_id SET DEFAULT nextval('line_settings_line_setting_id_seq'::regclass);


--
-- TOC entry 1848 (class 2604 OID 27387)
-- Dependencies: 1543 1544 1544
-- Name: line_profile_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE line_profiles ALTER COLUMN line_profile_id SET DEFAULT nextval('line_profiles_line_profile_id_seq'::regclass);


--
-- TOC entry 1845 (class 2604 OID 27333)
-- Dependencies: 1537 1538 1538
-- Name: line_type_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE line_types ALTER COLUMN line_type_id SET DEFAULT nextval('line_types_line_type_id_seq'::regclass);


--
-- TOC entry 1846 (class 2604 OID 27361)
-- Dependencies: 1539 1540 1540
-- Name: line_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE lines ALTER COLUMN line_id SET DEFAULT nextval('lines_line_id_seq'::regclass);


--
-- TOC entry 1847 (class 2604 OID 27379)
-- Dependencies: 1542 1541 1542
-- Name: setting_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE settings ALTER COLUMN setting_id SET DEFAULT nextval('settings_setting_id_seq'::regclass);


--
-- TOC entry 1843 (class 2604 OID 27324)
-- Dependencies: 1536 1535 1536
-- Name: user_profile_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE user_profiles ALTER COLUMN user_profile_id SET DEFAULT nextval('user_profiles_user_profile_id_seq'::regclass);


--
-- TOC entry 1838 (class 2604 OID 27312)
-- Dependencies: 1533 1534 1534
-- Name: user_id; Type: DEFAULT; Schema: starnumber; Owner: postgres
--

ALTER TABLE users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- TOC entry 1876 (class 0 OID 27397)
-- Dependencies: 1546
-- Data for Name: line_profile_settings; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY line_profile_settings (line_setting_id, line_profile_id, setting_number, setting_value) FROM stdin;
1	1	1	2
2	2	2	stateless
3	3	2	media
4	1	1	3
5	1	1	4
6	4	2	statefull
\.


--
-- TOC entry 1875 (class 0 OID 27384)
-- Dependencies: 1544
-- Data for Name: line_profiles; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY line_profiles (line_profile_id, line_profile_name, line_id) FROM stdin;
1	Default	1
2	Default	2
3	Default	3
4	Default	4
\.


--
-- TOC entry 1872 (class 0 OID 27330)
-- Dependencies: 1538
-- Data for Name: line_types; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY line_types (line_type_id, line_type_number, line_type_description) FROM stdin;
1	1	Inbound SN
2	2	outbound internet
3	3	SIP out to VOIP provider
4	4	Registered Device
5	5	PSTN destination
6	6	SIP URI Destination
\.


--
-- TOC entry 1873 (class 0 OID 27358)
-- Dependencies: 1540
-- Data for Name: lines; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY lines (line_id, line_name, line_type_number, user_profile_id, uri, is_active) FROM stdin;
1	My first starnumber	1	3	7827*7829@starnumber.net	t
2	Pbxes uri mmzade-29	6	3	mmzade-29@pbxes.org	t
3	Registered Device	4	3	Charlie@starnumber.net	t
4	Bruce's sip2sip	6	3	brucepjsip@sip2sip.info	t
\.


--
-- TOC entry 1874 (class 0 OID 27376)
-- Dependencies: 1542
-- Data for Name: settings; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY settings (setting_id, setting_number, setting_value_type, setting_description) FROM stdin;
2	2	Varchar	redirect type. stateless, statefull, media
1	1	Int	Ring On Destination Line ID
\.


--
-- TOC entry 1871 (class 0 OID 27321)
-- Dependencies: 1536
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY user_profiles (user_profile_id, owner_user_id, user_profile_name, is_admin, last_user_uppate) FROM stdin;
1	1	testuser profile 1	f	\N
2	2	testuser profile 2	f	\N
3	3	testuser profile 3	f	\N
\.


--
-- TOC entry 1870 (class 0 OID 27309)
-- Dependencies: 1534
-- Data for Name: users; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

COPY users (user_id, username, password, email, is_admin, create_time, last_update_time) FROM stdin;
1	testuser	password	testuser@example.com	f	\N	\N
2	testuser1	password1	testuser1@example.com	f	\N	\N
3	testuser2	password2	testuser2@example.com	f	\N	\N
\.


--
-- TOC entry 1863 (class 2606 OID 27389)
-- Dependencies: 1544 1544
-- Name: line_profiles_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY line_profiles
    ADD CONSTRAINT line_profiles_pkey PRIMARY KEY (line_profile_id);


--
-- TOC entry 1865 (class 2606 OID 27402)
-- Dependencies: 1546 1546
-- Name: line_settings_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY line_profile_settings
    ADD CONSTRAINT line_settings_pkey PRIMARY KEY (line_setting_id);


--
-- TOC entry 1855 (class 2606 OID 27337)
-- Dependencies: 1538 1538
-- Name: line_types_line_type_number_key; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY line_types
    ADD CONSTRAINT line_types_line_type_number_key UNIQUE (line_type_number);


--
-- TOC entry 1857 (class 2606 OID 27335)
-- Dependencies: 1538 1538
-- Name: line_types_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY line_types
    ADD CONSTRAINT line_types_pkey PRIMARY KEY (line_type_id);


--
-- TOC entry 1859 (class 2606 OID 27363)
-- Dependencies: 1540 1540
-- Name: lines_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lines
    ADD CONSTRAINT lines_pkey PRIMARY KEY (line_id);


--
-- TOC entry 1861 (class 2606 OID 27381)
-- Dependencies: 1542 1542
-- Name: settings_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (setting_id);


--
-- TOC entry 1853 (class 2606 OID 27327)
-- Dependencies: 1536 1536
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_profile_id);


--
-- TOC entry 1851 (class 2606 OID 27318)
-- Dependencies: 1534 1534
-- Name: users_pkey; Type: CONSTRAINT; Schema: starnumber; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1868 (class 2606 OID 27390)
-- Dependencies: 1540 1858 1544
-- Name: line_profiles_line_id_fkey; Type: FK CONSTRAINT; Schema: starnumber; Owner: postgres
--

ALTER TABLE ONLY line_profiles
    ADD CONSTRAINT line_profiles_line_id_fkey FOREIGN KEY (line_id) REFERENCES lines(line_id);


--
-- TOC entry 1869 (class 2606 OID 27413)
-- Dependencies: 1544 1546 1862
-- Name: line_settings_line_profile_id_fkey; Type: FK CONSTRAINT; Schema: starnumber; Owner: postgres
--

ALTER TABLE ONLY line_profile_settings
    ADD CONSTRAINT line_settings_line_profile_id_fkey FOREIGN KEY (line_profile_id) REFERENCES line_profiles(line_profile_id);


--
-- TOC entry 1866 (class 2606 OID 27364)
-- Dependencies: 1538 1854 1540
-- Name: lines_line_type_number_fkey; Type: FK CONSTRAINT; Schema: starnumber; Owner: postgres
--

ALTER TABLE ONLY lines
    ADD CONSTRAINT lines_line_type_number_fkey FOREIGN KEY (line_type_number) REFERENCES line_types(line_type_number);


--
-- TOC entry 1867 (class 2606 OID 27369)
-- Dependencies: 1540 1536 1852
-- Name: lines_user_profile_id_fkey; Type: FK CONSTRAINT; Schema: starnumber; Owner: postgres
--

ALTER TABLE ONLY lines
    ADD CONSTRAINT lines_user_profile_id_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profiles(user_profile_id);


-- Completed on 2011-08-28 16:36:26

--
-- PostgreSQL database dump complete
--

