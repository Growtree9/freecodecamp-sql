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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    qtd_planets integer NOT NULL,
    qtd_asteroids integer,
    has_sun boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    size integer,
    qtd_holes integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean,
    star_id integer NOT NULL,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    start_lightning_scale numeric(3,2),
    qtd_start_description text,
    part_of_constelation boolean NOT NULL,
    planet_id integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(255) NOT NULL,
    tempeture integer
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 10, 50, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 10, 50, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 10, 50, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 10, 50, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (7, 'galaxy7', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (8, 'galaxy8', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (9, 'galaxy9', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (10, 'galaxy10', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (11, 'galaxy11', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (12, 'galaxy12', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (13, 'galaxy13', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (14, 'galaxy14', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (15, 'galaxy15', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (16, 'galaxy16', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (17, 'galaxy17', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (18, 'galaxy18', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (19, 'galaxy19', 11, 20, NULL);
INSERT INTO public.galaxy VALUES (20, 'galaxy20', 11, 20, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 17, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'moon2', 200, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'moon3', 140, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'moon4', 17, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'moon5', 200, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'moon6', 140, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'moon7', 140, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'moon8', 140, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'moon9', 140, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'moon10', 140, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'moon11', 17, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'moon12', 200, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'moon13', 140, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'moon14', 140, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'moon15', 140, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'moon16', 140, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'moon17', 140, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'moon18', 17, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'moon19', 200, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'moon20', 140, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'planet2', true, 2, NULL);
INSERT INTO public.planet VALUES (3, 'planet3', true, 3, NULL);
INSERT INTO public.planet VALUES (4, 'planet4', true, 4, NULL);
INSERT INTO public.planet VALUES (5, 'planet5', true, 5, NULL);
INSERT INTO public.planet VALUES (6, 'planet6', true, 6, NULL);
INSERT INTO public.planet VALUES (7, 'planet7', true, 7, NULL);
INSERT INTO public.planet VALUES (8, 'planet8', true, 8, NULL);
INSERT INTO public.planet VALUES (9, 'planet9', true, 9, NULL);
INSERT INTO public.planet VALUES (10, 'planet10', true, 10, NULL);
INSERT INTO public.planet VALUES (11, 'planet11', true, 11, NULL);
INSERT INTO public.planet VALUES (12, 'planet12', true, 12, NULL);
INSERT INTO public.planet VALUES (13, 'planet13', true, 13, NULL);
INSERT INTO public.planet VALUES (14, 'planet14', true, 14, NULL);
INSERT INTO public.planet VALUES (15, 'planet15', true, 15, NULL);
INSERT INTO public.planet VALUES (16, 'planet16', true, 16, NULL);
INSERT INTO public.planet VALUES (17, 'planet17', true, 17, NULL);
INSERT INTO public.planet VALUES (18, 'planet18', true, 18, NULL);
INSERT INTO public.planet VALUES (19, 'planet19', true, 19, NULL);
INSERT INTO public.planet VALUES (20, 'planet20', true, 20, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 9.09, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (2, 'star2', 9.09, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (3, 'star3', 9.09, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (4, 'star4', 9.09, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (5, 'star5', 5.99, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (6, 'star6', 3.99, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (7, 'star7', 3.59, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (8, 'star8', 3.56, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (9, 'star9', 1.56, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (10, 'star10', 4.26, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (11, 'star11', 4.26, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (12, 'star12', 4.26, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (13, 'star13', 4.26, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (14, 'star14', 6.53, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (15, 'star15', 3.13, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (16, 'star16', 8.38, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (17, 'star17', 9.38, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (18, 'star18', 2.32, 'something', false, NULL, NULL);
INSERT INTO public.star VALUES (19, 'star19', 2.32, 'something', true, NULL, NULL);
INSERT INTO public.star VALUES (20, 'star20', 2.32, 'something', true, NULL, NULL);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'sun1', 100);
INSERT INTO public.sun VALUES (2, 'sun2', 100);
INSERT INTO public.sun VALUES (3, 'sun3', 100);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 20, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 20, true);


--
-- Name: sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy my_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT my_unique_constraint UNIQUE (name);


--
-- Name: moon my_unique_constraint_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT my_unique_constraint_moon UNIQUE (name);


--
-- Name: planet my_unique_constraint_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT my_unique_constraint_planet UNIQUE (name);


--
-- Name: star my_unique_constraint_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT my_unique_constraint_star UNIQUE (name);


--
-- Name: sun my_unique_constraint_sun; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT my_unique_constraint_sun UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

