--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-07-01 08:46:44

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16488)
-- Name: Recomendados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recomendados" (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    idlocal integer NOT NULL
);


ALTER TABLE public."Recomendados" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16491)
-- Name: carrito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrito (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    idpaquete integer NOT NULL,
    pedidoactivo boolean NOT NULL
);


ALTER TABLE public.carrito OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16494)
-- Name: carrito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrito_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.carrito.id;


--
-- TOC entry 236 (class 1259 OID 16702)
-- Name: detallePedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."detallePedido" (
    "ID" integer NOT NULL,
    "FK_IDLocal" numeric(1000,0) NOT NULL,
    "FK_IDUsuario" numeric(1000,0) NOT NULL,
    "FK_IDProducto" numeric(1000,0) NOT NULL,
    "FK_IDPedido" numeric(1000,0) NOT NULL
);


ALTER TABLE public."detallePedido" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16701)
-- Name: detallePedido_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."detallePedido_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."detallePedido_ID_seq" OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 235
-- Name: detallePedido_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."detallePedido_ID_seq" OWNED BY public."detallePedido"."ID";


--
-- TOC entry 218 (class 1259 OID 16501)
-- Name: direccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direccion (
    id integer NOT NULL,
    ubicacion character varying(100) NOT NULL,
    idusuario integer NOT NULL,
    idtipo integer NOT NULL,
    referencia character varying(100) NOT NULL
);


ALTER TABLE public.direccion OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16504)
-- Name: direccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.direccion_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 219
-- Name: direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direccion_id_seq OWNED BY public.direccion.id;


--
-- TOC entry 220 (class 1259 OID 16505)
-- Name: favoritos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favoritos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favoritos_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 220
-- Name: favoritos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favoritos_id_seq OWNED BY public."Recomendados".id;


--
-- TOC entry 221 (class 1259 OID 16506)
-- Name: local; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.local (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    foto character varying(10000) NOT NULL,
    cantestrellas integer NOT NULL
);


ALTER TABLE public.local OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16511)
-- Name: local_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.local_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.local_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 222
-- Name: local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.local_id_seq OWNED BY public.local.id;


--
-- TOC entry 223 (class 1259 OID 16512)
-- Name: metodosdepago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodosdepago (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE public.metodosdepago OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16515)
-- Name: metodosdepago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodosdepago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodosdepago_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 224
-- Name: metodosdepago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodosdepago_id_seq OWNED BY public.metodosdepago.id;


--
-- TOC entry 225 (class 1259 OID 16516)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    id integer NOT NULL,
    delivery boolean NOT NULL,
    idmetododepago integer NOT NULL,
    idusuario integer NOT NULL,
    idlocal integer NOT NULL,
    cant integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    precio integer NOT NULL,
    referencia character varying(100) NOT NULL,
    codigoventa character varying(6) NOT NULL
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16519)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedido_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 227 (class 1259 OID 16520)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    preciooriginal integer NOT NULL,
    precioxpagina integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    cantdisponible integer NOT NULL,
    idlocal integer NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16523)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 228
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 229 (class 1259 OID 16524)
-- Name: reseña; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."reseña" (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    idlocal integer NOT NULL,
    cantestrellas integer NOT NULL,
    comentario character varying(100) NOT NULL
);


ALTER TABLE public."reseña" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16527)
-- Name: reseÃ±a_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."reseÃ±a_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."reseÃ±a_id_seq" OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 230
-- Name: reseÃ±a_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."reseÃ±a_id_seq" OWNED BY public."reseña".id;


--
-- TOC entry 231 (class 1259 OID 16528)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16531)
-- Name: tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 232
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;


--
-- TOC entry 233 (class 1259 OID 16532)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    telefono integer NOT NULL,
    mail character varying(100) NOT NULL,
    "contraseÃ±a" character varying(100) NOT NULL,
    vendedor boolean NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16535)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 234
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4684 (class 2604 OID 16536)
-- Name: Recomendados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados" ALTER COLUMN id SET DEFAULT nextval('public.favoritos_id_seq'::regclass);


--
-- TOC entry 4685 (class 2604 OID 16537)
-- Name: carrito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- TOC entry 4694 (class 2604 OID 16705)
-- Name: detallePedido ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "ID" SET DEFAULT nextval('public."detallePedido_ID_seq"'::regclass);


--
-- TOC entry 4686 (class 2604 OID 16539)
-- Name: direccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion ALTER COLUMN id SET DEFAULT nextval('public.direccion_id_seq'::regclass);


