--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22),
    games_played integer,
    best_game integer,
    user_id integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_user_id_seq OWNED BY public.number_guess.user_id;


--
-- Name: number_guess user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN user_id SET DEFAULT nextval('public.number_guess_user_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1692291517331', 1, 941, 3);
INSERT INTO public.number_guess VALUES ('user_1692291517330', 1, 264, 4);
INSERT INTO public.number_guess VALUES ('Tom', 13, 5, 1);
INSERT INTO public.number_guess VALUES ('user_1692291919405', 2, 659, 6);
INSERT INTO public.number_guess VALUES ('user_1692291919406', 5, 1, 5);
INSERT INTO public.number_guess VALUES ('user_1692291959186', 2, 94, 8);
INSERT INTO public.number_guess VALUES ('user_1692291959187', 5, 1, 7);
INSERT INTO public.number_guess VALUES ('Harry', 4, 8, 2);
INSERT INTO public.number_guess VALUES ('user_1692292115878', 2, 116, 10);
INSERT INTO public.number_guess VALUES ('user_1692292115879', 5, 1, 9);
INSERT INTO public.number_guess VALUES ('Nick', 1, 10, 11);
INSERT INTO public.number_guess VALUES ('Bob', 1, 9, 12);
INSERT INTO public.number_guess VALUES ('Shaq', 1, 9, 13);
INSERT INTO public.number_guess VALUES ('Cody', 1, 13, 14);
INSERT INTO public.number_guess VALUES ('user_1692292824107', 2, 102, 16);
INSERT INTO public.number_guess VALUES ('user_1692292824108', 5, 399, 15);


--
-- Name: number_guess_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_user_id_seq', 16, true);


--
-- Name: number_guess number_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

