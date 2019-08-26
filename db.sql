--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1+deb10u1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1+deb10u1)

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

ALTER TABLE ONLY public.user_details DROP CONSTRAINT user_details_pkey;
ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
ALTER TABLE ONLY public.inventory_order_product DROP CONSTRAINT inventory_order_product_pkey;
ALTER TABLE ONLY public.inventory_order DROP CONSTRAINT inventory_order_pkey;
ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
ALTER TABLE public.user_details ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.product ALTER COLUMN product_id DROP DEFAULT;
ALTER TABLE public.inventory_order_product ALTER COLUMN inventory_order_product_id DROP DEFAULT;
ALTER TABLE public.inventory_order ALTER COLUMN inventory_order_id DROP DEFAULT;
ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
ALTER TABLE public.brand ALTER COLUMN brand_id DROP DEFAULT;
DROP SEQUENCE public.user_details_user_id_seq;
DROP TABLE public.user_details;
DROP SEQUENCE public.product_product_id_seq;
DROP TABLE public.product;
DROP SEQUENCE public.inventory_order_product_inventory_order_product_id_seq;
DROP TABLE public.inventory_order_product;
DROP SEQUENCE public.inventory_order_inventory_order_id_seq;
DROP TABLE public.inventory_order;
DROP SEQUENCE public.category_category_id_seq;
DROP TABLE public.category;
DROP SEQUENCE public.brand_brand_id_seq;
DROP TABLE public.brand;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    category_id integer NOT NULL,
    brand_name character varying(255) NOT NULL,
    brand_status boolean NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: TABLE brand; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.brand IS 'La tabla que guarda las cosas de las marcas.';


--
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_brand_id_seq OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_brand_id_seq OWNED BY public.brand.brand_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(250) NOT NULL,
    category_status boolean NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: TABLE category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.category IS 'La tabla de categorías guardadas.';


--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: inventory_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_order (
    inventory_order_id integer NOT NULL,
    user_id integer NOT NULL,
    inventory_order_total double precision NOT NULL,
    inventory_order_date date NOT NULL,
    inventory_order_name character varying(250) NOT NULL,
    inventory_order_address text NOT NULL,
    payment_status boolean NOT NULL,
    inventory_order_status character varying(100) NOT NULL,
    inventory_order_created_date date NOT NULL
);


ALTER TABLE public.inventory_order OWNER TO postgres;

--
-- Name: TABLE inventory_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.inventory_order IS 'La tabla que almacena las órdenes del inventario';


--
-- Name: COLUMN inventory_order.payment_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.inventory_order.payment_status IS '1 = cash, 0 = credit';


--
-- Name: inventory_order_inventory_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_order_inventory_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_order_inventory_order_id_seq OWNER TO postgres;

--
-- Name: inventory_order_inventory_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_order_inventory_order_id_seq OWNED BY public.inventory_order.inventory_order_id;


--
-- Name: inventory_order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_order_product (
    inventory_order_product_id integer NOT NULL,
    inventory_order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    tax double precision NOT NULL
);


ALTER TABLE public.inventory_order_product OWNER TO postgres;

--
-- Name: TABLE inventory_order_product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.inventory_order_product IS 'Inventory Order Product shit';


--
-- Name: inventory_order_product_inventory_order_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_order_product_inventory_order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_order_product_inventory_order_product_id_seq OWNER TO postgres;

--
-- Name: inventory_order_product_inventory_order_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_order_product_inventory_order_product_id_seq OWNED BY public.inventory_order_product.inventory_order_product_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    brand_id integer NOT NULL,
    product_name character varying(250) NOT NULL,
    product_description text NOT NULL,
    product_quantity integer NOT NULL,
    product_unit character varying(250) NOT NULL,
    product_base_price double precision NOT NULL,
    product_tax double precision NOT NULL,
    product_minimum_order double precision NOT NULL,
    product_enter_by integer NOT NULL,
    product_status boolean NOT NULL,
    product_date date NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: TABLE product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product IS 'Table for products';


--
-- Name: COLUMN product.product_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.product.product_status IS '1 = activo, 0 = inactivo';


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    user_id integer NOT NULL,
    user_email character varying(250) NOT NULL,
    user_password character varying(250) NOT NULL,
    user_name character varying(250) NOT NULL,
    user_type boolean NOT NULL,
    user_status boolean NOT NULL
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- Name: TABLE user_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.user_details IS 'tabla de detalles de usuario';


--
-- Name: COLUMN user_details.user_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_details.user_type IS '1 = master,  0 = mortal';


--
-- Name: COLUMN user_details.user_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_details.user_status IS '1 = active, 0 = inactive';


--
-- Name: user_details_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_details_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_user_id_seq OWNER TO postgres;

--
-- Name: user_details_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_details_user_id_seq OWNED BY public.user_details.user_id;


--
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: inventory_order inventory_order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_order ALTER COLUMN inventory_order_id SET DEFAULT nextval('public.inventory_order_inventory_order_id_seq'::regclass);


--
-- Name: inventory_order_product inventory_order_product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_order_product ALTER COLUMN inventory_order_product_id SET DEFAULT nextval('public.inventory_order_product_inventory_order_product_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: user_details user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details ALTER COLUMN user_id SET DEFAULT nextval('public.user_details_user_id_seq'::regclass);


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventory_order; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventory_order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 1, false);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- Name: inventory_order_inventory_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_order_inventory_order_id_seq', 1, false);


--
-- Name: inventory_order_product_inventory_order_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_order_product_inventory_order_product_id_seq', 1, false);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);


--
-- Name: user_details_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_details_user_id_seq', 1, false);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: inventory_order inventory_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_order
    ADD CONSTRAINT inventory_order_pkey PRIMARY KEY (inventory_order_id);


--
-- Name: inventory_order_product inventory_order_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_order_product
    ADD CONSTRAINT inventory_order_product_pkey PRIMARY KEY (inventory_order_product_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--