--
-- TOC entry 4687 (class 2604 OID 16540)
-- Name: local id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local ALTER COLUMN id SET DEFAULT nextval('public.local_id_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 16541)
-- Name: metodosdepago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago ALTER COLUMN id SET DEFAULT nextval('public.metodosdepago_id_seq'::regclass);


--
-- TOC entry 4689 (class 2604 OID 16542)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4690 (class 2604 OID 16543)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 16544)
-- Name: reseña id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña" ALTER COLUMN id SET DEFAULT nextval('public."reseÃ±a_id_seq"'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16545)
-- Name: tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 16546)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4887 (class 0 OID 16488)
-- Dependencies: 215
-- Data for Name: Recomendados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Recomendados" VALUES (5, 1, 2);
INSERT INTO public."Recomendados" VALUES (4, 1, 3);
INSERT INTO public."Recomendados" VALUES (3, 1, 10);
INSERT INTO public."Recomendados" VALUES (2, 1, 14);
INSERT INTO public."Recomendados" VALUES (1, 1, 7);


--
-- TOC entry 4888 (class 0 OID 16491)
-- Dependencies: 216
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4908 (class 0 OID 16702)
-- Dependencies: 236
-- Data for Name: detallePedido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4890 (class 0 OID 16501)
-- Dependencies: 218
-- Data for Name: direccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.direccion VALUES (1, 'Vera 797
', 1, 2, 'Alado de kiosco rojo y casa de porton verde
');


--
-- TOC entry 4893 (class 0 OID 16506)
-- Dependencies: 221
-- Data for Name: local; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.local VALUES (2, 'Catamarca', 'Billinghurst 372', 'https://cdn-3.expansion.mx/dims4/default/24e9350/2147483647/strip/true/crop/1254x836+0+0/resize/1200x800!/format/webp/quality/60/?url=https%3A%2F%2Fcdn-3.expansion.mx%2Ff0%2F63%2F1781223d4c0d91095e17059bf0ff%2Fistock-1011173366.jpg', 4);
INSERT INTO public.local VALUES (3, 'Savona', 'Anchorena 700', 'https://insidemdp.com.ar/wp-content/uploads/2022/12/panaderias-en-mar-del-plata.jpeg', 5);
INSERT INTO public.local VALUES (4, 'PanaderÃ­a El Sol', 'Medrano 575', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAsducQ53DgnHWpiRsVcx2HFBoLCAciOgDKQ&s', 3);
INSERT INTO public.local VALUES (5, 'Horno de Oro', 'San Martin 679', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg1VAptewBOTJRwSKxlfu32nF1dp5IJuqTuw&s', 4);
INSERT INTO public.local VALUES (6, 'El RincÃ³n del Panadero', 'Acoyte 2300', 'https://images.adsttc.com/media/images/630e/cc5c/ae0c/1d14/7231/ff36/newsletter/panaderia-pianistas-zooco-estudio_10.jpg?1661914226', 5);
INSERT INTO public.local VALUES (7, 'Dulce Hogaza', 'Estado de Israel 3200', 'https://media-front.elmostrador.cl/2019/04/Panaderia_variada.jpg', 4);
INSERT INTO public.local VALUES (8, 'Pan y Magia', 'Directorio 3736', 'https://d100mj7v0l85u5.cloudfront.net/s3fs-public/2022-09/las-lecciones-de-las-panaderias-y-reposterias-.jpg', 5);
INSERT INTO public.local VALUES (9, 'Delicias de Trigo', 'Scalabrini Ortiz 954', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI-1jC9AcbA0CmAXm4dykLKWzSQaqVcsoVkg&s', 4);
INSERT INTO public.local VALUES (10, 'Meta', 'Congreso 372', 'https://conelmorrofino.com/wp-content/uploads/2018/10/Las-mejores-panaderias-del-mundo-Portada.jpg', 5);
INSERT INTO public.local VALUES (11, 'London', 'Los Incas 1700', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRED4zyYURs_tjsLS30LWh22iKTe2jvr_qJkg&s', 3);
INSERT INTO public.local VALUES (12, 'Boston', 'Dorrego 789', 'https://ig.com.ar/wp-content/uploads/2022/08/hombre-trabajando-fabrica-pan_23-2148983505.webp', 3);
INSERT INTO public.local VALUES (13, 'Jala', 'Diaz Velez 1500', 'https://sevillasecreta.co/wp-content/uploads/2020/10/shutterstock_1544878508-1-1024x684.jpg', 4);
INSERT INTO public.local VALUES (14, 'Merlin', 'Honorio 534', 'https://www.clavesdigital.com.ar/vistas/fotos_noticias/9275-asi-es-el-panorama-actual-de-las-panaderias-en-colombia.jpg', 5);
INSERT INTO public.local VALUES (15, 'Le pain', 'Rivadavia 444', 'https://portales.vilbo.com/files/uploads/images/articulos/2020/panaderias/panem-mostrador.jpg', 5);
INSERT INTO public.local VALUES (16, 'Pannitti', 'Yatay 535', 'https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2021/03/panaderias-colonia-roma-patisseriedominique.jpg?resize=1024%2C755&ssl=1', 5);
INSERT INTO public.local VALUES (17, 'Madre', 'Vera 600', 'https://www.cucinare.tv/wp-content/uploads/2020/01/Gontran-2-1024x579.jpg', 5);


--
-- TOC entry 4895 (class 0 OID 16512)
-- Dependencies: 223
-- Data for Name: metodosdepago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4897 (class 0 OID 16516)
-- Dependencies: 225
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4899 (class 0 OID 16520)
-- Dependencies: 227
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4901 (class 0 OID 16524)
-- Dependencies: 229
-- Data for Name: reseña; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4903 (class 0 OID 16528)
-- Dependencies: 231
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo VALUES (1, 'casa');
INSERT INTO public.tipo VALUES (2, 'Oficina
');
INSERT INTO public.tipo VALUES (3, 'Otro
');


--
-- TOC entry 4905 (class 0 OID 16532)
-- Dependencies: 233
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'Uma

', 'Got
', 1134562341, 'umagot@gmail.com
', 'Uma1234
', false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrito_id_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 235
-- Name: detallePedido_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."detallePedido_ID_seq"', 1, false);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 219
-- Name: direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direccion_id_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 220
-- Name: favoritos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favoritos_id_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 222
-- Name: local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.local_id_seq', 17, true);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 224
-- Name: metodosdepago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodosdepago_id_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_id_seq', 1, false);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 228
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 1, false);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 230
-- Name: reseÃ±a_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reseÃ±a_id_seq"', 1, false);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 232
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_seq', 1, false);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 234
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, true);


--
-- TOC entry 4698 (class 2606 OID 16548)
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (id);


--
-- TOC entry 4717 (class 2606 OID 16709)
-- Name: detallePedido detallePedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4700 (class 2606 OID 16552)
-- Name: direccion direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 16554)
-- Name: Recomendados favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 16556)
-- Name: local local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 16558)
-- Name: metodosdepago metodosdepago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago
    ADD CONSTRAINT metodosdepago_pkey PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 16560)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4708 (class 2606 OID 16562)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4711 (class 2606 OID 16564)
-- Name: reseña reseÃ±a_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_pkey" PRIMARY KEY (id);


--
-- TOC entry 4713 (class 2606 OID 16566)
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 4715 (class 2606 OID 16568)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 1259 OID 16569)
-- Name: fki_idlocal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_idlocal ON public."reseña" USING btree (idlocal);


