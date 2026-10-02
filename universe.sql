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
    name character varying(50) NOT NULL,
    description text,
    galaxy_type_id integer NOT NULL,
    distance_from_earth_light_years numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    name character varying(50) NOT NULL,
    galaxy_type_id integer NOT NULL,
    description text,
    abbreviation character varying(10),
    typical_mass_solar_masses numeric
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer,
    radius_in_km numeric
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
    name character varying(50) NOT NULL,
    distance_in_kilometers bigint,
    description text,
    has_moon boolean,
    has_life boolean,
    circunference_in_km bigint,
    star_id integer NOT NULL,
    moon_quantity integer
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
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer,
    degrees_celsius numeric
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy (M31)', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (4, 'Milky Way galaxy', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, classified as a disrupted barred spiral.', 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'M83 (Southern Pinwheel)', 'A beautiful, nearby barred spiral galaxy famous for its high rate of star formation.', 1, NULL);
INSERT INTO public.galaxy VALUES (7, 'Triangulum Galaxy (M33)', 'The third-largest member of the Local Group, a classic spiral galaxy with no central bar.', 2, NULL);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy (M51)', 'A classic, grand-design spiral galaxy actively interacting with a smaller companion.', 2, NULL);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy (M104)', 'Features a brilliant, oversized central bulge and a massive, striking dust lane in its disk.', 2, NULL);
INSERT INTO public.galaxy VALUES (10, 'Messier 87 (M87)', 'A supergiant elliptical galaxy hosting one of the most massive black holes ever imaged.', 3, NULL);
INSERT INTO public.galaxy VALUES (11, 'Messier 32 (M32)', 'A compact elliptical galaxy that acts as a close satellite neighbor to Andromeda.', 3, NULL);
INSERT INTO public.galaxy VALUES (12, 'Messier 110 (M110)', 'A dwarf elliptical galaxy that is also a satellite companion of the Andromeda Galaxy.', 3, NULL);
INSERT INTO public.galaxy VALUES (13, 'Small Magellanic Cloud', 'A dwarf irregular galaxy neighboring the Milky Way, distorted by gravitational tides.', 4, NULL);
INSERT INTO public.galaxy VALUES (14, 'Cigar Galaxy (M82)', 'A famous starburst irregular galaxy glowing intensely in infrared due to extreme star formation.', 4, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES ('Barred Spiral Galaxy', 1, 'Resemble gieant rotatin pinwheels with a flat disk, a bright central bulge, and curving arms.', NULL, NULL);
INSERT INTO public.galaxy_type VALUES ('Normal Spiral Galaxy', 2, 'Similar to barred spirals with a flat disk and curving arms, but with a circular central bulge instead of a bar structure.', NULL, NULL);
INSERT INTO public.galaxy_type VALUES ('Elliptical Galaxy', 3, 'Egg-shaped or spherical galaxies with smooth, featureless light profiles, containing older stars and very little gas or dust.', NULL, NULL);
INSERT INTO public.galaxy_type VALUES ('Irregular Galaxy', 4, 'Galaxies with no definite geometric shape or structure, often rich in gas and dust, and active in star formation.', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'The Moon', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Phobos', 21, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Deimos', 21, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Io', 22, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Europa', 22, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Ganymede', 22, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Callisto', 22, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Amalthea', 22, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Himalia', 22, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 23, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Rhea', 23, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Iapetus', 23, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Dione', 23, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Tethys', 23, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Enceladus', 23, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Mimas', 23, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Titania', 24, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Oberon', 24, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Umbriel', 24, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Ariel', 24, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Miranda', 24, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Triton', 25, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Proteus', 25, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Nereid', 25, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Dog Star Moon Alpha', 26, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Vega Moon Prime', 29, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 0, NULL, true, true, NULL, 2, NULL);
INSERT INTO public.planet VALUES (19, 'Mercury', 57900000, 'The smallest and closest planet to the Sun.', false, false, 15329, 2, NULL);
INSERT INTO public.planet VALUES (20, 'Venus', 108200000, 'The hottest planet in our solar system, with a thick toxic atmosphere.', false, false, 38025, 2, NULL);
INSERT INTO public.planet VALUES (21, 'Mars', 227900000, 'The Red Planet, home to Olympus Mons, the largest volcano in the solar system.', true, false, 21344, 2, NULL);
INSERT INTO public.planet VALUES (22, 'Jupiter', 778500000, 'The largest planet in our solar system, known for its Great Red Spot.', true, false, 439264, 2, NULL);
INSERT INTO public.planet VALUES (23, 'Saturn', 1433000000, 'Famous for its extensive and spectacular planetary ring system.', true, false, 365882, 2, NULL);
INSERT INTO public.planet VALUES (24, 'Uranus', 2871000000, 'An ice giant with a unique tilt that causes it to orbit on its side.', true, false, 159354, 2, NULL);
INSERT INTO public.planet VALUES (25, 'Neptune', 4495000000, 'The most distant planet from the Sun, known for its extreme supersonic winds.', true, false, 154705, 2, NULL);
INSERT INTO public.planet VALUES (26, 'Dog Star Prime', 300000000, 'A massive gas giant experiencing intense stellar radiation.', true, false, 520000, 19, NULL);
INSERT INTO public.planet VALUES (27, 'Sirius Minor', 85000000, 'A scorched, rocky planet tightly locked to its host star.', false, false, 22000, 19, NULL);
INSERT INTO public.planet VALUES (28, 'Rigil Centauri b', 150000000, 'A hypothetical rocky world orbiting inside the stellar habitable zone.', false, false, 42000, 21, NULL);
INSERT INTO public.planet VALUES (29, 'Vega Prime', 450000000, 'A giant gas world shaping the structure of Vega''s vast dust debris disk.', true, false, 610000, 22, NULL);
INSERT INTO public.planet VALUES (30, 'Vega Minor', 180000000, 'An asteroid-pelted planet covered in cooling basaltic magma flows.', false, false, 31000, 22, NULL);
INSERT INTO public.planet VALUES (31, 'Proxima Centauri b', 7500000, 'A confirmed exoplanet orbiting within the habitable zone of its star.', false, false, 39000, 26, NULL);
INSERT INTO public.planet VALUES (32, 'Proxima Centauri c', 220000000, 'A super-Earth or mini-Neptune orbiting in a very cold, distant path.', true, false, 95000, 26, NULL);
INSERT INTO public.planet VALUES (33, 'Andromeda Exo-1', 120000000, 'An extragalactic planet candidate detected via transit techniques.', false, false, 110000, 27, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Aurelia Prime', 450, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sun', 4500, 4, NULL);
INSERT INTO public.star VALUES (19, 'Sirius A', 242, 4, NULL);
INSERT INTO public.star VALUES (20, 'Canopus', 30, 4, NULL);
INSERT INTO public.star VALUES (21, 'Alpha Centauri A', 4850, 4, NULL);
INSERT INTO public.star VALUES (22, 'Vega', 455, 4, NULL);
INSERT INTO public.star VALUES (23, 'Rigel', 8, 4, NULL);
INSERT INTO public.star VALUES (24, 'Betelgeuse', 10, 4, NULL);
INSERT INTO public.star VALUES (25, 'Polaris', 70, 4, NULL);
INSERT INTO public.star VALUES (26, 'Proxima Centauri', 4850, 4, NULL);
INSERT INTO public.star VALUES (27, 'M31-V1', 50, 1, NULL);
INSERT INTO public.star VALUES (28, 'PA-99-N2', 60, 1, NULL);
INSERT INTO public.star VALUES (29, 'WOH G64', 5, 5, NULL);
INSERT INTO public.star VALUES (30, 'M33-VRS 1', 12, 7, NULL);
INSERT INTO public.star VALUES (31, 'M51-V1', 20, 8, NULL);
INSERT INTO public.star VALUES (32, 'M87-V1', 40, 10, NULL);
INSERT INTO public.star VALUES (33, 'M82-X-1', 15, 14, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 14, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 33, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 33, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: galaxy_type unique_galaxy_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_galaxy_type_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

