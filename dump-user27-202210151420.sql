--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 14.2

-- Started on 2022-10-15 14:20:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE user27;
--
-- TOC entry 3095 (class 1262 OID 16460)
-- Name: user27; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE user27 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect user27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 17396)
-- Name: accountant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accountant (
    id_accountant integer NOT NULL,
    id_user integer,
    "N.S." character varying,
    log_in_date timestamp with time zone
);


--
-- TOC entry 207 (class 1259 OID 17671)
-- Name: bill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bill (
    id_comp_serv integer,
    id_ins_comp integer,
    id_bill integer NOT NULL,
    id_accountant integer
);


--
-- TOC entry 213 (class 1259 OID 20481)
-- Name: completed service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."completed service" (
    id_comp_serv integer NOT NULL,
    id_service integer,
    id_worker integer,
    id_patient integer,
    id_serv_order integer
);


--
-- TOC entry 212 (class 1259 OID 20287)
-- Name: insurance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.insurance (
    id_ins integer NOT NULL,
    id_patient integer,
    id_ins_comp integer,
    ins_number numeric,
    id_ins_type integer
);


--
-- TOC entry 202 (class 1259 OID 16770)
-- Name: insurance company; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."insurance company" (
    name_ins_comp character varying,
    id_ins_comp integer NOT NULL,
    address character varying,
    inn bigint,
    rs numeric,
    bik numeric
);


--
-- TOC entry 211 (class 1259 OID 20208)
-- Name: insurance type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."insurance type" (
    id_ins_type integer NOT NULL,
    name_type character varying
);


--
-- TOC entry 203 (class 1259 OID 17045)
-- Name: order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."order" (
    id_order integer NOT NULL,
    date date,
    id_status integer,
    order_term real
);


--
-- TOC entry 201 (class 1259 OID 16637)
-- Name: patient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patient (
    id_patient integer NOT NULL,
    "N.S." character varying,
    birthdate date,
    passport integer,
    phone bigint,
    e_mail character varying,
    id_ins_type integer,
    id_user integer
);


--
-- TOC entry 208 (class 1259 OID 18307)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id_role integer NOT NULL,
    name_role character varying
);


--
-- TOC entry 200 (class 1259 OID 16618)
-- Name: service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service (
    id_service integer NOT NULL,
    name_service character varying,
    price numeric,
    term integer,
    av_deviation numeric,
    code numeric
);


--
-- TOC entry 209 (class 1259 OID 18947)
-- Name: services in order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."services in order" (
    id_service integer,
    id_order integer,
    id_status integer,
    id_serv_ord integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18951)
-- Name: status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.status (
    id_status integer NOT NULL,
    name_status character varying
);


--
-- TOC entry 204 (class 1259 OID 17155)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    login character varying,
    passwd character varying,
    id_role integer,
    id_user integer NOT NULL,
    ip character varying,
    lastener character varying
);


--
-- TOC entry 205 (class 1259 OID 17166)
-- Name: workers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workers (
    id_user integer,
    "N.S." character varying,
    id_worker integer NOT NULL,
    log_in_date timestamp with time zone
);


