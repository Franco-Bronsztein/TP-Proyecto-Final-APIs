--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-06-07 11:37:34

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
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16400)
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
-- TOC entry 215 (class 1259 OID 16399)
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
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 215
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.carrito.id;


--
-- TOC entry 218 (class 1259 OID 16407)
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
-- TOC entry 217 (class 1259 OID 16406)
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
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 217
-- Name: direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direccion_id_seq OWNED BY public.direccion.id;


--
-- TOC entry 220 (class 1259 OID 16414)
-- Name: favoritos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favoritos (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    idlocal integer NOT NULL
);


ALTER TABLE public.favoritos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16413)
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
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 219
-- Name: favoritos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favoritos_id_seq OWNED BY public.favoritos.id;


--
-- TOC entry 222 (class 1259 OID 16421)
-- Name: local; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.local (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    idproductos integer NOT NULL,
    foto character varying(10000) NOT NULL,
    cantestrellas integer NOT NULL
);


ALTER TABLE public.local OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16420)
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
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 221
-- Name: local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.local_id_seq OWNED BY public.local.id;


--
-- TOC entry 224 (class 1259 OID 16428)
-- Name: metodosdepago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodosdepago (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE public.metodosdepago OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16427)
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
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 223
-- Name: metodosdepago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodosdepago_id_seq OWNED BY public.metodosdepago.id;


--
-- TOC entry 226 (class 1259 OID 16435)
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
-- TOC entry 225 (class 1259 OID 16434)
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
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 225
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 228 (class 1259 OID 16442)
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
-- TOC entry 227 (class 1259 OID 16441)
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
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 227
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 230 (class 1259 OID 16449)
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
-- TOC entry 229 (class 1259 OID 16448)
-- Name: reseña_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."reseña_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."reseña_id_seq" OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 229
-- Name: reseña_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."reseña_id_seq" OWNED BY public."reseña".id;


--
-- TOC entry 232 (class 1259 OID 16456)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16455)
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
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;


