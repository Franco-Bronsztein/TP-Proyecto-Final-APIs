--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-10-10 08:53:45

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
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: Recomendados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recomendados" (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    idlocal integer NOT NULL
);


ALTER TABLE public."Recomendados" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16402)
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
-- TOC entry 217 (class 1259 OID 16405)
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
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.carrito.id;


--
-- TOC entry 218 (class 1259 OID 16406)
-- Name: detallePedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."detallePedido" (
    "ID" integer NOT NULL,
    "FK_IDLocal" integer NOT NULL,
    "FK_IDUsuario" integer NOT NULL,
    "FK_IDProducto" integer NOT NULL,
    "FK_IDPedido" integer NOT NULL
);


ALTER TABLE public."detallePedido" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16409)
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
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 219
-- Name: detallePedido_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."detallePedido_ID_seq" OWNED BY public."detallePedido"."ID";


--
-- TOC entry 220 (class 1259 OID 16410)
-- Name: direccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direccion (
    id integer NOT NULL,
    calle character varying(100) NOT NULL,
    idusuario integer NOT NULL,
    idetiqueta integer NOT NULL,
    referencia character varying(100) NOT NULL,
    pais character varying(100),
    detalle character varying(100),
    "Detalledeentrega" integer,
    ciudad character varying
);


ALTER TABLE public.direccion OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16415)
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
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 221
-- Name: direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direccion_id_seq OWNED BY public.direccion.id;


--
-- TOC entry 222 (class 1259 OID 16416)
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
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 222
-- Name: favoritos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favoritos_id_seq OWNED BY public."Recomendados".id;


--
-- TOC entry 223 (class 1259 OID 16417)
-- Name: local; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.local (
    id integer NOT NULL,
    nombrelocal character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    foto character varying(10000) NOT NULL,
    cantestrellas integer NOT NULL,
    confiteria boolean
);


ALTER TABLE public.local OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16422)
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
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 224
-- Name: local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.local_id_seq OWNED BY public.local.id;


--
-- TOC entry 225 (class 1259 OID 16423)
-- Name: metodosdepago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodosdepago (
    id integer NOT NULL,
    idusuario integer NOT NULL,
    tipo character varying(100) NOT NULL,
    "nombreTitularTarjeta" character varying(50),
    "numeroTarjeta" character varying(50),
    "CVV" integer,
    "fechaVencimiento" date
);


ALTER TABLE public.metodosdepago OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16426)
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
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 226
-- Name: metodosdepago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodosdepago_id_seq OWNED BY public.metodosdepago.id;


--
-- TOC entry 227 (class 1259 OID 16427)
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
    referencia character varying(100),
    codigoventa character varying(10) NOT NULL,
    idproducto integer
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16430)
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
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 228
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;


--
-- TOC entry 229 (class 1259 OID 16431)
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
-- TOC entry 230 (class 1259 OID 16434)
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
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 230
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 231 (class 1259 OID 16435)
-- Name: reseña; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."reseña" (
    idusuario integer NOT NULL,
    idlocal integer NOT NULL,
    cantestrellas integer NOT NULL,
    comentario character varying(1000) NOT NULL
);


ALTER TABLE public."reseña" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16441)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16444)
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
-- Dependencies: 233
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;


--
-- TOC entry 234 (class 1259 OID 16445)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100),
    telefono bigint,
    mail character varying(100) NOT NULL,
    password character varying(100),
    vendedor boolean,
    username character varying,
    "fechaNac" date,
    "fotoPerfil" character varying(300),
    google_id numeric
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16450)
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
-- Dependencies: 235
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4683 (class 2604 OID 16451)
-- Name: Recomendados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados" ALTER COLUMN id SET DEFAULT nextval('public.favoritos_id_seq'::regclass);