--
-- TOC entry 3082 (class 0 OID 17396)
-- Dependencies: 206
-- Data for Name: accountant; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3083 (class 0 OID 17671)
-- Dependencies: 207
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3089 (class 0 OID 20481)
-- Dependencies: 213
-- Data for Name: completed service; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3088 (class 0 OID 20287)
-- Dependencies: 212
-- Data for Name: insurance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3078 (class 0 OID 16770)
-- Dependencies: 202
-- Data for Name: insurance company; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3087 (class 0 OID 20208)
-- Dependencies: 211
-- Data for Name: insurance type; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3079 (class 0 OID 17045)
-- Dependencies: 203
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3077 (class 0 OID 16637)
-- Dependencies: 201
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3084 (class 0 OID 18307)
-- Dependencies: 208
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roles VALUES (1, NULL);
INSERT INTO public.roles VALUES (2, NULL);
INSERT INTO public.roles VALUES (3, NULL);
INSERT INTO public.roles VALUES (4, NULL);
INSERT INTO public.roles VALUES (5, NULL);
INSERT INTO public.roles VALUES (6, NULL);
INSERT INTO public.roles VALUES (7, NULL);
INSERT INTO public.roles VALUES (8, NULL);
INSERT INTO public.roles VALUES (9, NULL);
INSERT INTO public.roles VALUES (10, NULL);
INSERT INTO public.roles VALUES (11, NULL);
INSERT INTO public.roles VALUES (12, NULL);
INSERT INTO public.roles VALUES (13, NULL);
INSERT INTO public.roles VALUES (14, NULL);
INSERT INTO public.roles VALUES (15, NULL);
INSERT INTO public.roles VALUES (16, NULL);
INSERT INTO public.roles VALUES (17, NULL);
INSERT INTO public.roles VALUES (18, NULL);
INSERT INTO public.roles VALUES (19, NULL);
INSERT INTO public.roles VALUES (20, NULL);
INSERT INTO public.roles VALUES (21, NULL);
INSERT INTO public.roles VALUES (22, NULL);
INSERT INTO public.roles VALUES (23, NULL);
INSERT INTO public.roles VALUES (24, NULL);
INSERT INTO public.roles VALUES (25, NULL);
INSERT INTO public.roles VALUES (26, NULL);
INSERT INTO public.roles VALUES (27, NULL);
INSERT INTO public.roles VALUES (28, NULL);
INSERT INTO public.roles VALUES (29, NULL);
INSERT INTO public.roles VALUES (30, NULL);
INSERT INTO public.roles VALUES (31, NULL);
INSERT INTO public.roles VALUES (32, NULL);
INSERT INTO public.roles VALUES (33, NULL);
INSERT INTO public.roles VALUES (34, NULL);
INSERT INTO public.roles VALUES (35, NULL);
INSERT INTO public.roles VALUES (36, NULL);
INSERT INTO public.roles VALUES (37, NULL);
INSERT INTO public.roles VALUES (38, NULL);
INSERT INTO public.roles VALUES (39, NULL);
INSERT INTO public.roles VALUES (40, NULL);
INSERT INTO public.roles VALUES (41, NULL);
INSERT INTO public.roles VALUES (42, NULL);
INSERT INTO public.roles VALUES (43, NULL);
INSERT INTO public.roles VALUES (44, NULL);
INSERT INTO public.roles VALUES (45, NULL);
INSERT INTO public.roles VALUES (46, NULL);
INSERT INTO public.roles VALUES (47, NULL);
INSERT INTO public.roles VALUES (48, NULL);
INSERT INTO public.roles VALUES (49, NULL);
INSERT INTO public.roles VALUES (50, NULL);
INSERT INTO public.roles VALUES (51, NULL);
INSERT INTO public.roles VALUES (52, NULL);
INSERT INTO public.roles VALUES (53, NULL);
INSERT INTO public.roles VALUES (54, NULL);
INSERT INTO public.roles VALUES (55, NULL);
INSERT INTO public.roles VALUES (56, NULL);
INSERT INTO public.roles VALUES (57, NULL);
INSERT INTO public.roles VALUES (58, NULL);
INSERT INTO public.roles VALUES (59, NULL);
INSERT INTO public.roles VALUES (60, NULL);
INSERT INTO public.roles VALUES (61, NULL);
INSERT INTO public.roles VALUES (62, NULL);
INSERT INTO public.roles VALUES (63, NULL);
INSERT INTO public.roles VALUES (64, NULL);
INSERT INTO public.roles VALUES (65, NULL);
INSERT INTO public.roles VALUES (66, NULL);
INSERT INTO public.roles VALUES (67, NULL);
INSERT INTO public.roles VALUES (68, NULL);
INSERT INTO public.roles VALUES (69, NULL);
INSERT INTO public.roles VALUES (70, NULL);
INSERT INTO public.roles VALUES (71, NULL);
INSERT INTO public.roles VALUES (72, NULL);
INSERT INTO public.roles VALUES (73, NULL);
INSERT INTO public.roles VALUES (74, NULL);
INSERT INTO public.roles VALUES (75, NULL);
INSERT INTO public.roles VALUES (76, NULL);
INSERT INTO public.roles VALUES (77, NULL);
INSERT INTO public.roles VALUES (78, NULL);
INSERT INTO public.roles VALUES (79, NULL);
INSERT INTO public.roles VALUES (80, NULL);
INSERT INTO public.roles VALUES (81, NULL);
INSERT INTO public.roles VALUES (82, NULL);
INSERT INTO public.roles VALUES (83, NULL);
INSERT INTO public.roles VALUES (84, NULL);
INSERT INTO public.roles VALUES (85, NULL);
INSERT INTO public.roles VALUES (86, NULL);
INSERT INTO public.roles VALUES (87, NULL);
INSERT INTO public.roles VALUES (88, NULL);
INSERT INTO public.roles VALUES (89, NULL);
INSERT INTO public.roles VALUES (90, NULL);
INSERT INTO public.roles VALUES (91, NULL);
INSERT INTO public.roles VALUES (92, NULL);
INSERT INTO public.roles VALUES (93, NULL);
INSERT INTO public.roles VALUES (94, NULL);
INSERT INTO public.roles VALUES (95, NULL);
INSERT INTO public.roles VALUES (96, NULL);
INSERT INTO public.roles VALUES (97, NULL);
INSERT INTO public.roles VALUES (98, NULL);
INSERT INTO public.roles VALUES (99, NULL);
INSERT INTO public.roles VALUES (100, NULL);


