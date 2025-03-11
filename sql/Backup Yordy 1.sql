--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.1

-- Started on 2025-03-07 21:13:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 238 (class 1259 OID 1630401)
-- Name: boletos; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".boletos (
    id integer NOT NULL,
    viaje_id integer,
    usuario_id integer,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT boletos_precio_check CHECK ((precio >= (0)::numeric))
);


ALTER TABLE "Yordy Soto".boletos OWNER TO "Comfe_owner";

--
-- TOC entry 237 (class 1259 OID 1630400)
-- Name: boletos_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".boletos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".boletos_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 237
-- Name: boletos_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".boletos_id_seq OWNED BY "Yordy Soto".boletos.id;


--
-- TOC entry 232 (class 1259 OID 1630363)
-- Name: buses; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".buses (
    id integer NOT NULL,
    numero character varying(20) NOT NULL,
    capacidad integer NOT NULL,
    estado_bus_id integer,
    CONSTRAINT buses_capacidad_check CHECK ((capacidad > 0))
);


ALTER TABLE "Yordy Soto".buses OWNER TO "Comfe_owner";

--
-- TOC entry 231 (class 1259 OID 1630362)
-- Name: buses_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".buses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".buses_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 231
-- Name: buses_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".buses_id_seq OWNED BY "Yordy Soto".buses.id;


--
-- TOC entry 316 (class 1259 OID 1794111)
-- Name: estado_bus; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".estado_bus (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE "Yordy Soto".estado_bus OWNER TO "Comfe_owner";

--
-- TOC entry 315 (class 1259 OID 1794110)
-- Name: estado_bus_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".estado_bus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".estado_bus_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 315
-- Name: estado_bus_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".estado_bus_id_seq OWNED BY "Yordy Soto".estado_bus.id;


--
-- TOC entry 228 (class 1259 OID 1630349)
-- Name: rutas; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".rutas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    origen character varying(100) NOT NULL,
    destino character varying(100) NOT NULL,
    duracion interval NOT NULL
);


ALTER TABLE "Yordy Soto".rutas OWNER TO "Comfe_owner";

--
-- TOC entry 227 (class 1259 OID 1630348)
-- Name: rutas_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".rutas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".rutas_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 227
-- Name: rutas_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".rutas_id_seq OWNED BY "Yordy Soto".rutas.id;


--
-- TOC entry 314 (class 1259 OID 1794098)
-- Name: tipo_tarifa; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".tipo_tarifa (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE "Yordy Soto".tipo_tarifa OWNER TO "Comfe_owner";

--
-- TOC entry 313 (class 1259 OID 1794097)
-- Name: tipo_tarifa_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".tipo_tarifa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".tipo_tarifa_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 313
-- Name: tipo_tarifa_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".tipo_tarifa_id_seq OWNED BY "Yordy Soto".tipo_tarifa.id;


--
-- TOC entry 234 (class 1259 OID 1630374)
-- Name: usuarios; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo_tarifa_id integer,
    fecha_nacimiento date
);


ALTER TABLE "Yordy Soto".usuarios OWNER TO "Comfe_owner";

--
-- TOC entry 233 (class 1259 OID 1630373)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".usuarios_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 233
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".usuarios_id_seq OWNED BY "Yordy Soto".usuarios.id;


--
-- TOC entry 236 (class 1259 OID 1630383)
-- Name: viajes; Type: TABLE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE TABLE "Yordy Soto".viajes (
    id integer NOT NULL,
    ruta_id integer,
    bus_id integer,
    fecha date NOT NULL,
    hora_salida time without time zone NOT NULL,
    pasajeros_totales integer NOT NULL,
    hora_salida_real time without time zone,
    hora_llegada time without time zone,
    hora_llegada_real time without time zone,
    CONSTRAINT viajes_pasajeros_check CHECK ((pasajeros_totales >= 0))
);


ALTER TABLE "Yordy Soto".viajes OWNER TO "Comfe_owner";

--
-- TOC entry 235 (class 1259 OID 1630382)
-- Name: viajes_id_seq; Type: SEQUENCE; Schema: Yordy Soto; Owner: Comfe_owner
--

CREATE SEQUENCE "Yordy Soto".viajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Yordy Soto".viajes_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 235
-- Name: viajes_id_seq; Type: SEQUENCE OWNED BY; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER SEQUENCE "Yordy Soto".viajes_id_seq OWNED BY "Yordy Soto".viajes.id;


--
-- TOC entry 3389 (class 2604 OID 1630404)
-- Name: boletos id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".boletos ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".boletos_id_seq'::regclass);


