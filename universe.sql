--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(40) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_life boolean NOT NULL,
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    distance_from_earth numeric(12,2),
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    number_of_moons integer,
    distance_from_earth numeric(12,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    is_spherical boolean NOT NULL,
    description text
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13600, 0.00, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, false, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2.73, false, 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 23.00, false, 'Interacting grand-design spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 9000, 29.30, false, 'Bright nucleus and dust lane');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 200, 500.00, false, 'Result of a galactic collision');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 0.00, true, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.52, false, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 0.52, false, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 4.20, true, 'Most volcanic body in the solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 4.20, true, 'Icy moon with subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 4.20, true, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 4.20, true, 'Heavily cratered moon');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 4.20, false, 'Irregular inner moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, 8.52, true, 'Has a thick atmosphere');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, 8.52, true, 'Ice geysers');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, 8.52, true, 'Has a giant crater');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, 8.52, true, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1123, 8.52, true, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, 8.52, true, 'Two-toned moon');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1578, 18.20, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, 18.20, true, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 471, 18.20, true, 'Strange fractured surface');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158, 18.20, true, 'Bright moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 2707, 29.10, true, 'Orbits Neptune backwards');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 420, 29.10, false, 'Dark irregular moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 0.61, false, true, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 0.28, false, true, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 0.00, true, true, 'Our home');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 0.52, false, true, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5, 4.20, false, true, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 6, 8.52, false, true, 'Planet with rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4, 18.20, false, true, 'Ice giant tilted on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 2, 29.10, false, true, 'Farthest planet');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 0, 4.24, false, true, 'Exoplanet in habitable zone');
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 0, 4.24, false, true, 'Cold super-Earth candidate');
INSERT INTO public.planet VALUES (11, 'Sirius I', 3, 0, 8.60, false, true, 'Hypothetical planet');
INSERT INTO public.planet VALUES (12, 'Betelgeuse I', 4, 0, 548.00, false, false, 'Hypothetical planet');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with a solid surface', true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planet made mostly of hydrogen and helium', false);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planet made mostly of water, ammonia and methane ices', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 0.00, true, 'Our star');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 4.24, true, 'Closest star to the Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, 8.60, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 548.00, false, 'Red supergiant');
INSERT INTO public.star VALUES (5, 'Andromeda Alpha', 2, 5000, 2537000.00, true, 'Bright star in Andromeda');
INSERT INTO public.star VALUES (6, 'Triangulum Prime', 3, 3000, 2730000.00, true, 'Main star in Triangulum');


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