--
-- TOC entry 3076 (class 0 OID 16618)
-- Dependencies: 200
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.service VALUES (1, 'TSH', 262.71, NULL, NULL, 619);
INSERT INTO public.service VALUES (2, 'Амилаза', 361.88, NULL, NULL, 311);
INSERT INTO public.service VALUES (3, 'Альбумин', 234.09, NULL, NULL, 548);
INSERT INTO public.service VALUES (4, 'Креатинин', 143.22, NULL, NULL, 258);
INSERT INTO public.service VALUES (5, 'Билирубин общий', 102.85, NULL, NULL, 176);
INSERT INTO public.service VALUES (6, 'Гепатит В', 176.83, NULL, NULL, 501);
INSERT INTO public.service VALUES (7, 'Гепатит С', 289.99, NULL, NULL, 543);
INSERT INTO public.service VALUES (8, 'ВИЧ', 490.77, NULL, NULL, 557);
INSERT INTO public.service VALUES (9, 'СПИД', 341.78, NULL, NULL, 229);
INSERT INTO public.service VALUES (10, 'Кальций общий', 419.9, NULL, NULL, 415);
INSERT INTO public.service VALUES (11, 'Глюкоза', 447.65, NULL, NULL, 323);
INSERT INTO public.service VALUES (12, 'Ковид IgM', 209.78, NULL, NULL, 855);
INSERT INTO public.service VALUES (13, 'Общий белок', 396.03, NULL, NULL, 346);
INSERT INTO public.service VALUES (14, 'Железо', 105.32, NULL, NULL, 836);
INSERT INTO public.service VALUES (15, 'Сифилис RPR', 443.66, NULL, NULL, 659);
INSERT INTO public.service VALUES (16, 'АТ и АГ к ВИЧ 1/2', 370.62, NULL, NULL, 797);
INSERT INTO public.service VALUES (17, 'Волчаночный антикоагулянт', 290.11, NULL, NULL, 287);