--
-- TOC entry 234 (class 1259 OID 16463)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    telefono integer NOT NULL,
    mail character varying(100) NOT NULL,
    "contraseña" character varying(100) NOT NULL,
    vendedor boolean NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16462)
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
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 233
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4679 (class 2604 OID 16403)
-- Name: carrito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 16410)
-- Name: direccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion ALTER COLUMN id SET DEFAULT nextval('public.direccion_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 16417)
-- Name: favoritos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos ALTER COLUMN id SET DEFAULT nextval('public.favoritos_id_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 16424)
-- Name: local id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local ALTER COLUMN id SET DEFAULT nextval('public.local_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 16431)
-- Name: metodosdepago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago ALTER COLUMN id SET DEFAULT nextval('public.metodosdepago_id_seq'::regclass);


--
-- TOC entry 4684 (class 2604 OID 16438)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4685 (class 2604 OID 16445)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4686 (class 2604 OID 16452)
-- Name: reseña id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña" ALTER COLUMN id SET DEFAULT nextval('public."reseña_id_seq"'::regclass);


--
-- TOC entry 4687 (class 2604 OID 16459)
-- Name: tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 16466)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4882 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4884 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: direccion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4886 (class 0 OID 16414)
-- Dependencies: 220
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4888 (class 0 OID 16421)
-- Dependencies: 222
-- Data for Name: local; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.local VALUES (2, 'Catamarca', 'Billinghurst 372', 16, 'https://cdn-3.expansion.mx/dims4/default/24e9350/2147483647/strip/true/crop/1254x836+0+0/resize/1200x800!/format/webp/quality/60/?url=https%3A%2F%2Fcdn-3.expansion.mx%2Ff0%2F63%2F1781223d4c0d91095e17059bf0ff%2Fistock-1011173366.jpg', 4);
INSERT INTO public.local VALUES (3, 'Savona', 'Anchorena 700', 15, 'https://insidemdp.com.ar/wp-content/uploads/2022/12/panaderias-en-mar-del-plata.jpeg', 5);
INSERT INTO public.local VALUES (4, 'Panadería El Sol', 'Medrano 575', 14, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAsducQ53DgnHWpiRsVcx2HFBoLCAciOgDKQ&s', 3);
INSERT INTO public.local VALUES (5, 'Horno de Oro', 'San Martin 679', 13, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg1VAptewBOTJRwSKxlfu32nF1dp5IJuqTuw&s', 4);
INSERT INTO public.local VALUES (6, 'El Rincón del Panadero', 'Acoyte 2300', 12, 'https://images.adsttc.com/media/images/630e/cc5c/ae0c/1d14/7231/ff36/newsletter/panaderia-pianistas-zooco-estudio_10.jpg?1661914226', 5);
INSERT INTO public.local VALUES (7, 'Dulce Hogaza', 'Estado de Israel 3200', 11, 'https://media-front.elmostrador.cl/2019/04/Panaderia_variada.jpg', 4);
INSERT INTO public.local VALUES (8, 'Pan y Magia', 'Directorio 3736', 10, 'https://d100mj7v0l85u5.cloudfront.net/s3fs-public/2022-09/las-lecciones-de-las-panaderias-y-reposterias-.jpg', 5);
INSERT INTO public.local VALUES (9, 'Delicias de Trigo', 'Scalabrini Ortiz 954', 9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI-1jC9AcbA0CmAXm4dykLKWzSQaqVcsoVkg&s', 4);
INSERT INTO public.local VALUES (10, 'Meta', 'Congreso 372', 8, 'https://conelmorrofino.com/wp-content/uploads/2018/10/Las-mejores-panaderias-del-mundo-Portada.jpg', 5);
INSERT INTO public.local VALUES (11, 'London', 'Los Incas 1700', 7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRED4zyYURs_tjsLS30LWh22iKTe2jvr_qJkg&s', 3);
INSERT INTO public.local VALUES (12, 'Boston', 'Dorrego 789', 6, 'https://ig.com.ar/wp-content/uploads/2022/08/hombre-trabajando-fabrica-pan_23-2148983505.webp', 3);
INSERT INTO public.local VALUES (13, 'Jala', 'Diaz Velez 1500', 5, 'https://sevillasecreta.co/wp-content/uploads/2020/10/shutterstock_1544878508-1-1024x684.jpg', 4);
INSERT INTO public.local VALUES (14, 'Merlin', 'Honorio 534', 4, 'https://www.clavesdigital.com.ar/vistas/fotos_noticias/9275-asi-es-el-panorama-actual-de-las-panaderias-en-colombia.jpg', 5);
INSERT INTO public.local VALUES (15, 'Le pain', 'Rivadavia 444', 3, 'https://portales.vilbo.com/files/uploads/images/articulos/2020/panaderias/panem-mostrador.jpg', 5);
INSERT INTO public.local VALUES (16, 'Pannitti', 'Yatay 535', 2, 'https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2021/03/panaderias-colonia-roma-patisseriedominique.jpg?resize=1024%2C755&ssl=1', 5);
INSERT INTO public.local VALUES (17, 'Madre', 'Vera 600', 1, 'https://www.cucinare.tv/wp-content/uploads/2020/01/Gontran-2-1024x579.jpg', 5);


--
-- TOC entry 4890 (class 0 OID 16428)
-- Dependencies: 224
-- Data for Name: metodosdepago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4892 (class 0 OID 16435)
-- Dependencies: 226
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4894 (class 0 OID 16442)
-- Dependencies: 228
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4896 (class 0 OID 16449)
-- Dependencies: 230
-- Data for Name: reseña; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4898 (class 0 OID 16456)
-- Dependencies: 232
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4900 (class 0 OID 16463)
-- Dependencies: 234
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 215
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrito_id_seq', 1, false);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 217
-- Name: direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direccion_id_seq', 1, false);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 219
-- Name: favoritos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favoritos_id_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 221
-- Name: local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.local_id_seq', 17, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 223
-- Name: metodosdepago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodosdepago_id_seq', 1, false);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 225
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_id_seq', 1, false);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 227
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 1, false);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 229
-- Name: reseña_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reseña_id_seq"', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 233
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);


--
-- TOC entry 4690 (class 2606 OID 16405)
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 16412)
-- Name: direccion direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id);


--
-- TOC entry 4694 (class 2606 OID 16419)
-- Name: favoritos favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_pkey PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 16426)
-- Name: local local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 16433)
-- Name: metodosdepago metodosdepago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago
    ADD CONSTRAINT metodosdepago_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 2606 OID 16440)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 16447)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 16454)