--
-- TOC entry 4684 (class 2604 OID 16452)
-- Name: carrito id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- TOC entry 4685 (class 2604 OID 16453)
-- Name: detallePedido ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido" ALTER COLUMN "ID" SET DEFAULT nextval('public."detallePedido_ID_seq"'::regclass);


--
-- TOC entry 4686 (class 2604 OID 16454)
-- Name: direccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion ALTER COLUMN id SET DEFAULT nextval('public.direccion_id_seq'::regclass);


--
-- TOC entry 4687 (class 2604 OID 16455)
-- Name: local id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local ALTER COLUMN id SET DEFAULT nextval('public.local_id_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 16456)
-- Name: metodosdepago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago ALTER COLUMN id SET DEFAULT nextval('public.metodosdepago_id_seq'::regclass);


--
-- TOC entry 4689 (class 2604 OID 16457)
-- Name: pedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);


--
-- TOC entry 4690 (class 2604 OID 16458)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 16460)
-- Name: tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16461)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4889 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: Recomendados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Recomendados" (id, idusuario, idlocal) VALUES (5, 1, 2);
INSERT INTO public."Recomendados" (id, idusuario, idlocal) VALUES (4, 1, 3);
INSERT INTO public."Recomendados" (id, idusuario, idlocal) VALUES (3, 1, 10);
INSERT INTO public."Recomendados" (id, idusuario, idlocal) VALUES (2, 1, 14);
INSERT INTO public."Recomendados" (id, idusuario, idlocal) VALUES (1, 1, 7);


--
-- TOC entry 4890 (class 0 OID 16402)
-- Dependencies: 216
-- Data for Name: carrito; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carrito (id, idusuario, idpaquete, pedidoactivo) VALUES (1, 1, 3, false);
INSERT INTO public.carrito (id, idusuario, idpaquete, pedidoactivo) VALUES (2, 2, 1, true);
INSERT INTO public.carrito (id, idusuario, idpaquete, pedidoactivo) VALUES (3, 1, 2, false);


