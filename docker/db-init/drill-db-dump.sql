--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 16.2

-- Started on 2024-08-21 17:26:25

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
-- TOC entry 6 (class 2615 OID 16384)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: api_key; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.api_key (
    id integer NOT NULL,
    user_id integer NOT NULL,
    description character varying(200) NOT NULL,
    api_key_hash character varying(100) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE auth.api_key OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16403)
-- Name: api_key_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.api_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.api_key_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 214
-- Name: api_key_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.api_key_id_seq OWNED BY auth.api_key.id;


--
-- TOC entry 211 (class 1259 OID 16385)
-- Name: flyway_schema_history; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE auth.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16395)
-- Name: user; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth."user" (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password_hash character varying(100),
    role character varying(20) NOT NULL,
    blocked boolean DEFAULT false NOT NULL,
    registration_date timestamp without time zone
);


ALTER TABLE auth."user" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16394)
-- Name: user_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.user_id_seq OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.user_id_seq OWNED BY auth."user".id;


--
-- TOC entry 3221 (class 2604 OID 16407)
-- Name: api_key id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.api_key ALTER COLUMN id SET DEFAULT nextval('auth.api_key_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16398)
-- Name: user id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth."user" ALTER COLUMN id SET DEFAULT nextval('auth.user_id_seq'::regclass);


--
-- TOC entry 3375 (class 0 OID 16404)
-- Dependencies: 215
-- Data for Name: api_key; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.api_key (id, user_id, description, api_key_hash, expires_at, created_at) FROM stdin;
1	1	agent api key	$2a$10$kZrQlCvy2QrteR.eWFGlK.dGwMjRiGsYjJHB0Hz/j7vBGDt2aXVBy	2027-06-18 12:43:09.275274	2026-06-18 12:43:09.275296
\.


--
-- TOC entry 3371 (class 0 OID 16385)
-- Dependencies: 211
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"auth"	\N	postgres	2024-08-21 13:23:52.178538	0	t
1	1	Auth schema init	SQL	V1__Auth_schema_init.sql	935441267	postgres	2024-08-21 13:23:52.208297	14	t
2	2	Api keys init	SQL	V2__Api_keys_init.sql	-296870509	postgres	2024-08-21 13:23:52.234981	8	t
\.


--
-- TOC entry 3373 (class 0 OID 16395)
-- Dependencies: 213
-- Data for Name: user; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth."user" (id, username, password_hash, role, blocked, registration_date) FROM stdin;
1	admin	$2a$10$Aach5gd4gTGUFXemUEtA/OT2i7bveGi9af1n5xqDqSjWmeZ7I27oe	ADMIN	f	2024-08-21 13:23:52.208297
2	user	$2a$10$cnuotKyF9YlzChdEEuLLfeCstYkH7C65zbVX1VHmABPKp4S8lmG1C	USER	f	2024-08-21 13:23:52.208297
\.


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 214
-- Name: api_key_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.api_key_id_seq', 1, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.user_id_seq', 2, true);


--
-- TOC entry 3229 (class 2606 OID 16409)
-- Name: api_key api_key_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.api_key
    ADD CONSTRAINT api_key_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 16392)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 3226 (class 2606 OID 16401)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 1259 OID 16415)
-- Name: api_key_user_id_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX api_key_user_id_idx ON auth.api_key USING btree (user_id);


--
-- TOC entry 3224 (class 1259 OID 16393)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON auth.flyway_schema_history USING btree (success);


--
-- TOC entry 3227 (class 1259 OID 16402)
-- Name: user_username_idx; Type: INDEX; Schema: auth; Owner: postgres
--

CREATE UNIQUE INDEX user_username_idx ON auth."user" USING btree (lower((username)::text));


--
-- TOC entry 3231 (class 2606 OID 16410)
-- Name: api_key api_key_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.api_key
    ADD CONSTRAINT api_key_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth."user"(id) ON DELETE CASCADE;


-- Completed on 2024-08-21 17:26:25

--
-- PostgreSQL database dump complete
--