--
-- TOC entry 3386 (class 2604 OID 1630366)
-- Name: buses id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".buses ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".buses_id_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 1794114)
-- Name: estado_bus id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".estado_bus ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".estado_bus_id_seq'::regclass);


--
-- TOC entry 3385 (class 2604 OID 1630352)
-- Name: rutas id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".rutas ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".rutas_id_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 1794101)
-- Name: tipo_tarifa id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".tipo_tarifa ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".tipo_tarifa_id_seq'::regclass);


--
-- TOC entry 3387 (class 2604 OID 1630377)
-- Name: usuarios id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".usuarios ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".usuarios_id_seq'::regclass);


--
-- TOC entry 3388 (class 2604 OID 1630386)
-- Name: viajes id; Type: DEFAULT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".viajes ALTER COLUMN id SET DEFAULT nextval('"Yordy Soto".viajes_id_seq'::regclass);


--
-- TOC entry 3571 (class 0 OID 1630401)
-- Dependencies: 238
-- Data for Name: boletos; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".boletos (id, viaje_id, usuario_id, precio) FROM stdin;
11	1	11	2200.00
12	1	2	2500.00
13	2	3	1800.00
14	2	4	2200.00
15	3	5	2500.00
16	3	6	1800.00
17	4	7	2200.00
18	4	8	2500.00
19	5	9	1800.00
20	5	10	2500.00
\.


--
-- TOC entry 3565 (class 0 OID 1630363)
-- Dependencies: 232
-- Data for Name: buses; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".buses (id, numero, capacidad, estado_bus_id) FROM stdin;
1	M101	40	1
2	M202	35	1
3	M303	45	1
4	M404	30	1
5	M505	40	1
6	M606	35	2
7	M707	45	1
8	M808	30	1
9	M909	40	3
10	M110	35	1
\.


--
-- TOC entry 3575 (class 0 OID 1794111)
-- Dependencies: 316
-- Data for Name: estado_bus; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".estado_bus (id, nombre) FROM stdin;
1	Activo
2	Fuera de servicio
3	En mantenimiento
\.


--
-- TOC entry 3563 (class 0 OID 1630349)
-- Dependencies: 228
-- Data for Name: rutas; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".rutas (id, nombre, origen, destino, duracion) FROM stdin;
1	Ruta 1	Provenza	Centro	00:45:00
2	Ruta 2	Cabecera	UIS	00:30:00
3	Ruta 3	Ciudadela	Real de Minas	01:00:00
4	Ruta 4	Piedecuesta	Centro	01:15:00
5	Ruta 5	Floridablanca	Cañaveral	00:50:00
6	Ruta 6	Girón	Centro	01:30:00
7	Ruta 7	Lagos del Cacique	UIS	00:35:00
8	Ruta 8	San Alonso	Cabecera	00:25:00
9	Ruta 9	La Concordia	Provenza	00:55:00
10	Ruta 10	El Prado	Ciudadela	01:05:00
\.


--
-- TOC entry 3573 (class 0 OID 1794098)
-- Dependencies: 314
-- Data for Name: tipo_tarifa; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".tipo_tarifa (id, nombre) FROM stdin;
1	Adulto Mayor
2	Estudiante
3	Normal
4	Deportista
\.


--
-- TOC entry 3567 (class 0 OID 1630374)
-- Dependencies: 234
-- Data for Name: usuarios; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".usuarios (id, nombre, tipo_tarifa_id, fecha_nacimiento) FROM stdin;
2	Ana Pérez	3	1999-05-03
3	Carlos Gómez	2	1987-05-04
4	Sofía Rodríguez	1	1959-03-30
5	Diego López	2	2008-08-31
6	Laura Torres	2	1983-10-11
7	Javier Vargas	3	1955-09-07
8	Valentina Castro	3	2002-06-05
9	Sebastián Jiménez	3	1993-04-04
10	Mariana Díaz	3	1957-02-07
11	Andrés Ruiz	3	1996-01-10
\.


--
-- TOC entry 3569 (class 0 OID 1630383)
-- Dependencies: 236
-- Data for Name: viajes; Type: TABLE DATA; Schema: Yordy Soto; Owner: Comfe_owner
--

