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
\ connect universe
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
    name character varying(40) NOT NULL,
    number_of_stars integer NOT NULL,
    number_of_planets integer NOT NULL,
    size_in_light_years integer NOT NULL
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;
--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40),
    rings boolean,
    color character varying(7),
    size_in_km numeric
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    star_id integer NOT NULL,
    name character varying(40),
    number_of_moons integer,
    inhabitable boolean
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_planets integer NOT NULL,
    color text,
    size_in_km numeric
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_classification; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star_classification (
    star_classification_id integer NOT NULL,
    name character varying(10) NOT NULL,
    temp_range_in_kelvin integer
);
ALTER TABLE public.star_classification OWNER TO freecodecamp;
--
-- Name: star_clasification_star_clasification_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_clasification_star_clasification_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_clasification_star_clasification_id_seq OWNER TO freecodecamp;
--
-- Name: star_clasification_star_clasification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_clasification_star_clasification_id_seq OWNED BY public.star_classification.star_classification_id;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Name: star_classification star_classification_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star_classification
ALTER COLUMN star_classification_id
SET DEFAULT nextval(
        'public.star_clasification_star_clasification_id_seq'::regclass
    );
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.galaxy
VALUES (1, 'Milky Way', 400, 900, 50000);
INSERT INTO public.galaxy
VALUES (2, 'Andromeda', 800, 1600, 10000);
INSERT INTO public.galaxy
VALUES (3, 'Stellaris', 100, 200, 4000);
INSERT INTO public.galaxy
VALUES (4, 'Venezuela', 150, 500, 7000);
INSERT INTO public.galaxy
VALUES (5, 'Universala', 500, 900, 8000);
INSERT INTO public.galaxy
VALUES (6, 'Planar', 5, 900, 5000);
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.moon
VALUES (1, 1, 'Moon', false, 'Gray', 75000);
INSERT INTO public.moon
VALUES (2, 2, 'AE', true, 'Purple', 100000);
INSERT INTO public.moon
VALUES (3, 3, 'Sus', true, 'Pink', 69000);
INSERT INTO public.moon
VALUES (4, 4, 'Anomaly', true, 'Green', 50000);
INSERT INTO public.moon
VALUES (5, 5, 'SOCRAM', false, 'Brown', 30000);
INSERT INTO public.moon
VALUES (6, 6, 'Oma', false, 'Grey', 55000);
INSERT INTO public.moon
VALUES (7, 7, 'MagicMoon', false, 'SeeThru', 0);
INSERT INTO public.moon
VALUES (8, 8, 'Phobos', false, 'Beige', 17);
INSERT INTO public.moon
VALUES (9, 8, 'Deimos', false, 'Brown
', 22);
INSERT INTO public.moon
VALUES (10, 9, 'Nuclea', true, 'Blue', 900);
INSERT INTO public.moon
VALUES (11, 10, 'Buff', false, 'Orange', 4000);
INSERT INTO public.moon
VALUES (12, 11, 'AEU', true, 'Red', 60000);
INSERT INTO public.moon
VALUES (13, 12, 'Daedra', false, 'Black', 5000);
INSERT INTO public.moon
VALUES (14, 12, 'Chitin', true, 'Beige', 10000);
INSERT INTO public.moon
VALUES (15, 10, 'Golde', false, 'Yellow', 40000);
INSERT INTO public.moon
VALUES (16, 10, 'PeiWei', false, 'Red', 65500);
INSERT INTO public.moon
VALUES (17, 6, 'Sheogorath', true, 'Purple
', 99000);
INSERT INTO public.moon
VALUES (18, 6, 'Aela', false, 'Green', 403);
INSERT INTO public.moon
VALUES (19, 5, 'STANDURK', true, 'White', 500000);
INSERT INTO public.moon
VALUES (20, 4, 'Ak47', false, 'Grey', 300000);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.planet
VALUES (1, 1, 'Earth', 1, true);
INSERT INTO public.planet
VALUES (2, 2, 'AEX', 4, false);
INSERT INTO public.planet
VALUES (3, 3, 'SHeSh', 9, false);
INSERT INTO public.planet
VALUES (4, 4, 'Stalker', 20, true);
INSERT INTO public.planet
VALUES (5, 5, 'UNBREK', 3, false);
INSERT INTO public.planet
VALUES (6, 6, 'Suma', 100, true);
INSERT INTO public.planet
VALUES (7, 1, 'Mercury', 0, false);
INSERT INTO public.planet
VALUES (8, 1, 'Mars', 2, true);
INSERT INTO public.planet
VALUES (9, 4, 'Pripyat', 1, false);
INSERT INTO public.planet
VALUES (10, 2, 'POC', 3, false);
INSERT INTO public.planet
VALUES (11, 2, 'EUO', 7, false);
INSERT INTO public.planet
VALUES (12, 6, 'Umbra', 5, true);
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.star
VALUES (1, 1, 'The Sun', 8, 'Yellow', 695000);
INSERT INTO public.star
VALUES (2, 2, 'Polaris', 3, 'Red', 500000);
INSERT INTO public.star
VALUES (3, 3, 'Stellar', 80, 'Blue', 1000000);
INSERT INTO public.star
VALUES (4, 4, 'Rusta', 7, 'Red', 800000);
INSERT INTO public.star
VALUES (6, 6, 'Oela', 150, 'Blue', 1200000);
INSERT INTO public.star
VALUES (5, 5, 'Tightus', 1, 'Yellow', 300000);
--
-- Data for Name: star_classification; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.star_classification
VALUES (1, 'Blue', 45000);
INSERT INTO public.star_classification
VALUES (2, 'White', 15000);
INSERT INTO public.star_classification
VALUES (3, 'Yellow', 5500);
INSERT INTO public.star_classification
VALUES (4, 'Orange', 4000);
INSERT INTO public.star_classification
VALUES (5, 'Red', 2500);
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);
--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);
--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);
--
-- Name: star_clasification_star_clasification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval(
        'public.star_clasification_star_clasification_id_seq',
        5,
        true
    );
--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);
--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_name_key UNIQUE (name);
--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_name_key UNIQUE (name);
--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);
--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_name_key UNIQUE (name);
--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);
--
-- Name: star_classification star_clasification_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star_classification
ADD CONSTRAINT star_clasification_name_key UNIQUE (name);
--
-- Name: star_classification star_clasification_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star_classification
ADD CONSTRAINT star_clasification_pkey PRIMARY KEY (star_classification_id);
--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_name_key UNIQUE (name);
--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);
--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
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
-- PostgreSQL database dump complete
--