--
-- TOC entry 4722 (class 2606 OID 16570)
-- Name: carrito carrito_idpaquete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idpaquete_fkey FOREIGN KEY (idpaquete) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 16575)
-- Name: carrito carrito_idpaquete_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idpaquete_fkey1 FOREIGN KEY (idpaquete) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 16580)
-- Name: carrito carrito_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 16585)
-- Name: carrito carrito_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4726 (class 2606 OID 16590)
-- Name: direccion direccion_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo(id) NOT VALID;


--
-- TOC entry 4727 (class 2606 OID 16595)
-- Name: direccion direccion_idtipo_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idtipo_fkey1 FOREIGN KEY (idtipo) REFERENCES public.tipo(id) NOT VALID;


--
-- TOC entry 4728 (class 2606 OID 16600)
-- Name: direccion direccion_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4729 (class 2606 OID 16605)
-- Name: direccion direccion_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4718 (class 2606 OID 16610)
-- Name: Recomendados favoritos_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4719 (class 2606 OID 16615)
-- Name: Recomendados favoritos_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4720 (class 2606 OID 16620)
-- Name: Recomendados favoritos_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4721 (class 2606 OID 16625)
-- Name: Recomendados favoritos_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4739 (class 2606 OID 16630)
-- Name: reseña idlocal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT idlocal FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4730 (class 2606 OID 16635)
-- Name: metodosdepago metodosdepago_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago
    ADD CONSTRAINT metodosdepago_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4731 (class 2606 OID 16640)
-- Name: pedido pedido_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4732 (class 2606 OID 16645)
-- Name: pedido pedido_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4733 (class 2606 OID 16650)
-- Name: pedido pedido_idmetododepago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idmetododepago_fkey FOREIGN KEY (idmetododepago) REFERENCES public.metodosdepago(id) NOT VALID;


--
-- TOC entry 4734 (class 2606 OID 16655)
-- Name: pedido pedido_idmetododepago_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idmetododepago_fkey1 FOREIGN KEY (idmetododepago) REFERENCES public.metodosdepago(id) NOT VALID;


--
-- TOC entry 4735 (class 2606 OID 16660)
-- Name: pedido pedido_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 16665)
-- Name: pedido pedido_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 16670)
-- Name: productos productos_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4738 (class 2606 OID 16675)
-- Name: productos productos_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4740 (class 2606 OID 16680)
-- Name: reseña reseÃ±a_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idlocal_fkey" FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4741 (class 2606 OID 16685)
-- Name: reseña reseÃ±a_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idlocal_fkey1" FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4742 (class 2606 OID 16690)
-- Name: reseña reseÃ±a_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idusuario_fkey" FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4743 (class 2606 OID 16695)
-- Name: reseña reseÃ±a_idusuario_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idusuario_fkey2" FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


-- Completed on 2024-07-01 08:46:44

--
-- PostgreSQL database dump complete
--

