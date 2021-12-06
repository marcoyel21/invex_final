CREATE DATABASE invex
    WITH 
    OWNER = docker
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Table: public.carteras

-- DROP TABLE IF EXISTS public.carteras;

CREATE TABLE IF NOT EXISTS public.carteras
(
    nombre_fondo character varying(15) COLLATE pg_catalog."default" NOT NULL,
    fecha character varying(15) COLLATE pg_catalog."default",
    calificacion character varying(30) COLLATE pg_catalog."default",
    valor_total character varying(50) COLLATE pg_catalog."default",
    var_establecido character varying(15) COLLATE pg_catalog."default",
    var_promedio character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT carteras_pkey PRIMARY KEY (nombre_fondo)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.carteras
    OWNER to docker;
	
COPY carteras FROM '/docker-entrypoint-initdb.d/carteras_invex_sem.txt' (DELIMITER(' '));

-- Table: public.composicion

-- DROP TABLE IF EXISTS public.composicion;

CREATE TABLE IF NOT EXISTS public.composicion
(
    clasificacion character varying(50) COLLATE pg_catalog."default",
    fecha character varying(50) COLLATE pg_catalog."default",
    tipo_valor character varying(50) COLLATE pg_catalog."default",
    emisora character varying(50) COLLATE pg_catalog."default",
    serie character varying(50) COLLATE pg_catalog."default",
    calificacion character varying(50) COLLATE pg_catalog."default",
    importe_mercado character varying(50) COLLATE pg_catalog."default",
    porcentaje character varying(50) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.composicion
    OWNER to docker;
	
COPY composicion FROM '/docker-entrypoint-initdb.d/composicion_invex_sem.txt' (DELIMITER(' '));

SELECT serie, calificacion, importe_mercado, porcentaje FROM composicion;
-- Exportar un txt de este query 