--
-- TOC entry 3085 (class 0 OID 18947)
-- Dependencies: 209
-- Data for Name: services in order; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3086 (class 0 OID 18951)
-- Dependencies: 210
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3080 (class 0 OID 17155)
-- Dependencies: 204
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES ('lraden3', '5Ydp2mz', 4, 4, '39.24.146.52', '22.06.2020');
INSERT INTO public.users VALUES ('bfollos4', 'ckmAJPQV', 5, 5, '87.232.97.3', '18.03.2020');
INSERT INTO public.users VALUES ('menterle5', '0PRom6i', 6, 6, '85.121.209.6', '04.07.2020');
INSERT INTO public.users VALUES ('srobken8', 'Cbmj3Yi', 9, 9, '12.154.73.196', '22.05.2020');
INSERT INTO public.users VALUES ('btidmas9', 'dYDHbBQfK', 10, 10, '24.42.134.21', '06.06.2020');
INSERT INTO public.users VALUES ('jfussiea', 'EGxXuLQ9', 11, 11, '98.194.112.137', '21.08.2020');
INSERT INTO public.users VALUES ('santonaccib', 'YcXAhY3Pja', 12, 12, '198.146.255.15', '03.10.2019');
INSERT INTO public.users VALUES ('nbountiffc', '5xfyjS9ZULGA', 13, 13, '231.78.246.229', '22.01.2020');
INSERT INTO public.users VALUES ('cbenjefieldd', 'tQOsP0ei9TuD', 14, 14, '88.126.93.246', '09.07.2020');
INSERT INTO public.users VALUES ('ocorbyne', 'bG1ZIzwIoU', 15, 15, '232.175.48.179', '24.04.2020');
INSERT INTO public.users VALUES ('cstickinsf', 'QRYADbgNj', 16, 16, '64.30.175.158', '20.04.2020');
INSERT INTO public.users VALUES ('dclarageg', 'Yp59ZIDnWe', 17, 17, '139.88.229.111', '09.06.2020');
INSERT INTO public.users VALUES ('jmccawleyh', 'g58zLcmCYON', 18, 18, '14.199.67.32', '20.04.2020');
INSERT INTO public.users VALUES ('dbandi', 'yFAaYuVW', 19, 19, '206.105.148.56', '02.12.2019');
INSERT INTO public.users VALUES ('abutteryj', 'ttOFbWWGtD', 20, 20, '192.158.7.138', '21.06.2020');
INSERT INTO public.users VALUES ('kkinmank', 'qUr6fdWP6L5G', 21, 21, '134.99.243.113', '08.11.2019');
INSERT INTO public.users VALUES ('sskepperl', 'jHYN0v3', 22, 22, '52.90.89.126', '28.04.2020');
INSERT INTO public.users VALUES ('ayeolandm', 'QQezRBV9', 23, 23, '239.7.55.187', '31.05.2020');
INSERT INTO public.users VALUES ('cspeedingn', 'UCLYITfw2Vo', 24, 24, '127.37.194.127', '15.11.2019');
INSERT INTO public.users VALUES ('ascarisbricko', 'fzBcv6GbyCp', 25, 25, '97.227.15.172', '19.02.2020');
INSERT INTO public.users VALUES ('mthurbyp', 'wg0uIskqei', 26, 26, '94.70.148.135', '18.09.2019');
INSERT INTO public.users VALUES ('croxbroughq', '67CVVym', 27, 27, '185.110.201.36', '11.01.2020');
INSERT INTO public.users VALUES ('pmccotterr', 'QG5tdzRpGZJ2', 28, 28, '22.179.187.229', '22.03.2020');
INSERT INTO public.users VALUES ('icallejas', 'aeDvZk8o9', 29, 29, '67.237.123.227', '19.07.2020');
INSERT INTO public.users VALUES ('nbroscht', 'DmPJt2', 30, 30, '251.1.59.65', '17.12.2019');
INSERT INTO public.users VALUES ('sallseppu', 't0ko0854Cpvv', 31, 31, '88.20.74.85', '09.08.2020');
INSERT INTO public.users VALUES ('eabbatucciv', 'gUtNdsDu', 32, 32, '52.44.134.126', '29.03.2020');
INSERT INTO public.users VALUES ('sgarnhamw', 'eml6RqbK', 33, 33, '100.17.131.54', '29.01.2020');
INSERT INTO public.users VALUES ('rkitchensidex', 'xaa7miQ7yB', 34, 34, '29.100.76.146', '14.12.2019');
INSERT INTO public.users VALUES ('udiy', 'dHqu78cU6NOP', 35, 35, '90.30.202.251', '25.12.2019');
INSERT INTO public.users VALUES ('mbeidebekez', 'F5T5spAU9A4O', 36, 36, '3.32.202.92', '05.02.2020');
INSERT INTO public.users VALUES ('bsavins10', 'l6sYf29NLN', 37, 37, '123.187.14.103', '23.01.2020');
INSERT INTO public.users VALUES ('sriby11', 'Va34LYqFh', 38, 38, '16.81.16.23', '17.06.2020');
INSERT INTO public.users VALUES ('sbirney12', 'Ggygo2ePsETs', 39, 39, '144.76.193.237', '27.12.2019');
INSERT INTO public.users VALUES ('ikleanthous13', '3H0GS7a', 40, 40, '169.108.108.88', '29.12.2019');
INSERT INTO public.users VALUES ('mskerme14', 'wy1HWA', 41, 41, '143.177.136.232', '10.02.2020');
INSERT INTO public.users VALUES ('hcahey15', 'NSXcG9khd', 42, 42, '18.127.87.158', '13.06.2020');
INSERT INTO public.users VALUES ('trusling16', 'abol9dYC8e', 43, 43, '142.216.95.251', '19.03.2020');
INSERT INTO public.users VALUES ('jde17', 'gK6Hsl8Q', 44, 44, '229.104.255.175', '17.10.2019');
INSERT INTO public.users VALUES ('fmcleoid18', 'B9zr0N7cJw', 45, 45, '90.207.38.179', '26.01.2020');
INSERT INTO public.users VALUES ('nmegainey19', 'gph7QurFf', 46, 46, '172.249.218.50', '22.05.2020');
INSERT INTO public.users VALUES ('abliven1a', 'vVxlf94KpeX', 47, 47, '49.101.94.118', '17.06.2020');
INSERT INTO public.users VALUES ('mrossoni1b', 'nLXj2lS', 48, 48, '161.5.132.42', '16.11.2019');
INSERT INTO public.users VALUES ('nredington1c', 'DCbOb1SX', 49, 49, '174.42.8.3', '06.05.2020');
INSERT INTO public.users VALUES ('lfrancie1d', 'DoGeHWuAAM', 50, 50, '182.2.128.34', '30.03.2020');
INSERT INTO public.users VALUES ('ablowin1e', 'aQygVtMjN', 51, 51, '73.212.243.168', '24.06.2020');
INSERT INTO public.users VALUES ('vgoroni1f', 'bWr0QU', 52, 52, '93.126.120.134', '19.08.2020');
INSERT INTO public.users VALUES ('sgrafom1g', 'JcNcVDAouYzA', 53, 53, '9.26.5.107', '17.12.2019');
INSERT INTO public.users VALUES ('ecollett1i', 'Y0uMyKB0W', 55, 55, '47.0.240.7', '07.10.2019');
INSERT INTO public.users VALUES ('bterrell1j', 'hswseW', 56, 56, '157.21.33.53', '25.02.2020');
INSERT INTO public.users VALUES ('bstaig1l', 'MygqEtjMtUbC', 58, 58, '171.78.28.229', '19.02.2020');
INSERT INTO public.users VALUES ('akennsley1m', 'CTUdBfJsy6qF', 59, 59, '208.81.128.179', '15.07.2020');
INSERT INTO public.users VALUES ('ebartak1n', 'y3t4H1', 60, 60, '130.247.20.138', '20.12.2019');
INSERT INTO public.users VALUES ('esavin1p', 'axnJY9s', 62, 62, '40.140.160.210', '31.01.2020');
INSERT INTO public.users VALUES ('pelsom1q', 'OXzMECG', 63, 63, '253.7.8.82', '01.01.2020');
INSERT INTO public.users VALUES ('asemaine1r', 'MdJRkHor5SP', 64, 64, '76.252.15.218', '05.10.2019');
INSERT INTO public.users VALUES ('reasson1t', '3J0jgg9RWlXs', 66, 66, '212.248.119.232', '14.08.2020');
INSERT INTO public.users VALUES ('aboleyn1u', '3q2mQdDRmtr', 67, 67, '181.14.56.184', '26.05.2020');
INSERT INTO public.users VALUES ('hscholfield1v', '1Pbs3K6qXYB', 68, 68, '15.7.205.224', '23.02.2020');
INSERT INTO public.users VALUES ('aeldon1x', 'rrywOQRmFKyh', 70, 70, '4.174.11.210', '04.12.2019');
INSERT INTO public.users VALUES ('kcollin1y', 'Q0ZV21vew0', 71, 71, '52.19.142.168', '30.06.2020');
INSERT INTO public.users VALUES ('wlound20', 'a2G4Ihh2o', 73, 73, '31.243.68.215', '26.01.2020');
INSERT INTO public.users VALUES ('mgillogley21', 'EjUHfCUFqF', 74, 74, '79.38.53.53', '01.05.2020');
INSERT INTO public.users VALUES ('dmuccino22', 'E4okVgx', 75, 75, '109.138.101.234', '02.04.2020');
INSERT INTO public.users VALUES ('gtrump24', '6XXY7IS26Ci', 77, 77, '11.191.37.17', '03.08.2020');
INSERT INTO public.users VALUES ('rleestut25', 'zq3C4rUR', 78, 78, '119.247.100.162', '11.09.2020');
INSERT INTO public.users VALUES ('janscott26', '5maCRrCZLu', 79, 79, '104.85.178.46', '28.04.2020');
INSERT INTO public.users VALUES ('cossenna28', 'vfKJkCeohOzZ', 81, 81, '230.85.180.186', '06.01.2020');
INSERT INTO public.users VALUES ('hizzat29', 'Uifdtu', 82, 82, '143.246.125.169', '20.01.2020');
INSERT INTO public.users VALUES ('egimeno2a', 'oF1hbmKlZ', 83, 83, '60.57.115.125', '18.03.2020');
INSERT INTO public.users VALUES ('sfierro2b', 'VjUrQ2', 84, 84, '250.233.247.215', '22.01.2020');
INSERT INTO public.users VALUES ('bpattenden2d', 'IOUkHpOn', 86, 86, '45.121.26.90', '15.06.2020');
INSERT INTO public.users VALUES ('acockman2e', 'fDKhK7OK', 87, 87, '167.9.255.77', '06.01.2020');
INSERT INTO public.users VALUES ('sleblanc2g', 'T2et1U5M', 89, 89, '118.164.120.202', '16.06.2020');
INSERT INTO public.users VALUES ('gciccoloi2h', 'w4dZ3hxiCiAg', 90, 90, '71.235.27.27', '03.02.2020');
INSERT INTO public.users VALUES ('ssayburn2i', '1hTM7EVKaS', 91, 91, '75.194.92.114', '24.01.2020');
INSERT INTO public.users VALUES ('rwestall2k', 'xLgunbO9x6', 93, 93, '212.150.81.93', '02.02.2020');
INSERT INTO public.users VALUES ('ckulic2l', 'FLHYRN', 94, 94, '154.121.193.131', '26.06.2020');
INSERT INTO public.users VALUES ('lroux2m', '98cCxHeeK31', 95, 95, '229.187.60.106', '12.06.2020');
INSERT INTO public.users VALUES ('sellgood2o', '3do5MME', 97, 97, '199.226.26.7', '31.08.2020');
INSERT INTO public.users VALUES ('bretchless2p', 'WraGihh', 98, 98, '86.66.23.203', '09.11.2019');
INSERT INTO public.users VALUES ('rjerzak2q', 'hAp8jki', 99, 99, '205.158.144.210', '11.12.2019');
INSERT INTO public.users VALUES ('vboots2r', 'bgJfSDEVEQm6', 100, 100, '91.73.40.29', '07.09.2020');
INSERT INTO public.users VALUES ('chacking0', '4tzqHdkqzo4', 1, 1, '147.231.50.234', '10.02.2020');
INSERT INTO public.users VALUES ('nmably1', 'ukM0e6', 2, 2, '22.32.15.211', '20.06.2020');
INSERT INTO public.users VALUES ('frolf2', '7QpCwac0yi', 3, 3, '113.92.142.29', '19.05.2020');
INSERT INTO public.users VALUES ('mpeaker6', '0Tc5oRc', 7, 7, '196.39.132.128', '03.09.2020');
INSERT INTO public.users VALUES ('mrobichon7', 'LEwEjMlmE5X', 8, 8, '143.159.207.105', '31.08.2020');
INSERT INTO public.users VALUES ('jgianneschi1h', 'oieX5u3sUfpD', 54, 54, '139.241.156.87', '14.03.2020');
INSERT INTO public.users VALUES ('dbifield1k', 'oYAQ4URihIA', 57, 57, '24.185.229.169', '29.07.2020');
INSERT INTO public.users VALUES ('vwillshire1o', 'VFSLc2t', 61, 61, '243.230.165.161', '03.09.2020');
INSERT INTO public.users VALUES ('cnorthrop1s', 'UIwCvTA7MRS0', 65, 65, '119.130.24.85', '12.10.2019');
INSERT INTO public.users VALUES ('ccowpe1w', 'VHr417Ft0', 69, 69, '237.236.173.63', '17.06.2020');
INSERT INTO public.users VALUES ('ilarkins1z', 'DEFNpHtU', 72, 72, '3.26.42.188', '05.12.2019');
INSERT INTO public.users VALUES ('jleadbetter23', 'ZNsaKdgb', 76, 76, '51.245.190.167', '02.05.2020');
INSERT INTO public.users VALUES ('bdouch27', 'KAkwrli', 80, 80, '72.132.101.188', '06.02.2020');
INSERT INTO public.users VALUES ('ntroup2c', 'KmDDYf1Pu', 85, 85, '121.7.142.165', '25.06.2020');
INSERT INTO public.users VALUES ('mhanscome2f', 'xBHzpa7eP0u', 88, 88, '121.181.10.230', '10.07.2020');
INSERT INTO public.users VALUES ('wgentiry2j', 'z2X9UH5', 92, 92, '188.49.78.185', '10.04.2020');
INSERT INTO public.users VALUES ('mrolinson2n', 'faGzyW8hEca', 96, 96, '9.203.185.188', '30.10.2019');


