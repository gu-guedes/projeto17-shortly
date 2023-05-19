--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "userId" integer,
    token text NOT NULL
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" character varying NOT NULL,
    url character varying NOT NULL,
    "visitCount" integer,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (1, '2023-05-19 12:20:43.446501', 3, 'b1e7321c-df12-4ac2-832b-ace07fd957f5');
INSERT INTO public.tokens VALUES (2, '2023-05-19 12:43:16.016697', 3, 'c81d9d55-ce6d-430e-ac68-1609943201dc');
INSERT INTO public.tokens VALUES (3, '2023-05-19 12:44:48.494001', 3, '610125ae-a33f-4e22-b418-abb2a6fa641e');
INSERT INTO public.tokens VALUES (4, '2023-05-19 12:45:26.032699', 3, '316c8523-5e60-448e-8d49-330f63e0d456');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (2, 'ZhxXRLjM9lrmp5iszU_U7', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 13:54:20.945422');
INSERT INTO public.urls VALUES (3, 'xVjnfhdLe2BAc05k-3CC2', 'res.sendStatus(200)', 1, NULL, '2023-05-19 13:54:57.932095');
INSERT INTO public.urls VALUES (4, '59FUCNOmEyz11HeLsFTE6', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:13:54.599926');
INSERT INTO public.urls VALUES (5, 'iIKtyqUiyCeq4MaLVFnnY', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:14:29.018229');
INSERT INTO public.urls VALUES (6, '7XeuaD2vdCwWJta6qlCtF', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:14:43.301738');
INSERT INTO public.urls VALUES (7, 'Ak9nzJ5HM0DaSMzIWeGMR', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:14:47.841538');
INSERT INTO public.urls VALUES (8, 'r6lGwm9bSd-9yLqf6s1uy', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:15:26.594442');
INSERT INTO public.urls VALUES (9, '9VNOleES8MAgE8iMyeCRI', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:16:35.697668');
INSERT INTO public.urls VALUES (10, 'PtMF3hrJevQHffP5ghs2O', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:16:58.14195');
INSERT INTO public.urls VALUES (11, 'bc8Nirw1Vumt8qhB4eUi1', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:17:10.236268');
INSERT INTO public.urls VALUES (12, 'Xr1tMOyTRsKLOj0BKkDsn', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:17:16.895454');
INSERT INTO public.urls VALUES (13, '-X8vwh8OHFwVOdNXnPKeW', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:17:44.433402');
INSERT INTO public.urls VALUES (14, 'S6dpeZF5idm7S6vjK5p4q', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, NULL, '2023-05-19 14:20:15.352112');
INSERT INTO public.urls VALUES (16, 'SHgaGemV', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 1, 3, '2023-05-19 14:44:05.3143');
INSERT INTO public.urls VALUES (18, 'jotD0Ieo', 'SOUTH', 1, 3, '2023-05-19 15:26:02.722422');
INSERT INTO public.urls VALUES (17, 'GYl0euDQ', 'https://img.freepik.com/fotos-gratis/respingo-colorido-abstrato-3d-background-generativo-ai-background_60438-2509.jpg', 2, 3, '2023-05-19 14:49:23.774945');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', 'driven', '2023-05-19 08:45:20.809875');
INSERT INTO public.users VALUES (2, 'gu', 'gu@driven.com.br', 'driven', '2023-05-19 08:46:23.363616');
INSERT INTO public.users VALUES (3, 'gustavo', 'gustavo@driven.com.br', '$2b$10$2FUR8oM7U37Vl7vuBQ.wlezfOe4qD4hpQIdqHe5WqyrzhpQgtAF3K', '2023-05-19 08:57:06.008947');


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 18, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT "tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