--
-- TOC entry 4892 (class 0 OID 16406)
-- Dependencies: 218
-- Data for Name: detallePedido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4894 (class 0 OID 16410)
-- Dependencies: 220
-- Data for Name: direccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.direccion (id, calle, idusuario, idetiqueta, referencia, pais, detalle, "Detalledeentrega", ciudad) VALUES (1, 'Vera 797
    ', 1, 2, 'Alado de kiosco rojo y casa de porton verde
    ', 'Argentina', 'Piso 12 A', 1, 'Buenos Aires');
INSERT INTO public.direccion (id, calle, idusuario, idetiqueta, referencia, pais, detalle, "Detalledeentrega", ciudad) VALUES (2, 'Bucarelli 1925', 2, 2, 'Edificio Beige con porton negro
', 'Argentina

', 'Piso 5 A', 1, 'Caba');


--
-- TOC entry 4897 (class 0 OID 16417)
-- Dependencies: 223
-- Data for Name: local; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (2, 'Catamarca', 'Billinghurst 372', 'https://cdn-3.expansion.mx/dims4/default/24e9350/2147483647/strip/true/crop/1254x836+0+0/resize/1200x800!/format/webp/quality/60/?url=https%3A%2F%2Fcdn-3.expansion.mx%2Ff0%2F63%2F1781223d4c0d91095e17059bf0ff%2Fistock-1011173366.jpg', 4, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (3, 'Savona', 'Anchorena 700', 'https://insidemdp.com.ar/wp-content/uploads/2022/12/panaderias-en-mar-del-plata.jpeg', 5, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (4, 'PanaderÃ­a El Sol', 'Medrano 575', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAsducQ53DgnHWpiRsVcx2HFBoLCAciOgDKQ&s', 3, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (5, 'Horno de Oro', 'San Martin 679', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg1VAptewBOTJRwSKxlfu32nF1dp5IJuqTuw&s', 4, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (6, 'El RincÃ³n del Panadero', 'Acoyte 2300', 'https://images.adsttc.com/media/images/630e/cc5c/ae0c/1d14/7231/ff36/newsletter/panaderia-pianistas-zooco-estudio_10.jpg?1661914226', 5, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (7, 'Dulce Hogaza', 'Estado de Israel 3200', 'https://media-front.elmostrador.cl/2019/04/Panaderia_variada.jpg', 4, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (8, 'Pan y Magia', 'Directorio 3736', 'https://d100mj7v0l85u5.cloudfront.net/s3fs-public/2022-09/las-lecciones-de-las-panaderias-y-reposterias-.jpg', 5, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (9, 'Delicias de Trigo', 'Scalabrini Ortiz 954', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI-1jC9AcbA0CmAXm4dykLKWzSQaqVcsoVkg&s', 4, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (10, 'Meta', 'Congreso 372', 'https://conelmorrofino.com/wp-content/uploads/2018/10/Las-mejores-panaderias-del-mundo-Portada.jpg', 5, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (11, 'London', 'Los Incas 1700', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRED4zyYURs_tjsLS30LWh22iKTe2jvr_qJkg&s', 3, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (12, 'Boston', 'Dorrego 789', 'https://ig.com.ar/wp-content/uploads/2022/08/hombre-trabajando-fabrica-pan_23-2148983505.webp', 3, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (13, 'Jala', 'Diaz Velez 1500', 'https://sevillasecreta.co/wp-content/uploads/2020/10/shutterstock_1544878508-1-1024x684.jpg', 4, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (14, 'Merlin', 'Honorio 534', 'https://www.clavesdigital.com.ar/vistas/fotos_noticias/9275-asi-es-el-panorama-actual-de-las-panaderias-en-colombia.jpg', 5, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (15, 'Le pain', 'Rivadavia 444', 'https://portales.vilbo.com/files/uploads/images/articulos/2020/panaderias/panem-mostrador.jpg', 5, true);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (16, 'Pannitti', 'Yatay 535', 'https://i0.wp.com/foodandpleasure.com/wp-content/uploads/2021/03/panaderias-colonia-roma-patisseriedominique.jpg?resize=1024%2C755&ssl=1', 5, false);
INSERT INTO public.local (id, nombrelocal, direccion, foto, cantestrellas, confiteria) VALUES (17, 'Madre', 'Vera 600', 'https://www.cucinare.tv/wp-content/uploads/2020/01/Gontran-2-1024x579.jpg', 5, true);


--
-- TOC entry 4899 (class 0 OID 16423)
-- Dependencies: 225
-- Data for Name: metodosdepago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metodosdepago (id, idusuario, tipo, "nombreTitularTarjeta", "numeroTarjeta", "CVV", "fechaVencimiento") VALUES (2, 2, 'Efectivo', NULL, NULL, NULL, NULL);
INSERT INTO public.metodosdepago (id, idusuario, tipo, "nombreTitularTarjeta", "numeroTarjeta", "CVV", "fechaVencimiento") VALUES (1, 1, 'Tarjeta', 'Franco Bronsztein', '8764-7632-4532-4742', 733, '2027-11-01');


--
-- TOC entry 4901 (class 0 OID 16427)
-- Dependencies: 227
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedido (id, delivery, idmetododepago, idusuario, idlocal, cant, fecha, precio, referencia, codigoventa, idproducto) VALUES (2, false, 2, 1, 2, 1, '2023-08-23 00:00:00', 4000, NULL, '00000001', 2);


--
-- TOC entry 4903 (class 0 OID 16431)
-- Dependencies: 229
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (1, 'Paquete de Facturas', 600, 300, 'Una docena de facturas variadas', 20, 17);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (2, 'Paquete de Panes', 800, 400, 'Tres tipos diferentes de panes', 15, 17);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (3, 'Paquete de Medialunas', 500, 250, 'Una docena de medialunas', 30, 17);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (4, 'Paquete de Empanadas', 1200, 600, 'Seis empanadas variadas', 10, 2);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (5, 'Paquete de Tortas', 1500, 750, 'Tres porciones de tortas surtidas', 12, 2);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (6, 'Paquete de Muffins', 700, 350, 'Seis muffins de diferentes sabores', 25, 2);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (7, 'Paquete de Bizcochos', 500, 250, 'Una docena de bizcochos', 18, 3);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (8, 'Paquete de Masas Finas', 1000, 500, 'Un surtido de masas finas', 22, 3);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (9, 'Paquete de Galletas', 600, 300, 'Una docena de galletas variadas', 30, 3);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (10, 'Paquete de Churros', 400, 200, 'Seis churros rellenos', 20, 4);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (11, 'Paquete de Tartas', 1400, 700, 'Tres porciones de tartas surtidas', 15, 4);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (12, 'Paquete de Croissants', 550, 275, 'Una docena de croissants', 28, 4);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (13, 'Paquete de Alfajores', 750, 375, 'Seis alfajores de diferentes sabores', 20, 5);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (14, 'Paquete de Donuts', 650, 325, 'Seis donuts variadas', 25, 5);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (15, 'Paquete de Brownies', 900, 450, 'Tres brownies de chocolate', 18, 5);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (16, 'Paquete de Pastelitos', 800, 400, 'Seis pastelitos variados', 22, 6);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (17, 'Paquete de Tartas de Manzana', 1200, 600, 'Tres porciones de tarta de manzana', 15, 6);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (18, 'Paquete de Empanadillas', 1000, 500, 'Seis empanadillas de carne', 20, 6);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (19, 'Paquete de Pan Integral', 600, 300, 'Pan integral fresco', 25, 7);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (20, 'Paquete de Galletas de Avena', 500, 250, 'Una docena de galletas de avena', 30, 7);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (21, 'Paquete de Magdalenas', 800, 400, 'Seis magdalenas de diferentes sabores', 20, 7);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (22, 'Paquete de Pan Dulce', 1000, 500, 'Tres porciones de pan dulce', 15, 8);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (23, 'Paquete de Rosquillas', 700, 350, 'Una docena de rosquillas', 25, 8);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (24, 'Paquete de Tartas de Fruta', 1200, 600, 'Tres porciones de tartas de fruta', 12, 8);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (25, 'Paquete de Eclairs', 900, 450, 'Seis eclairs de chocolate', 20, 9);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (26, 'Paquete de Pasteles', 800, 400, 'Tres porciones de pasteles surtidos', 18, 9);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (27, 'Paquete de Mini Tarts', 700, 350, 'Seis mini tarts variadas', 22, 9);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (28, 'Paquete de Pan de Centeno', 600, 300, 'Pan de centeno fresco', 30, 10);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (29, 'Paquete de Pan Francés', 500, 250, 'Tres barras de pan francés', 20, 10);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (30, 'Paquete de Empanadas de Pollo', 1000, 500, 'Seis empanadas de pollo', 25, 10);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (31, 'Paquete de Galletas de Chocolate', 800, 400, 'Una docena de galletas de chocolate', 22, 11);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (32, 'Paquete de Brownies de Nuez', 1200, 600, 'Tres brownies de nuez', 15, 11);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (33, 'Paquete de Pan de Campo', 900, 450, 'Tres porciones de pan de campo', 18, 11);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (34, 'Paquete de Churros Rellenos', 800, 400, 'Seis churros rellenos de dulce de leche', 20, 12);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (35, 'Paquete de Masas Surtidas', 1000, 500, 'Un surtido de masas dulces', 25, 12);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (36, 'Paquete de Croissants de Mantequilla', 1200, 600, 'Una docena de croissants de mantequilla', 28, 12);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (37, 'Paquete de Panecillos', 700, 350, 'Seis panecillos variados', 22, 13);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (38, 'Paquete de Tostadas', 500, 250, 'Una docena de tostadas', 30, 13);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (39, 'Paquete de Muffins de Arándanos', 900, 450, 'Seis muffins de arándanos', 20, 13);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (40, 'Paquete de Empanadas Vegetarianas', 1200, 600, 'Seis empanadas vegetarianas', 15, 14);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (41, 'Paquete de Bizcochuelos', 800, 400, 'Tres porciones de bizcochuelos', 18, 14);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (42, 'Paquete de Galletas de Mantequilla', 700, 350, 'Una docena de galletas de mantequilla', 25, 14);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (43, 'Paquete de Tartaletas', 1000, 500, 'Seis tartaletas de frutas', 22, 15);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (44, 'Paquete de Pan de Queso', 900, 450, 'Tres porciones de pan de queso', 18, 15);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (45, 'Paquete de Roscas de Pascua', 1200, 600, 'Tres porciones de roscas de Pascua', 15, 15);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (46, 'Paquete de Magdalenas de Naranja', 800, 400, 'Seis magdalenas de naranja', 20, 16);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (47, 'Paquete de Bizcochos de Limón', 1000, 500, 'Tres porciones de bizcochos de limón', 25, 16);
INSERT INTO public.productos (id, nombre, preciooriginal, precioxpagina, descripcion, cantdisponible, idlocal) VALUES (48, 'Paquete de Pan Dulce de Navidad', 1500, 750, 'Tres porciones de pan dulce de Navidad', 12, 16);


--
-- TOC entry 4905 (class 0 OID 16435)
-- Dependencies: 231
-- Data for Name: reseña; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (1, 2, 4, 'Una joya escondida en el barrio, con productos horneados a diario y un ambiente acogedor. El aroma a pan recién hecho te atrae desde la entrada, y sus facturas son insuperables. El café combina a la perfección, haciendo que cualquier mañana sea especial.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (2, 3, 4, 'Una confitería tradicional con un toque moderno. Ofrecen desde los clásicos alfajores hasta tartas elaboradas. La atención es excelente, y sus medialunas son de otro mundo, crujientes por fuera y suaves por dentro.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (3, 4, 3, 'Esta panadería artesanal destaca por su variedad de panes integrales y sin gluten. Perfecta para quienes buscan productos saludables sin sacrificar sabor. Los scones de queso y las galletitas de avena se llevan todos los elogios.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (4, 5, 5, 'Confitería elegante con un enfoque en pastelería gourmet. Sus tortas son obras de arte, tanto en presentación como en sabor. Ideal para ocasiones especiales o simplemente para disfrutar de un buen postre.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (5, 6, 4, 'Un clásico de la ciudad que ha mantenido la calidad a lo largo de los años. Sus panes rústicos y facturas tradicionales son favoritos de los vecinos. No dejes de probar sus churros, perfectos para acompañar con un mate.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (6, 7, 5, 'Confitería con una gran variedad de tartas y pasteles. Sus opciones de desayuno son amplias y siempre frescas. Destacan por su atención al cliente y un ambiente relajado, ideal para una pausa en la jornada.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (4, 8, 3, 'Un lugar lleno de nostalgia, donde cada bocado recuerda a las recetas caseras. Las tortas de chocolate y los bizcochuelos son los grandes protagonistas. Un rincón familiar para compartir una merienda.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (2, 9, 4, 'La mejor opción para quienes buscan un buen pan de campo. La variedad de panes y el esmero con que son preparados hace de este lugar una visita obligada. El aroma a pan recién salido del horno llena todo el local.');
INSERT INTO public."reseña" (idusuario, idlocal, cantestrellas, comentario) VALUES (1, 2, 2, '''Esto es un ejemplo''');


--
-- TOC entry 4906 (class 0 OID 16441)
-- Dependencies: 232
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo (id, descripcion) VALUES (1, 'casa');
INSERT INTO public.tipo (id, descripcion) VALUES (2, 'Oficina
    ');
INSERT INTO public.tipo (id, descripcion) VALUES (3, 'Otro
    ');


--
-- TOC entry 4908 (class 0 OID 16445)
-- Dependencies: 234
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id, nombre, apellido, telefono, mail, password, vendedor, username, "fechaNac", "fotoPerfil", google_id) VALUES (1, 'Uma

    ', 'Got
    ', 1134562341, 'umagot@gmail.com
    ', 'Uma1234', false, 'umigot', '2006-11-22', NULL, NULL);
INSERT INTO public.usuario (id, nombre, apellido, telefono, mail, password, vendedor, username, "fechaNac", "fotoPerfil", google_id) VALUES (2, 'Franco
    ', 'Bronsztein
    ', 1126037372, 'francobrondsztein@gmail.com', 'Franco1234', false, 'franbron', '2007-03-18', NULL, NULL);
INSERT INTO public.usuario (id, nombre, apellido, telefono, mail, password, vendedor, username, "fechaNac", "fotoPerfil", google_id) VALUES (3, 'Valen', 'Vugin', 541123417834, 'valenvug@gmail.com', 'Valen1234', false, 'Valenvug', '2007-05-12', NULL, NULL);
INSERT INTO public.usuario (id, nombre, apellido, telefono, mail, password, vendedor, username, "fechaNac", "fotoPerfil", google_id) VALUES (4, 'Valen', 'Vugin', 541123417834, 'francobronsztein@gmail.com', 'Valen1234', false, 'Vaddddddsddddsddlenvug', '2024-09-03', NULL, NULL);
INSERT INTO public.usuario (id, nombre, apellido, telefono, mail, password, vendedor, username, "fechaNac", "fotoPerfil", google_id) VALUES (5, 'Noah', 'Denenberg Korob', NULL, 'noahdk06@gmail.com', 'oauth2_generated_password', NULL, 'NoahDenenberg Korob', NULL, NULL, 101130043956114330688);
INSERT INTO public.usuario (id, nombre, apellido, telefono, mail, password, vendedor, username, "fechaNac", "fotoPerfil", google_id) VALUES (6, 'Franco', 'Bronsztein', NULL, 'francobronsztein@gmail.com', 'logingGoogle', NULL, 'Franco + '' '' + Bronsztein', NULL, NULL, 101634604253330794737);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrito_id_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 219
-- Name: detallePedido_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."detallePedido_ID_seq"', 2, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 221
-- Name: direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direccion_id_seq', 1, false);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 222
-- Name: favoritos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favoritos_id_seq', 1, false);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 224
-- Name: local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.local_id_seq', 17, true);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 226
-- Name: metodosdepago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodosdepago_id_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 228
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_id_seq', 1, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 230
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 1, false);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_seq', 1, false);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 235
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 19, true);


--
-- TOC entry 4696 (class 2606 OID 16463)
-- Name: carrito carrito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 16465)
-- Name: detallePedido detallePedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 4700 (class 2606 OID 16467)
-- Name: direccion direccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id);


--
-- TOC entry 4694 (class 2606 OID 16469)
-- Name: Recomendados favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 16471)
-- Name: local local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 16473)
-- Name: metodosdepago metodosdepago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago
    ADD CONSTRAINT metodosdepago_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 16475)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 16477)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 16481)
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 16483)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4710 (class 1259 OID 16484)
-- Name: fki_idlocal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_idlocal ON public."reseña" USING btree (idlocal);


--
-- TOC entry 4705 (class 1259 OID 16485)
-- Name: fki_idproducto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_idproducto ON public.pedido USING btree (idproducto);


--
-- TOC entry 4719 (class 2606 OID 16486)
-- Name: carrito carrito_idpaquete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idpaquete_fkey FOREIGN KEY (idpaquete) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4720 (class 2606 OID 16491)
-- Name: carrito carrito_idpaquete_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idpaquete_fkey1 FOREIGN KEY (idpaquete) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4721 (class 2606 OID 16496)
-- Name: carrito carrito_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4722 (class 2606 OID 16501)
-- Name: carrito carrito_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrito
    ADD CONSTRAINT carrito_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 16506)
-- Name: detallePedido detallePedido_IDLocal_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_IDLocal_FK" FOREIGN KEY ("FK_IDLocal") REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 16511)
-- Name: detallePedido detallePedido_IDPedido_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_IDPedido_FK" FOREIGN KEY ("FK_IDPedido") REFERENCES public.pedido(id) NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 16516)
-- Name: detallePedido detallePedido_IDProducto_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_IDProducto_FK" FOREIGN KEY ("FK_IDProducto") REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4726 (class 2606 OID 16521)
-- Name: detallePedido detallePedido_IDUsuario_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."detallePedido"
    ADD CONSTRAINT "detallePedido_IDUsuario_FK" FOREIGN KEY ("FK_IDUsuario") REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4727 (class 2606 OID 16526)
-- Name: direccion direccion_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idtipo_fkey FOREIGN KEY (idetiqueta) REFERENCES public.tipo(id) NOT VALID;


--
-- TOC entry 4728 (class 2606 OID 16531)
-- Name: direccion direccion_idtipo_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idtipo_fkey1 FOREIGN KEY (idetiqueta) REFERENCES public.tipo(id) NOT VALID;


--
-- TOC entry 4729 (class 2606 OID 16536)
-- Name: direccion direccion_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4730 (class 2606 OID 16541)
-- Name: direccion direccion_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4715 (class 2606 OID 16546)
-- Name: Recomendados favoritos_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4716 (class 2606 OID 16551)
-- Name: Recomendados favoritos_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4717 (class 2606 OID 16556)
-- Name: Recomendados favoritos_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4718 (class 2606 OID 16561)
-- Name: Recomendados favoritos_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recomendados"
    ADD CONSTRAINT favoritos_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4741 (class 2606 OID 16566)
-- Name: reseña idlocal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT idlocal FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4732 (class 2606 OID 16571)
-- Name: pedido idproducto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT idproducto FOREIGN KEY (idproducto) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 4731 (class 2606 OID 16576)
-- Name: metodosdepago metodosdepago_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodosdepago
    ADD CONSTRAINT metodosdepago_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4733 (class 2606 OID 16581)
-- Name: pedido pedido_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4734 (class 2606 OID 16586)
-- Name: pedido pedido_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4735 (class 2606 OID 16591)
-- Name: pedido pedido_idmetododepago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idmetododepago_fkey FOREIGN KEY (idmetododepago) REFERENCES public.metodosdepago(id) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 16596)
-- Name: pedido pedido_idmetododepago_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idmetododepago_fkey1 FOREIGN KEY (idmetododepago) REFERENCES public.metodosdepago(id) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 16601)
-- Name: pedido pedido_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4738 (class 2606 OID 16606)
-- Name: pedido pedido_idusuario_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey1 FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4739 (class 2606 OID 16611)
-- Name: productos productos_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4740 (class 2606 OID 16616)
-- Name: productos productos_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_idlocal_fkey1 FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4742 (class 2606 OID 16621)
-- Name: reseña reseÃ±a_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idlocal_fkey" FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4743 (class 2606 OID 16626)
-- Name: reseña reseÃ±a_idlocal_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idlocal_fkey1" FOREIGN KEY (idlocal) REFERENCES public.local(id) NOT VALID;


--
-- TOC entry 4744 (class 2606 OID 16631)
-- Name: reseña reseÃ±a_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idusuario_fkey" FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


--
-- TOC entry 4745 (class 2606 OID 16636)
-- Name: reseña reseÃ±a_idusuario_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseÃ±a_idusuario_fkey2" FOREIGN KEY (idusuario) REFERENCES public.usuario(id) NOT VALID;


-- Completed on 2024-10-10 08:53:45

--
-- PostgreSQL database dump complete
--

