/* 
PARA BORRAR DATOS AUTO GENERADOS POR EL ORACLE
1. Ejecutar query
2. Copiar resultado y ejecutarlo
*/
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
select 'drop sequence ' || sequence_name || ';' from user_sequences;
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';


-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-07-01 21:20:11 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE actividad (
    idactividad        INTEGER NOT NULL,
    titulo             VARCHAR2(100 CHAR),
    descripcion        VARCHAR2(500 CHAR),
    fechaplazo         DATE,
    status             VARCHAR2(50 CHAR),
    comentario         VARCHAR2(500 CHAR),
    cliente_idcliente  INTEGER NOT NULL
);

ALTER TABLE actividad ADD CONSTRAINT actividad_pk PRIMARY KEY ( idactividad );

CREATE TABLE admin (
    idempleado         INTEGER NOT NULL,
    nombre             VARCHAR2(100 CHAR),
    usuario_idusuario  INTEGER NOT NULL
);

ALTER TABLE admin ADD CONSTRAINT admin_pk PRIMARY KEY ( idempleado );

CREATE TABLE capacitacion (
    idcapacitacion     INTEGER NOT NULL,
    cliente_idcliente  INTEGER NOT NULL,
    tema               VARCHAR2(100 CHAR),
    objetivos          VARCHAR2(1000 CHAR),
    contenidos         VARCHAR2(1000 CHAR),
    recursos           VARCHAR2(1000 CHAR),
    fecha              DATE,
    idusuariopro       INTEGER
);

ALTER TABLE capacitacion ADD CONSTRAINT capacitacion_pk PRIMARY KEY ( idcapacitacion );

