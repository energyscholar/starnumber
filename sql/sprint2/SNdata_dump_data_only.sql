--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.4
-- Started on 2011-08-28 17:26:49

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = starnumber, pg_catalog;

--
-- TOC entry 1887 (class 0 OID 0)
-- Dependencies: 1547
-- Name: line_profiles_line_profile_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('line_profiles_line_profile_id_seq', 5, true);


--
-- TOC entry 1888 (class 0 OID 0)
-- Dependencies: 1549
-- Name: line_settings_line_setting_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('line_settings_line_setting_id_seq', 7, true);


--
-- TOC entry 1889 (class 0 OID 0)
-- Dependencies: 1541
-- Name: line_types_line_type_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('line_types_line_type_id_seq', 6, true);


--
-- TOC entry 1890 (class 0 OID 0)
-- Dependencies: 1543
-- Name: lines_line_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('lines_line_id_seq', 4, true);


--
-- TOC entry 1891 (class 0 OID 0)
-- Dependencies: 1545
-- Name: settings_setting_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('settings_setting_id_seq', 2, true);


--
-- TOC entry 1892 (class 0 OID 0)
-- Dependencies: 1539
-- Name: user_profiles_user_profile_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('user_profiles_user_profile_id_seq', 3, true);


--
-- TOC entry 1893 (class 0 OID 0)
-- Dependencies: 1537
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: starnumber; Owner: postgres
--

SELECT pg_catalog.setval('users_user_id_seq', 3, true);


--
-- TOC entry 1880 (class 0 OID 27330)
-- Dependencies: 1542
-- Data for Name: line_types; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO line_types VALUES (1, 1, 'Inbound SN');
INSERT INTO line_types VALUES (2, 2, 'outbound internet');
INSERT INTO line_types VALUES (3, 3, 'SIP out to VOIP provider');
INSERT INTO line_types VALUES (4, 4, 'Registered Device');
INSERT INTO line_types VALUES (5, 5, 'PSTN destination');
INSERT INTO line_types VALUES (6, 6, 'SIP URI Destination');


--
-- TOC entry 1879 (class 0 OID 27321)
-- Dependencies: 1540
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO user_profiles VALUES (1, 1, 'testuser profile 1', false, NULL);
INSERT INTO user_profiles VALUES (2, 2, 'testuser profile 2', false, NULL);
INSERT INTO user_profiles VALUES (3, 3, 'testuser profile 3', false, NULL);


--
-- TOC entry 1881 (class 0 OID 27358)
-- Dependencies: 1544 1880 1879
-- Data for Name: lines; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO lines VALUES (1, 'My first starnumber', 1, 3, '7827*7829@starnumber.net', true);
INSERT INTO lines VALUES (2, 'Pbxes uri mmzade-29', 6, 3, 'mmzade-29@pbxes.org', true);
INSERT INTO lines VALUES (3, 'Registered Device', 4, 3, 'Charlie@starnumber.net', true);
INSERT INTO lines VALUES (4, 'Bruce''s sip2sip', 6, 3, 'brucepjsip@sip2sip.info', true);


--
-- TOC entry 1883 (class 0 OID 27384)
-- Dependencies: 1548 1881
-- Data for Name: line_profiles; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO line_profiles VALUES (1, 'Default', 1);
INSERT INTO line_profiles VALUES (2, 'Default', 2);
INSERT INTO line_profiles VALUES (3, 'Default', 3);
INSERT INTO line_profiles VALUES (4, 'Default', 4);


--
-- TOC entry 1884 (class 0 OID 27397)
-- Dependencies: 1550 1883
-- Data for Name: line_profile_settings; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO line_profile_settings VALUES (1, 1, 1, '2');
INSERT INTO line_profile_settings VALUES (2, 2, 2, 'stateless');
INSERT INTO line_profile_settings VALUES (3, 3, 2, 'media');
INSERT INTO line_profile_settings VALUES (4, 1, 1, '3');
INSERT INTO line_profile_settings VALUES (5, 1, 1, '4');
INSERT INTO line_profile_settings VALUES (6, 4, 2, 'statefull');


--
-- TOC entry 1882 (class 0 OID 27376)
-- Dependencies: 1546
-- Data for Name: settings; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO settings VALUES (2, 2, 'Varchar', 'redirect type. stateless, statefull, media');
INSERT INTO settings VALUES (1, 1, 'Int', 'Ring On Destination Line ID');


--
-- TOC entry 1878 (class 0 OID 27309)
-- Dependencies: 1538
-- Data for Name: users; Type: TABLE DATA; Schema: starnumber; Owner: postgres
--

INSERT INTO users VALUES (1, 'testuser', 'password', 'testuser@example.com', false, NULL, NULL);
INSERT INTO users VALUES (2, 'testuser1', 'password1', 'testuser1@example.com', false, NULL, NULL);
INSERT INTO users VALUES (3, 'testuser2', 'password2', 'testuser2@example.com', false, NULL, NULL);


-- Completed on 2011-08-28 17:26:49

--
-- PostgreSQL database dump complete
--