--
-- TOC entry 3081 (class 0 OID 17166)
-- Dependencies: 205
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2915 (class 2606 OID 18623)
-- Name: accountant accountant_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accountant
    ADD CONSTRAINT accountant_pk PRIMARY KEY (id_accountant);


--
-- TOC entry 2917 (class 2606 OID 20591)
-- Name: bill bill_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pk PRIMARY KEY (id_bill);


--
-- TOC entry 2929 (class 2606 OID 20573)
-- Name: completed service completed_service_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."completed service"
    ADD CONSTRAINT completed_service_pk PRIMARY KEY (id_comp_serv);


--
-- TOC entry 2907 (class 2606 OID 20595)
-- Name: insurance company insurance_company_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."insurance company"
    ADD CONSTRAINT insurance_company_pk PRIMARY KEY (id_ins_comp);


--
-- TOC entry 2927 (class 2606 OID 20673)
-- Name: insurance insurance_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance
    ADD CONSTRAINT insurance_pk PRIMARY KEY (id_ins);


--
-- TOC entry 2925 (class 2606 OID 20666)
-- Name: insurance type insurance_type_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."insurance type"
    ADD CONSTRAINT insurance_type_pk PRIMARY KEY (id_ins_type);


--
-- TOC entry 2909 (class 2606 OID 18572)
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id_order);