COPY "Yordy Soto".viajes (id, ruta_id, bus_id, fecha, hora_salida, pasajeros_totales, hora_salida_real, hora_llegada, hora_llegada_real) FROM stdin;
1	1	1	2024-01-20	07:00:00	35	07:00:00	09:00:00	09:08:00
2	2	2	2024-01-20	07:30:00	28	07:32:00	09:30:00	09:38:00
3	3	3	2024-01-20	08:00:00	42	08:07:00	10:00:00	10:11:00
4	4	4	2024-01-20	08:30:00	25	08:32:00	10:30:00	10:35:00
5	5	5	2024-01-20	09:00:00	38	09:05:00	11:00:00	11:01:00
6	1	7	2024-01-20	09:30:00	30	09:34:00	11:30:00	11:42:00
7	2	8	2024-01-20	10:00:00	22	10:05:00	12:00:00	12:02:00
8	3	9	2024-01-20	10:30:00	40	10:31:00	12:30:00	12:42:00
9	4	10	2024-01-20	11:00:00	27	11:06:00	13:00:00	13:09:00
10	5	1	2024-01-20	11:30:00	33	11:30:00	13:30:00	13:32:00
\.


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 237
-- Name: boletos_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".boletos_id_seq', 20, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 231
-- Name: buses_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".buses_id_seq', 10, true);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 315
-- Name: estado_bus_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".estado_bus_id_seq', 3, true);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 227
-- Name: rutas_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".rutas_id_seq', 10, true);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 313
-- Name: tipo_tarifa_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".tipo_tarifa_id_seq', 4, true);


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 233
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".usuarios_id_seq', 11, true);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 235
-- Name: viajes_id_seq; Type: SEQUENCE SET; Schema: Yordy Soto; Owner: Comfe_owner
--

SELECT pg_catalog.setval('"Yordy Soto".viajes_id_seq', 10, true);


--
-- TOC entry 3406 (class 2606 OID 1630407)
-- Name: boletos boletos_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".boletos
    ADD CONSTRAINT boletos_pkey PRIMARY KEY (id);


--
-- TOC entry 3398 (class 2606 OID 1630372)
-- Name: buses buses_numero_key; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".buses
    ADD CONSTRAINT buses_numero_key UNIQUE (numero);


--
-- TOC entry 3400 (class 2606 OID 1630370)
-- Name: buses buses_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".buses
    ADD CONSTRAINT buses_pkey PRIMARY KEY (id);


--
-- TOC entry 3410 (class 2606 OID 1794116)
-- Name: estado_bus estado_bus_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".estado_bus
    ADD CONSTRAINT estado_bus_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 1630354)
-- Name: rutas rutas_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".rutas
    ADD CONSTRAINT rutas_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 1794103)
-- Name: tipo_tarifa tipo_tarifa_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".tipo_tarifa
    ADD CONSTRAINT tipo_tarifa_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 1630381)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 1630389)
-- Name: viajes viajes_pkey; Type: CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".viajes
    ADD CONSTRAINT viajes_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 1630413)
-- Name: boletos boletos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".boletos
    ADD CONSTRAINT boletos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES "Yordy Soto".usuarios(id) ON DELETE CASCADE;


--
-- TOC entry 3416 (class 2606 OID 1630408)
-- Name: boletos boletos_viaje_id_fkey; Type: FK CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".boletos
    ADD CONSTRAINT boletos_viaje_id_fkey FOREIGN KEY (viaje_id) REFERENCES "Yordy Soto".viajes(id) ON DELETE CASCADE;


--
-- TOC entry 3411 (class 2606 OID 1794117)
-- Name: buses fk_estado_bus; Type: FK CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".buses
    ADD CONSTRAINT fk_estado_bus FOREIGN KEY (estado_bus_id) REFERENCES "Yordy Soto".estado_bus(id);


--
-- TOC entry 3412 (class 2606 OID 1794104)
-- Name: usuarios fk_tipo_tarifa; Type: FK CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".usuarios
    ADD CONSTRAINT fk_tipo_tarifa FOREIGN KEY (tipo_tarifa_id) REFERENCES "Yordy Soto".tipo_tarifa(id);


--
-- TOC entry 3413 (class 2606 OID 1630395)
-- Name: viajes viajes_bus_id_fkey; Type: FK CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".viajes
    ADD CONSTRAINT viajes_bus_id_fkey FOREIGN KEY (bus_id) REFERENCES "Yordy Soto".buses(id) ON DELETE SET NULL;


--
-- TOC entry 3414 (class 2606 OID 1630390)
-- Name: viajes viajes_ruta_id_fkey; Type: FK CONSTRAINT; Schema: Yordy Soto; Owner: Comfe_owner
--

ALTER TABLE ONLY "Yordy Soto".viajes
    ADD CONSTRAINT viajes_ruta_id_fkey FOREIGN KEY (ruta_id) REFERENCES "Yordy Soto".rutas(id) ON DELETE CASCADE;


-- Completed on 2025-03-07 21:13:56

--
-- PostgreSQL database dump complete
--

