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
    name character varying(40) NOT NULL,
    type character varying(12),
    constellation character varying(40),
    alias character varying(40)
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
    planet_id integer,
    habitable boolean,
    temperature integer,
    name_ety text
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
    star_id integer,
    earth_mass numeric(10,5),
    habitable boolean,
    temperature integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    constellation character varying(40),
    designation character varying(30)
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
-- Name: trips_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.trips_moon (
    name character varying(20) NOT NULL,
    year integer NOT NULL,
    trips_moon_id integer NOT NULL
);


ALTER TABLE public.trips_moon OWNER TO freecodecamp;

--
-- Name: trips_moon_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.trips_moon_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trips_moon_trip_id_seq OWNER TO freecodecamp;

--
-- Name: trips_moon_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.trips_moon_trip_id_seq OWNED BY public.trips_moon.trips_moon_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: trips_moon trips_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trips_moon ALTER COLUMN trips_moon_id SET DEFAULT nextval('public.trips_moon_trip_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 'Sagittarius', 'home');
INSERT INTO public.galaxy VALUES (2, 'NGC 224', 'spiral', 'Andromeda', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'NGC 2865', 'elliptical', 'Hydra', NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 4886', 'lenticular', 'Coma Berenices', NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 5264', 'irregular', 'Hydra', 'DDO 242');
INSERT INTO public.galaxy VALUES (6, 'NGC 5728', 'Seyfert', 'Libra', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mimas', 6, false, -200, 'Giant felled by Hephaestus');
INSERT INTO public.moon VALUES (2, 'Enceladus', 6, true, -201, 'Giant felled by Athene.');
INSERT INTO public.moon VALUES (3, 'Tethys', 6, false, -187, 'The wife of Oceanus in Ancient Greece,');
INSERT INTO public.moon VALUES (4, 'Dione', 6, false, -186, 'Sister of Cronos and mother of Aphrodite in Ancient Greece');
INSERT INTO public.moon VALUES (5, 'Rhea', 6, false, -174, 'Ancient Greek Titaness, mother of Zeus');
INSERT INTO public.moon VALUES (6, 'Io', 5, false, -130, 'Daugther of Inachus in Ancient Greece, target of the jealousy of Hera, was morphed into a cow for protection, by Jupiter');
INSERT INTO public.moon VALUES (7, 'Europa', 5, true, -190, 'Daughter of Agenor, king of Ancient Tyre, seduced by Jupiter who had assumed the shape of a white bull');
INSERT INTO public.moon VALUES (8, 'Ganymede', 5, true, -163, 'Young boy, carried by Jupiter to Olympus, the house of the gods in Ancient Greece');
INSERT INTO public.moon VALUES (9, 'Amalthea', 5, false, -153, 'A naiad who nursed the new-born Jupiter. She had as a favorite animal a goat which is said by some authors to have nourished Jupiter. The name was suggested by Flammarion.');
INSERT INTO public.moon VALUES (10, 'Moon', 3, false, 5, 'Every civilization has had a name for the satellite of Earth that is known, in English, as the Moon. The Moon is known as Luna in Italian, Latin, and Spanish, as Lune in French, as Mond in German, and as Selene in Greek.	');
INSERT INTO public.moon VALUES (11, 'Phobos', 4, false, -50, 'Inner satellite of Mars. Named for one of the horses that drew Mars'' chariot; also called an "attendant" or "son" of Mars, according to chapter 15, line 119 of Homer''s "Iliad." This Greek word means "flight."');
INSERT INTO public.moon VALUES (12, 'Deimos', 4, false, -40, 'This outer Martian satellite was named for one of the horses that drew Mars'' chariot; also called an "attendant" or "son" of Mars, according to chapter 15, line 119 of Homer''s "Iliad." Deimos means "fear" in Greek.');
INSERT INTO public.moon VALUES (13, 'Ariel', 7, false, -78, 'Named by John Herschel for a sylph in Pope''s "Rape of the Lock."');
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, false, -198, 'Umbriel was named by John Herschel for a malevolent spirit in Pope''s "Rape of the Lock."');
INSERT INTO public.moon VALUES (15, 'Titania', 7, false, -208, 'Named by Herschel''s son John in early 19th century for the queen of the fairies in Shakespeare''s "A Midsummer Night''s Dream."');
INSERT INTO public.moon VALUES (16, 'Triton', 8, false, -236, 'Triton is named for the sea-god son of Poseidon (Neptune) and Amphitrite. The first suggestion of the name Triton has been attributed to the French astronomer Camille Flammarion.');
INSERT INTO public.moon VALUES (17, 'Nereid', 8, false, -223, 'The Nereids were the fifty daughters of the sea god Nereus and Doris and were attendants of Poseidon (Neptune).');
INSERT INTO public.moon VALUES (18, 'Naiad', 8, false, -222, 'The name of a group of Greek water nymphs who were guardians of lakes, fountains, springs, and rivers.');
INSERT INTO public.moon VALUES (19, 'Charon', 9, false, -141, 'Named after the Greek mythological boatman who ferried souls across the river Styx to Pluto for judgement.');
INSERT INTO public.moon VALUES (20, 'Nix', 9, false, -229, 'Goddess of darkness and night, mother of Charon. Nix is the Egyptian spelling of the Greek name Nyx.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5, 0.05530, false, 167);
INSERT INTO public.planet VALUES (2, 'Venus', 5, 0.81500, false, 464);
INSERT INTO public.planet VALUES (3, 'Earth', 5, 1.00000, true, 15);
INSERT INTO public.planet VALUES (4, 'Mars', 5, 0.10700, false, -65);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, 318.00000, false, -110);
INSERT INTO public.planet VALUES (6, 'Saturn', 5, 95.20000, false, -140);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 14.50000, false, -195);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, 17.10000, false, -200);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 0.00218, false, -225);
INSERT INTO public.planet VALUES (10, 'Teegarden''s Star b', 7, 1.05000, true, 28);
INSERT INTO public.planet VALUES (11, 'Teegarden''s Star c', 7, 1.11000, true, -47);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 8, 1.07000, true, -39);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lusitânia', 1, 'Monoceros', 'HD 45652');
INSERT INTO public.star VALUES (2, 'Lilii Borea', 1, 'Aries', '39 Arietis');
INSERT INTO public.star VALUES (3, 'Koit', 1, 'Lynx', 'XO-4');
INSERT INTO public.star VALUES (4, 'Helvetios', 1, 'Pegasus', '51 Pegasi');
INSERT INTO public.star VALUES (5, 'Sun', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Baekdu', 1, 'Ursa Minor', '8 Ursae Minoris');
INSERT INTO public.star VALUES (7, 'Teegarden''s Star', 1, 'Aries', 'SO J025300.5+165258');
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 'Centaurus', 'HIP 70890');


--
-- Data for Name: trips_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.trips_moon VALUES ('Apollo 11', 1969, 1);
INSERT INTO public.trips_moon VALUES ('Apollo 12', 1969, 2);
INSERT INTO public.trips_moon VALUES ('Apollo 14', 1971, 3);
INSERT INTO public.trips_moon VALUES ('Apollo 15', 1971, 4);
INSERT INTO public.trips_moon VALUES ('Apollo 17', 1972, 6);
INSERT INTO public.trips_moon VALUES ('Apollo 16', 1972, 5);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: trips_moon_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.trips_moon_trip_id_seq', 6, true);


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
-- Name: trips_moon trips_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trips_moon
    ADD CONSTRAINT trips_moon_pkey PRIMARY KEY (trips_moon_id);


--
-- Name: trips_moon trips_moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.trips_moon
    ADD CONSTRAINT trips_moon_unq UNIQUE (name);


--
-- Name: moon moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