--
-- TOC entry 2905 (class 2606 OID 18594)
-- Name: patient patient_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pk PRIMARY KEY (id_patient);


--
-- TOC entry 2919 (class 2606 OID 18673)
-- Name: roles roles_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id_role);


--
-- TOC entry 2903 (class 2606 OID 18608)
-- Name: service service_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pk PRIMARY KEY (id_service);


--
-- TOC entry 2921 (class 2606 OID 20571)
-- Name: services in order services_in_order_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."services in order"
    ADD CONSTRAINT services_in_order_pk PRIMARY KEY (id_serv_ord);


--
-- TOC entry 2923 (class 2606 OID 20637)
-- Name: status status_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pk PRIMARY KEY (id_status);


--
-- TOC entry 2911 (class 2606 OID 18577)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id_user);


--
-- TOC entry 2913 (class 2606 OID 18616)
-- Name: workers workers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pk PRIMARY KEY (id_worker);


--
-- TOC entry 2935 (class 2606 OID 20579)
-- Name: accountant accountant_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accountant
    ADD CONSTRAINT accountant_fk FOREIGN KEY (id_user) REFERENCES public.users(id_user);


--
-- TOC entry 2936 (class 2606 OID 20603)
-- Name: bill bill_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_fk FOREIGN KEY (id_ins_comp) REFERENCES public."insurance company"(id_ins_comp);


