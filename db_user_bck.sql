--
-- PostgreSQL database dump
--

\restrict hMj5gnkUE0BRUSf8BOM3yvg6EbwTD9jjwmCOGpflt3fSBAGQRSRFKBW0fR8HECu

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email public.citext NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    last_login_at timestamp with time zone,
    is_owner boolean DEFAULT false NOT NULL,
    CONSTRAINT chk_users_status CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'suspended'::character varying, 'blocked'::character varying, 'deleted'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: uq_users_single_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_users_single_owner ON public.users USING btree (is_owner) WHERE is_owner;


--
-- PostgreSQL database dump complete
--

\unrestrict hMj5gnkUE0BRUSf8BOM3yvg6EbwTD9jjwmCOGpflt3fSBAGQRSRFKBW0fR8HECu

--
-- PostgreSQL database dump
--

\restrict GQITke1tcnEMapm6uB7qMqbQufegpMc6Jk8e5yiOW1ur8HSZcj7HKHhB7V6vzzl

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, status, created_at, last_login_at, is_owner) FROM stdin;
c93e3cf7-05ff-48ec-a33e-9b9fb55af14b	mahalakshmi.conc.suppliers.owner@gmail.com	active	2026-10-07 10:12:09.548425+05:30	\N	t
cdc9df4a-b195-401d-90ff-099532c0b3aa	mahalakshmi.conc.suppliers.user@gmail.com	active	2026-11-13 16:30:16.4614+05:30	\N	f
\.


--
-- PostgreSQL database dump complete
--

\unrestrict GQITke1tcnEMapm6uB7qMqbQufegpMc6Jk8e5yiOW1ur8HSZcj7HKHhB7V6vzzl