CREATE TABLE cliente (
    idcliente          INTEGER NOT NULL,
    nombreempresa      VARCHAR2(100 CHAR),
    rutempresa         VARCHAR2(100 CHAR),
    usuario_idusuario  INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( idcliente );

CREATE TABLE factura (
    idfactura          INTEGER NOT NULL,
    cliente_idcliente  INTEGER NOT NULL,
    fechaemision       DATE,
    fechavencimiento   DATE,
    fechapago          DATE,
    ivaaplicable       NUMBER,
    subtotales         FLOAT(12),
    totales            FLOAT(12)
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( idfactura );

CREATE TABLE item (
    iditem             INTEGER NOT NULL,
    concepto           VARCHAR2(50 CHAR),
    preciounit         FLOAT(12),
    cantidad           FLOAT(12),
    factura_idfactura  INTEGER NOT NULL
);

ALTER TABLE item ADD CONSTRAINT item_pk PRIMARY KEY ( iditem );

CREATE TABLE profesional (
    idempleado         INTEGER NOT NULL,
    nombre             VARCHAR2(100 CHAR),
    usuario_idusuario  INTEGER NOT NULL,
    celular            VARCHAR2(100 CHAR)
);

ALTER TABLE profesional ADD CONSTRAINT profesional_pk PRIMARY KEY ( idempleado );

CREATE TABLE reporteaccidente (
    idreporte          INTEGER NOT NULL,
    tipoaccidente      VARCHAR2(100 CHAR),
    diasperdidos       INTEGER,
    fechaaccidente     DATE,
    lugaraccidente     VARCHAR2(100 CHAR),
    descripcion        VARCHAR2(1000 CHAR),
    cliente_idcliente  INTEGER NOT NULL
);

ALTER TABLE reporteaccidente ADD CONSTRAINT reporteaccidente_pk PRIMARY KEY ( idreporte );

CREATE TABLE solicitudasesoria (
    idsolicitud         INTEGER NOT NULL,
    fechahora           DATE,
    motivo              VARCHAR2(1000 CHAR),
    preferenciahorario  VARCHAR2(100 CHAR),
    cliente_idcliente   INTEGER NOT NULL
);

ALTER TABLE solicitudasesoria ADD CONSTRAINT solicitudasesoria_pk PRIMARY KEY ( idsolicitud );

CREATE TABLE usuario (
    idusuario    INTEGER NOT NULL,
    usuario      VARCHAR2(100 CHAR),
    tipousuario  VARCHAR2(100 CHAR),
    clave        VARCHAR2(100 CHAR),
    mail         VARCHAR2(100 CHAR),
    activo       CHAR(1)
);

COMMENT ON COLUMN usuario.activo IS
    '0= desactivado
1=activo';

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( idusuario );

ALTER TABLE actividad
    ADD CONSTRAINT actividad_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE admin
    ADD CONSTRAINT admin_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE capacitacion
    ADD CONSTRAINT capacitacion_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE item
    ADD CONSTRAINT item_factura_fk FOREIGN KEY ( factura_idfactura )
        REFERENCES factura ( idfactura );

ALTER TABLE profesional
    ADD CONSTRAINT profesional_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE reporteaccidente
    ADD CONSTRAINT reporteaccidente_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE solicitudasesoria
    ADD CONSTRAINT solicitudasesoria_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

CREATE SEQUENCE actividadseq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER actividadtrig BEFORE
    INSERT ON actividad
    FOR EACH ROW
    WHEN ( new.idactividad IS NULL )
BEGIN
    :new.idactividad := actividadseq.nextval;
END;
/

CREATE SEQUENCE capacitacion_idcapacitacion START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER capacitacion_idcapacitacion BEFORE
    INSERT ON capacitacion
    FOR EACH ROW
    WHEN ( new.idcapacitacion IS NULL )
BEGIN
    :new.idcapacitacion := capacitacion_idcapacitacion.nextval;
END;
/

CREATE SEQUENCE cliente_idcliente_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cliente_idcliente_trg BEFORE
    INSERT ON cliente
    FOR EACH ROW
    WHEN ( new.idcliente IS NULL )
BEGIN
    :new.idcliente := cliente_idcliente_seq.nextval;
END;
/

CREATE SEQUENCE factura_idfactura_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER factura_idfactura_trg BEFORE
    INSERT ON factura
    FOR EACH ROW
    WHEN ( new.idfactura IS NULL )
BEGIN
    :new.idfactura := factura_idfactura_seq.nextval;
END;
/

CREATE SEQUENCE item_iditem_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER item_iditem_trg BEFORE
    INSERT ON item
    FOR EACH ROW
    WHEN ( new.iditem IS NULL )
BEGIN
    :new.iditem := item_iditem_seq.nextval;
END;
/

CREATE SEQUENCE reporteaccidente_idreporte_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER reporteaccidente_idreporte_trg BEFORE
    INSERT ON reporteaccidente
    FOR EACH ROW
    WHEN ( new.idreporte IS NULL )
BEGIN
    :new.idreporte := reporteaccidente_idreporte_seq.nextval;
END;
/

CREATE SEQUENCE solicitudasesoria_idsolicitud START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER solicitudasesoria_idsolicitud BEFORE
    INSERT ON solicitudasesoria
    FOR EACH ROW
    WHEN ( new.idsolicitud IS NULL )
BEGIN
    :new.idsolicitud := solicitudasesoria_idsolicitud.nextval;
END;
/

CREATE SEQUENCE usuario_idusuario_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usuario_idusuario_trg BEFORE
    INSERT ON usuario
    FOR EACH ROW
    WHEN ( new.idusuario IS NULL )
BEGIN
    :new.idusuario := usuario_idusuario_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           8
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          8
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
/* RESETEAR SECUENCIA USUARIO*/ 
drop sequence "CONSULTORIA"."USUARIO_IDUSUARIO_SEQ";
CREATE SEQUENCE  "CONSULTORIA"."USUARIO_IDUSUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;

/* USUARIOS */
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('admin1', 'admin', '123', 'admin1@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('admin2', 'admin', '123', 'admin2@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente1', 'cliente', '123', 'cliente1@cliente1.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente2', 'cliente', '123', 'cliente2@cliente2.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente3', 'cliente', '123', 'cliente3@cliente3.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente4', 'cliente', '123', 'cliente4@cliente4.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev1', 'profesional', '123', 'prev1@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev2', 'profesional', '123', 'prev2@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev3', 'profesional', '123', 'prev3@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev4', 'profesional', '123', 'prev4@consultoria.cl', '0');

/* USUARIO ADMIN */
INSERT INTO "CONSULTORIA"."ADMIN" (IDEMPLEADO, NOMBRE, USUARIO_IDUSUARIO) VALUES ('1', 'Juan Administrador', '1');
INSERT INTO "CONSULTORIA"."ADMIN" (IDEMPLEADO, NOMBRE, USUARIO_IDUSUARIO) VALUES ('2', 'Perla Administradora', '2');


/* USUARIO PROFESIONAL */
INSERT INTO "CONSULTORIA"."PROFESIONAL" (IDEMPLEADO, NOMBRE, USUARIO_IDUSUARIO, CELULAR) VALUES ('3', 'Amanda Prevencionista', '7', '+56912340001');
INSERT INTO "CONSULTORIA"."PROFESIONAL" (IDEMPLEADO, NOMBRE, USUARIO_IDUSUARIO, CELULAR) VALUES ('4', 'Braulio  Prevencionista', '8', '+56912340002');
INSERT INTO "CONSULTORIA"."PROFESIONAL" (IDEMPLEADO, NOMBRE, USUARIO_IDUSUARIO, CELULAR) VALUES ('5', 'Catalina  Prevencionista', '9', '+56912340003');
INSERT INTO "CONSULTORIA"."PROFESIONAL" (IDEMPLEADO, NOMBRE, USUARIO_IDUSUARIO, CELULAR) VALUES ('6', 'Danilo  Prevencionista', '10', '+56912340004');


/* RESETEAR SECUENCIA CLIENTE*/ 
drop sequence "CONSULTORIA"."CLIENTE_IDCLIENTE_SEQ";
CREATE SEQUENCE  "CONSULTORIA"."CLIENTE_IDCLIENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;

/* USUARIO CLIENTE */
INSERT INTO "CONSULTORIA"."CLIENTE" (NOMBREEMPRESA, RUTEMPRESA, USUARIO_IDUSUARIO) VALUES ('Empresa Amarillo', '76000001', '3');
INSERT INTO "CONSULTORIA"."CLIENTE" (NOMBREEMPRESA, RUTEMPRESA, USUARIO_IDUSUARIO) VALUES ('Empresa Blanco', '76000002', '4');
INSERT INTO "CONSULTORIA"."CLIENTE" (NOMBREEMPRESA, RUTEMPRESA, USUARIO_IDUSUARIO) VALUES ('Empresa Calipso', '76000003', '5');
INSERT INTO "CONSULTORIA"."CLIENTE" (NOMBREEMPRESA, RUTEMPRESA, USUARIO_IDUSUARIO) VALUES ('Empresa Dorado', '76000004', '6');
/* REPORTES ACCIDENTES*/
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '1', TO_DATE('2020-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 251, 1345 Luctus Av.', 'Caida misma altura', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '4', TO_DATE('2020-07-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '3891 Cursus. St.', 'Choque de auto', '2');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '1', TO_DATE('2020-07-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ap #763-9003 A, Road', 'Herida en mano', '3');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '2', TO_DATE('2020-07-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 454, 935 Tincidunt. Street', 'Accidente de bicicleta', '4');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '10', TO_DATE('2020-07-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '692-5815 Lorem Avenue', 'Burn out', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '20', TO_DATE('2020-07-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 715, 4249 Amet Rd.', 'Torcedura pie', '2');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '10', TO_DATE('2020-07-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '239-6566 Fringilla Avenue', 'Caida misma altura', '3');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '30', TO_DATE('2020-07-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 127, 6093 Est Rd.', 'Choque de auto', '4');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '2', TO_DATE('2020-07-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 484, 1025 Eleifend Rd.', 'Herida en mano', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '4', TO_DATE('2020-07-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ap #641-9627 Diam. Street', 'Accidente de bicicleta', '2');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '20', TO_DATE('2020-07-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '4686 Adipiscing, Rd.', 'Burn out', '3');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '7', TO_DATE('2020-07-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '134-7343 Bibendum Avenue', 'Torcedura pie', '4');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '8', TO_DATE('2020-07-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 576, 8072 Egestas Street', 'Ataque de histeria', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '3', TO_DATE('2020-07-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Av la calle 7777', 'Locura espacial', '2');
/* SOLICITUDES ASESORIA */
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (FECHAHORA, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE) VALUES (TO_DATE('2020-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Preparación para auditoria', 'mañana', '1');
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (FECHAHORA, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE) VALUES (TO_DATE('2020-07-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Implementación plan de seguridad en faena', 'tarde', '2');
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (FECHAHORA, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE) VALUES (TO_DATE('2020-07-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Revisar accidentabilidad 2020', 'mañana', '3');
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (FECHAHORA, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE) VALUES (TO_DATE('2020-07-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Asesoria para implementacion de comité paritario', 'tarde', '4');
/*ACTIVIDADES DE MEJORA */
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Comité Paritario', 'Creación de comité paritario de higiene y seguridad', TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Realizado', 'Comité creado exitosamente. Se cuentan 200 votos', '1');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Comité Paritario', 'Creación de comité paritario de higiene y seguridad', TO_DATE('2020-06-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Realizado', 'Comité creado exitosamente. Se cuentan 157 votos', '2');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Comité Paritario', 'Creación de comité paritario de higiene y seguridad', TO_DATE('2020-08-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'Votacion agendada para ultima semana julio', '3');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Comité Paritario', 'Creación de comité paritario de higiene y seguridad', TO_DATE('2020-10-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'No se registran avances', '4');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Señaletica', 'Renovar señaletica en pasillos de la bodega', TO_DATE('2020-12-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'No se registran avances', '1');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Capacitación Seguridad', 'Realizar capacitación en seguridad de operaciones a equipos de faena', TO_DATE('2020-11-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'No se registran avances', '2');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Derecho a Saber', 'Implementar proceso de capacitación Derecho a Saber para trabajadores nuevos', TO_DATE('2020-04-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Realizado', 'Implementado exitosamente', '3');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Vacunas', 'Implementar operativo de vacunacion influenza', TO_DATE('2020-03-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Realizado', 'Realizado exitosamente', '4');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Elementos Proteccion Personal', 'Comprar cascos y guantes clase 1 para operadores de maquinaria', TO_DATE('2020-10-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'No se registran avances', '1');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Capacitación emergencias', 'Realizar capacitación a equipo en contención de emergencias', TO_DATE('2020-09-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'No se registran avances', '2');
INSERT INTO "CONSULTORIA"."ACTIVIDAD" (TITULO, DESCRIPCION, FECHAPLAZO, STATUS, COMENTARIO, CLIENTE_IDCLIENTE) VALUES ('Mantención maquinas', 'Realizar mantención de maquinaria de envasado', TO_DATE('2020-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Pendiente', 'No se registran avances', '3');
/* CAPACITACIONES */
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('1', 'Derecho a Saber', 'Informar a sus colaboradores sobre los peligros y riesgos que están presentes en sus labores', '* Introduccion *Riesgos *Desarrollo * Preguntas *Cierre', 'Sala, Computador, Notebook', TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '7');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('2', 'Derecho a Saber', 'Informar a sus colaboradores sobre los peligros y riesgos que están presentes en sus labores', '* Introduccion *Riesgos *Desarrollo * Preguntas *Cierre', 'Sala, Computador, Notebook', TO_DATE('2020-06-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('3', 'Derecho a Saber', 'Informar a sus colaboradores sobre los peligros y riesgos que están presentes en sus labores', '* Introduccion *Riesgos *Desarrollo * Preguntas *Cierre', 'Sala, Computador, Notebook', TO_DATE('2020-08-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '9');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('4', 'Derecho a Saber', 'Informar a sus colaboradores sobre los peligros y riesgos que están presentes en sus labores', '* Introduccion *Riesgos *Desarrollo * Preguntas *Cierre', 'Sala, Computador, Notebook', TO_DATE('2020-10-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '10');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('1', 'Operación maquina t-1000', 'Lograr las habilidades para la operación eficiente y segura de la maquina t-1000', '*Introduccion *Encendido *Operación * Mantencion * Apagado', 'Sala, T-1000, repuestos', TO_DATE('2020-12-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '7');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('2', 'Procedimiento empaquetado', 'Conocer las normas de seguridad del procedimiento de  empaquetado', '* Introduccion *Etapa 1 *Etapa2 * Etapa3 *Cierre', 'Sala, Computador, Notebook', TO_DATE('2020-11-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('3', 'Procedimiento emergencias', 'Conocer los procedimientos que deben efectuar los equipos de seguridad en situaciones de emergencia', '*Introduccion *Caso de incendio *Terremoto *Terrorismo *Cierre', 'Sala, Computador, Notebook', TO_DATE('2020-04-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '9');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('4', 'Primeros Auxilios', 'Dominar las tecnicas de primeros auxilios', '*Introduccion * CPR * Entablillado *Cierre', 'Muñeco, Sala, Computador, Notebook', TO_DATE('2020-03-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '10');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('1', 'Primeros Auxilios', 'Dominar las tecnicas de primeros auxilios', '*Introduccion * CPR * Entablillado *Cierre', 'Muñeco, Sala, Computador, Notebook', TO_DATE('2020-10-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '7');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('2', 'Uso de extintores', 'Uso adecuado de extintores portátiles', '*Introduccion *Quimica *El extintor *Proteccion personal', 'Simulador de extintores', TO_DATE('2020-09-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '8');
INSERT INTO "CONSULTORIA"."CAPACITACION" (CLIENTE_IDCLIENTE, TEMA, OBJETIVOS, CONTENIDOS, RECURSOS, FECHA, IDUSUARIOPRO) VALUES ('3', 'Uso de extintores', 'Uso adecuado de extintores portátiles', '*Introduccion *Quimica *El extintor *Proteccion personal', 'Simulador de extintores', TO_DATE('2020-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '9');
/* RESETEAR SECUENCIA USUARIO*/ 
drop sequence "CONSULTORIA"."FACTURA_IDFACTURA_SEQ";
CREATE SEQUENCE  "CONSULTORIA"."FACTURA_IDFACTURA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;


/*FACTURAS*/
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('1', TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('2', TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('3', TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('4', TO_DATE('2020-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('1', TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('2', TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('3', TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, FECHAPAGO, IVAAPLICABLE) VALUES ('4', TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-04-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, IVAAPLICABLE) VALUES ('1', TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, IVAAPLICABLE) VALUES ('2', TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, IVAAPLICABLE) VALUES ('3', TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, IVAAPLICABLE) VALUES ('4', TO_DATE('2020-05-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-05-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, IVAAPLICABLE) VALUES ('1', TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
INSERT INTO "CONSULTORIA"."FACTURA" (CLIENTE_IDCLIENTE, FECHAEMISION, FECHAVENCIMIENTO, IVAAPLICABLE) VALUES ('2', TO_DATE('2020-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-07-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');


/*FACTURAS ITEMS*/
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '1');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '2');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '3');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '4');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '5');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Asesoria extra', '100', '2', '5');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '6');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Asesoria extra', '100', '2', '6');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Informe extra', '10', '3', '6');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '7');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Asesoria extra', '100', '3', '7');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Capacitación extra', '700', '1', '7');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '8');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Asesoria extra', '100', '1', '8');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Capacitación extra', '700', '1', '8');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '9');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '10');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Asesoria extra', '100', '2', '10');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Informe extra', '10', '4', '10');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '11');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Informe extra', '10', '3', '11');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '12');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Modificación checklist', '500', '1', '12');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '13');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Asesoria extra', '100', '2', '13');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Informe extra', '10', '1', '13');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Mensualidad', '1000', '1', '14');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Modificación checklist', '500', '1', '14');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Capacitación extra', '700', '2', '14');
INSERT INTO "CONSULTORIA"."ITEM" (CONCEPTO, PRECIOUNIT, CANTIDAD, FACTURA_IDFACTURA) VALUES ('Informe extra', '10', '4', '14');