--
-- TOC entry 2937 (class 2606 OID 20621)
-- Name: bill bill_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_fk1 FOREIGN KEY (id_accountant) REFERENCES public.accountant(id_accountant);


--
-- TOC entry 2938 (class 2606 OID 20631)
-- Name: bill bill_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_fk2 FOREIGN KEY (id_comp_serv) REFERENCES public."completed service"(id_comp_serv);


--
-- TOC entry 2943 (class 2606 OID 20574)
-- Name: completed service completed_service_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."completed service"
    ADD CONSTRAINT completed_service_fk FOREIGN KEY (id_serv_order) REFERENCES public."services in order"(id_serv_ord);


--
-- TOC entry 2944 (class 2606 OID 20771)
-- Name: completed service completed_service_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."completed service"
    ADD CONSTRAINT completed_service_fk1 FOREIGN KEY (id_worker) REFERENCES public.workers(id_worker);


--
-- TOC entry 2945 (class 2606 OID 20776)
-- Name: completed service completed_service_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."completed service"
    ADD CONSTRAINT completed_service_fk2 FOREIGN KEY (id_service) REFERENCES public.service(id_service);


--
-- TOC entry 2940 (class 2606 OID 20679)
-- Name: insurance insurance_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance
    ADD CONSTRAINT insurance_fk FOREIGN KEY (id_ins_type) REFERENCES public."insurance type"(id_ins_type);


