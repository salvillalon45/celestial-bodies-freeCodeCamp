--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    type character varying(255) NOT NULL,
    distance_from_earth double precision,
    description text,
    number_of_stars integer
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
    name character varying(255) NOT NULL,
    distance_from_earth double precision,
    mass double precision,
    has_atmosphere boolean,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean,
    number_of_moons integer,
    mass numeric,
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    age_in_millions_of_years double precision,
    mass double precision,
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'The galaxy that contains our Solar System.', 25);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 'The nearest spiral galaxy to the Milky Way, on a collision course with it.', 10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 'The third-largest member of the Local Group of galaxies.', 40);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 'Famous for its clearly defined spiral arms.', 10);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, 'Notable for its bright nucleus and large central bulge.', 80);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', 500000000, 'A ring galaxy created by a collision between two galaxies.', 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 0.0123, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376, 1e-08, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23458, 2e-08, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 628736, 0.015, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 628876, 0.008, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 0.025, true, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 0.018, false, 4);
INSERT INTO public.moon VALUES (8, 'Proxima Moon', 4048800, 0.0001, false, 5);
INSERT INTO public.moon VALUES (9, 'Sirius Moon', 5360000, 0.0003, false, 6);
INSERT INTO public.moon VALUES (10, 'Betelgeuse I Moon 1', 640000, 0.0005, false, 7);
INSERT INTO public.moon VALUES (11, 'Betelgeuse I Moon 2', 750000, 0.0002, false, 7);
INSERT INTO public.moon VALUES (12, 'Betelgeuse II Moon 1', 830000, 0.001, true, 8);
INSERT INTO public.moon VALUES (13, 'Betelgeuse II Moon 2', 910000, 0.0007, false, 8);
INSERT INTO public.moon VALUES (14, 'Rigel I Moon 1', 1200000, 0.002, true, 9);
INSERT INTO public.moon VALUES (15, 'Rigel I Moon 2', 1350000, 0.0015, false, 9);
INSERT INTO public.moon VALUES (16, 'Rigel II Moon 1', 1420000, 0.0025, true, 10);
INSERT INTO public.moon VALUES (17, 'Rigel II Moon 2', 1530000, 0.003, false, 10);
INSERT INTO public.moon VALUES (18, 'Vega I Moon 1', 800000, 0.001, false, 11);
INSERT INTO public.moon VALUES (19, 'Vega II Moon 1', 950000, 0.0009, true, 12);
INSERT INTO public.moon VALUES (20, 'Vega II Moon 2', 1050000, 0.0007, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 1.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 2, 0.107, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 0, 0.815, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 79, 317.8, 1);
INSERT INTO public.planet VALUES (5, 'Proxima b', false, 0, 1.27, 3);
INSERT INTO public.planet VALUES (6, 'Sirius b', false, 0, 1.02, 2);
INSERT INTO public.planet VALUES (7, 'Betelgeuse I', false, 10, 320.5, 4);
INSERT INTO public.planet VALUES (8, 'Betelgeuse II', false, 8, 215.7, 4);
INSERT INTO public.planet VALUES (9, 'Rigel I', false, 4, 230.6, 5);
INSERT INTO public.planet VALUES (10, 'Rigel II', false, 5, 180.2, 5);
INSERT INTO public.planet VALUES (11, 'Vega I', false, 3, 1.5, 6);
INSERT INTO public.planet VALUES (12, 'Vega II', false, 0, 0.9, 6);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Apollo 11', 'The first crewed mission to land on the Moon in 1969.');
INSERT INTO public.spacecraft VALUES (2, 'Voyager 1', 'The farthest human-made object from Earth, launched in 1977 to study the outer planets.');
INSERT INTO public.spacecraft VALUES (3, 'Hubble Space Telescope', 'A space telescope launched in 1990, providing deep-space imagery.');
INSERT INTO public.spacecraft VALUES (4, 'Mars Rover Curiosity', 'A car-sized rover designed to explore the Gale Crater on Mars, landed in 2012.');
INSERT INTO public.spacecraft VALUES (5, 'International Space Station (ISS)', 'A habitable space station that serves as a microgravity research laboratory, launched in 1998.');
INSERT INTO public.spacecraft VALUES (6, 'Space Shuttle Endeavour', 'One of NASA space shuttles, completed its first flight in 1992 and retired in 2011.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 4600, 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'White Dwarf', 242, 2.02, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red Dwarf', 4850, 0.122, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', 8000, 20, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue Supergiant', 8000, 21, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'White Dwarf', 455, 2.1, 3);


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
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 6, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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