-- Name: reseña reseña_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 16461)
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 16468)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4703 (class 1259 OID 16477)
-- Name: fki_idlocal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_idlocal ON public."reseña" USING btree (idlocal);


--
-- TOC entry 4710 (class 2606 OID 16488)
-- Name: carrito carrito_idpaquete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idpaquete_fkey FOREIGN KEY (idpaquete) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4711 (class 2606 OID 16558)
-- Name: carrito carrito_idpaquete_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idpaquete_fkey1 FOREIGN KEY (idpaquete) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4712 (class 2606 OID 16483)
-- Name: carrito carrito_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4713 (class 2606 OID 16553)
-- Name: carrito carrito_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4714 (class 2606 OID 16498)
-- Name: direccion direccion_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo(id) NOT VALID;


--
-- TOC entry 4715 (class 2606 OID 16568)
-- Name: direccion direccion_idtipo_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idtipo_fkey1 FOREIGN KEY (idtipo) REFERENCES public.tipo(id) NOT VALID;


--
-- TOC entry 4716 (class 2606 OID 16493)
-- Name: direccion direccion_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4717 (class 2606 OID 16563)
-- Name: direccion direccion_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4718 (class 2606 OID 16508)
-- Name: favoritos favoritos_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4719 (class 2606 OID 16578)
-- Name: favoritos favoritos_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4720 (class 2606 OID 16503)
-- Name: favoritos favoritos_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4721 (class 2606 OID 16573)
-- Name: favoritos favoritos_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos
    ADD CONSTRAINT favoritos_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4733 (class 2606 OID 16472)
-- Name: reseña idlocal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT idlocal FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4722 (class 2606 OID 16513)
-- Name: local local_idproductos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local
    ADD CONSTRAINT local_idproductos_fkey FOREIGN KEY (idproductos) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 16583)
-- Name: local local_idproductos_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local
    ADD CONSTRAINT local_idproductos_fkey1 FOREIGN KEY (idproductos) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 16518)
-- Name: metodosdepago metodosdepago_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago
    ADD CONSTRAINT metodosdepago_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 16533)
-- Name: pedido pedido_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4726 (class 2606 OID 16603)
-- Name: pedido pedido_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4727 (class 2606 OID 16523)
-- Name: pedido pedido_idmetododepago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idmetododepago_fkey FOREIGN KEY (idmetododepago) REFERENCES public.metodosdepago(id) NOT VALID;


--
-- TOC entry 4728 (class 2606 OID 16593)
-- Name: pedido pedido_idmetododepago_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idmetododepago_fkey1 FOREIGN KEY (idmetododepago) REFERENCES public.metodosdepago(id) NOT VALID;


--
-- TOC entry 4729 (class 2606 OID 16528)
-- Name: pedido pedido_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4730 (class 2606 OID 16598)
-- Name: pedido pedido_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4731 (class 2606 OID 16538)
-- Name: productos productos_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4732 (class 2606 OID 16608)
-- Name: productos productos_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4734 (class 2606 OID 16548)
-- Name: reseña reseña_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idlocal_fkey" FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4735 (class 2606 OID 16618)
-- Name: reseña reseña_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idlocal_fkey1" FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 16478)
-- Name: reseña reseña_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idusuario_fkey" FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 16613)
-- Name: reseña reseña_idusuario_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_idusuario_fkey2" FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


-- Completed on 2024-06-07 11:37:34

--
-- PostgreSQL database dump complete
--