--
-- TOC entry 2941 (class 2606 OID 20689)
-- Name: insurance insurance_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance
    ADD CONSTRAINT insurance_fk1 FOREIGN KEY (id_ins_comp) REFERENCES public."insurance company"(id_ins_comp);


--
-- TOC entry 2942 (class 2606 OID 20766)
-- Name: insurance insurance_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insurance
    ADD CONSTRAINT insurance_fk2 FOREIGN KEY (id_patient) REFERENCES public.patient(id_patient);


--
-- TOC entry 2931 (class 2606 OID 20638)
-- Name: order order_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_fk FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- TOC entry 2932 (class 2606 OID 20643)
-- Name: order order_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_fk_1 FOREIGN KEY (id_order) REFERENCES public."services in order"(id_serv_ord);


--
-- TOC entry 2930 (class 2606 OID 20694)
-- Name: patient patient_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_fk FOREIGN KEY (id_user) REFERENCES public.users(id_user);


--
-- TOC entry 2939 (class 2606 OID 20648)
-- Name: services in order services_in_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."services in order"
    ADD CONSTRAINT services_in_order_fk FOREIGN KEY (id_status) REFERENCES public.status(id_status);


--
-- TOC entry 2933 (class 2606 OID 20660)
-- Name: users users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk FOREIGN KEY (id_role) REFERENCES public.roles(id_role);


--
-- TOC entry 2934 (class 2606 OID 20709)
-- Name: workers workers_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_fk FOREIGN KEY (id_user) REFERENCES public.users(id_user);


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 3095
-- Name: DATABASE user27; Type: ACL; Schema: -; Owner: -
--

REVOKE CONNECT,TEMPORARY ON DATABASE user27 FROM PUBLIC;
GRANT ALL ON DATABASE user27 TO user27;


-- Completed on 2022-10-15 14:20:18

--
-- PostgreSQL database dump complete
--

