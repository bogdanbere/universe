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
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    age_in_millions numeric(6,1),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    age_in_millions numeric(6,1),
    description text,
    thats_no_moon boolean,
    planet_id integer
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
-- Name: moon_orbits_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_orbits_planet (
    moon_orbits_planet_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.moon_orbits_planet OWNER TO freecodecamp;

--
-- Name: moon_orbits_planet_moon_orbits_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_orbits_planet_moon_orbits_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_orbits_planet_moon_orbits_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_orbits_planet_moon_orbits_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_orbits_planet_moon_orbits_planet_id_seq OWNED BY public.moon_orbits_planet.moon_orbits_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    age_in_millions numeric(6,1),
    description text,
    has_water boolean,
    has_moon boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    age_in_millions numeric(6,1),
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_orbits_planet moon_orbits_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_orbits_planet ALTER COLUMN moon_orbits_planet_id SET DEFAULT nextval('public.moon_orbits_planet_moon_orbits_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 100000, 13000.6, 'We live here');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 200000, 10000.0, 'Test description');
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf', 5000, 240.0, NULL);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1', 75000, 10000.0, NULL);
INSERT INTO public.galaxy VALUES (7, 'Magellanic Clouds', 14000, 25.0, NULL);
INSERT INTO public.galaxy VALUES (8, 'Triangulum', 1500, 3.5, 'Triangle shaped');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1740, 4600.0, 'Earths moon', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22533, 4600.0, NULL, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4600.0, NULL, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 4600.0, NULL, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820, 4600.0, NULL, false, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643, 4600.0, NULL, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3121, 4600.0, NULL, false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 167, 4600.0, NULL, false, 5);
INSERT INTO public.moon VALUES (9, 'Thebe', 98, 4600.0, NULL, false, 5);
INSERT INTO public.moon VALUES (10, 'Titan', 5149, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 1527, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 1469, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 1122, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 1062, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', 504, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 396, 4600.0, NULL, false, 6);
INSERT INTO public.moon VALUES (17, 'Oberon', 1522, 4600.0, NULL, false, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1169, 4600.0, NULL, false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 2706, 4600.0, NULL, false, 7);
INSERT INTO public.moon VALUES (20, 'Charon', 1212, 4600.0, NULL, false, 9);


--
-- Data for Name: moon_orbits_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_orbits_planet VALUES (1, 3, 1, NULL);
INSERT INTO public.moon_orbits_planet VALUES (2, 2, 4, NULL);
INSERT INTO public.moon_orbits_planet VALUES (3, 4, 5, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439, 4600.0, NULL, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 7520, 4600.0, NULL, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 4600.0, 'Here be humans', true, true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, 4600.0, NULL, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 4600.0, NULL, true, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 4600.0, 'Someone liked it and put a ring on it', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 4600.0, 'Haha', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, 4600.0, 'Ice giant', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 1151, 4600.0, NULL, true, true, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 476, 4600.0, NULL, true, false, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 715, 4600.0, NULL, true, true, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 620, 4600.0, NULL, true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, 5000.0, NULL, 3);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 247.0, 'Brightest star', 3);
INSERT INTO public.star VALUES (3, 'Sirius B', 12000, 230.0, NULL, 3);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 1, 60000.0, NULL, 4);
INSERT INTO public.star VALUES (5, 'Atakorata', 787, 3000.6, NULL, 5);
INSERT INTO public.star VALUES (6, 'Alpha Trianguli', 3, 1.6, NULL, 8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_orbits_planet_moon_orbits_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_orbits_planet_moon_orbits_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon_orbits_planet moon_orbits_planet_moon_orbits_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_orbits_planet
    ADD CONSTRAINT moon_orbits_planet_moon_orbits_planet_id_key UNIQUE (moon_orbits_planet_id);


--
-- Name: moon_orbits_planet moon_orbits_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_orbits_planet
    ADD CONSTRAINT moon_orbits_planet_pkey PRIMARY KEY (moon_orbits_planet_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_orbits_planet moon_orbits_planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_orbits_planet
    ADD CONSTRAINT moon_orbits_planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_orbits_planet moon_orbits_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_orbits_planet
    ADD CONSTRAINT moon_orbits_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
