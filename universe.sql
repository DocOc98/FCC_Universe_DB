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
    additional_data text,
    number_of_stars integer,
    code character varying(20)
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
    additional_data text,
    diameter integer,
    distance_from_planet integer,
    temperature numeric(8,4),
    code character varying(20),
    has_colonies boolean,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    additional_data text,
    diameter integer,
    distance_from_star integer,
    temperature numeric(8,4),
    has_life boolean,
    code character varying(20),
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(20) NOT NULL,
    additional_data text,
    code character varying(20)
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    additional_data text,
    diameter integer,
    distance_from_earth integer,
    temperature numeric(10,4),
    code character varying(20),
    galaxy_id integer NOT NULL
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Lactea', 'Nuestra Galaxia', 400000, 'GAVLAC');
INSERT INTO public.galaxy VALUES (2, 'ANDROMEDA', 'Galaxia mas cercana a la nuestra', 1000000, 'GAANDR');
INSERT INTO public.galaxy VALUES (3, 'del Sombrero', NULL, NULL, 'GASOM');
INSERT INTO public.galaxy VALUES (4, 'Ojo Negro', NULL, NULL, 'GAOJNE');
INSERT INTO public.galaxy VALUES (5, 'Triangulo', NULL, NULL, 'GATRI');
INSERT INTO public.galaxy VALUES (6, 'Remolino', NULL, NULL, 'GAREM');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Nuestro Satelite', 3475, NULL, NULL, 'SANTIELU', false, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', NULL, NULL, NULL, NULL, 'SANMARFOB', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, NULL, 'SANMARDEI', false, 4);
INSERT INTO public.moon VALUES (4, 'Ío', NULL, NULL, NULL, NULL, 'SANJUPIO', false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, NULL, NULL, NULL, 'SANJUPEUR', false, 5);
INSERT INTO public.moon VALUES (6, 'Calisto', NULL, NULL, NULL, NULL, 'SANJUPCAL', false, 5);
INSERT INTO public.moon VALUES (7, 'Atlas', NULL, NULL, NULL, NULL, 'SANSATATL', false, 6);
INSERT INTO public.moon VALUES (8, 'Calipso', NULL, NULL, NULL, NULL, 'SANSATCAL', false, 6);
INSERT INTO public.moon VALUES (9, 'Helena', NULL, NULL, NULL, NULL, 'SANSATHEL', false, 6);
INSERT INTO public.moon VALUES (10, 'Pandora', NULL, NULL, NULL, NULL, 'SANSATPAD', false, 6);
INSERT INTO public.moon VALUES (11, 'Ariel', NULL, NULL, NULL, NULL, 'SANURAARIEL', false, 7);
INSERT INTO public.moon VALUES (12, 'Francisco', NULL, NULL, NULL, NULL, 'SANURAFRA', false, 7);
INSERT INTO public.moon VALUES (13, 'Galatea', NULL, NULL, NULL, NULL, 'SANNEPGAL', false, 8);
INSERT INTO public.moon VALUES (14, 'Tritón', NULL, NULL, NULL, NULL, 'SANNEPTRI', false, 8);
INSERT INTO public.moon VALUES (15, 'Hidra', NULL, NULL, NULL, NULL, 'SANPLUHID', false, 10);
INSERT INTO public.moon VALUES (16, 'Estigia', NULL, NULL, NULL, NULL, 'SANPLUEST', false, 10);
INSERT INTO public.moon VALUES (17, 'MK2', NULL, NULL, NULL, NULL, 'SANMAKMK2', false, 12);
INSERT INTO public.moon VALUES (18, 'Disnomia', NULL, NULL, NULL, NULL, 'SANERIDIS', false, 13);
INSERT INTO public.moon VALUES (19, 'Hi´iaka', NULL, NULL, NULL, NULL, 'SANHAUHII', false, 11);
INSERT INTO public.moon VALUES (20, 'Namaka', NULL, NULL, NULL, NULL, 'SANHAUNAM', false, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Su Año dura 33 Días', 4878, NULL, NULL, false, 'PLMER', 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Este es el planeta mas Cercano al Nuestro', 12100, NULL, NULL, false, 'PLVEN', 1, 1);
INSERT INTO public.planet VALUES (3, 'Tierra', 'Nuestro Planeta', 12756, 0, NULL, true, 'PLTIE', 1, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 'El Planeta Rojo', 6787, NULL, NULL, false, 'PLMAR', 1, 1);
INSERT INTO public.planet VALUES (5, 'Júpiter', 'El planeta mas grande del Sistema Solar', 142984, NULL, NULL, false, 'PLJUP', 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Tiene Anillos Enormes', 120536, NULL, NULL, false, 'PLSAT', 1, 2);
INSERT INTO public.planet VALUES (7, 'Urano', 'Tiene anillos a pesar de no notarse', 51108, NULL, NULL, false, 'PLUR', 1, 2);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Tiene anillos muy debiles', 49538, NULL, NULL, false, 'PLNE', 1, 2);
INSERT INTO public.planet VALUES (9, 'Ceres', NULL, 956, NULL, NULL, false, 'PLCE', 1, 3);
INSERT INTO public.planet VALUES (10, 'Plutón', 'El Ex-Planeta', 2370, NULL, NULL, false, 'PLPLU', 1, 3);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, 1900, NULL, NULL, false, 'PLHUA', 1, 3);
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, 1420, NULL, NULL, false, 'PLMAK', 1, 3);
INSERT INTO public.planet VALUES (13, 'Eris', 'El objeto transneptuniano mas lejano. Es el segundo planeta enano mas grande, despues de plutón', 2326, NULL, NULL, false, 'PLER', 1, 3);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestre/Telúrico', 'pequeños, de superficie rocosa y sólida, densidad alta', 'PTERR');
INSERT INTO public.planet_types VALUES (2, 'Joviano', 'grandes diámetros, esencialmente gaseosos (hidrógeno y helio), densidad baja', 'PJOV');
INSERT INTO public.planet_types VALUES (3, 'Enano', 'No pueden ser categorizados como planetas o cuerpo menor del sistema solar.', 'PEN');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Nuestra Estrella', 1391016, NULL, 5778.0000, 'ESSOL', 1);
INSERT INTO public.star VALUES (3, 'Alfa Centauri', 'Estrella mas cercana a nuestro sistema solar', NULL, NULL, 5790.0000, 'ESALCE', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', NULL, NULL, NULL, 3775.4000, 'ESPROCE', 1);
INSERT INTO public.star VALUES (5, 'Arturo', NULL, NULL, NULL, 4290.0000, 'ESART', 1);
INSERT INTO public.star VALUES (6, 'Pólux', NULL, NULL, NULL, 4770.0000, 'ESPOL', 1);
INSERT INTO public.star VALUES (7, 'Spica', NULL, NULL, NULL, 22400.0000, 'ESSPI', 1);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 39, true);


--
-- Name: galaxy galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_code_key UNIQUE (code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_code_key UNIQUE (code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_code_key UNIQUE (code);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_code_key UNIQUE (code);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_code_key UNIQUE (code);


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
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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

