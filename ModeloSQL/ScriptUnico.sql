/* 
PARA BORRAR DATOS AUTO GENERADOS POR EL ORACLE
1. Ejecutar query
2. Copiar resultado y ejecutarlo
*/
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
select 'drop sequence ' || sequence_name || ';' from user_sequences;
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
/*
3. Ejecutar el resto del script
*/
-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-07-29 19:00:55 CLT
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

CREATE TABLE checklist (
    idchecklist        INTEGER NOT NULL,
    cliente_idcliente  INTEGER NOT NULL,
    descripcion        VARCHAR2(1000 CHAR),
    status             VARCHAR2(1000 CHAR),
    comentarios        VARCHAR2(1000 CHAR)
);

ALTER TABLE checklist ADD CONSTRAINT checklist_pk PRIMARY KEY ( idchecklist );

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

CREATE TABLE pregunta (
    idpregunta             INTEGER NOT NULL,
    checklist_idchecklist  INTEGER NOT NULL,
    pregunta               VARCHAR2(1000 CHAR),
    respuesta              VARCHAR2(100 CHAR),
    comentarios            VARCHAR2(1000 CHAR)
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta );

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
    fechasolicitud      DATE,
    motivo              VARCHAR2(1000 CHAR),
    preferenciahorario  VARCHAR2(100 CHAR),
    cliente_idcliente   INTEGER NOT NULL,
    status              VARCHAR2(20 CHAR),
    fechaagendada       DATE,
    lugar               VARCHAR2(1000 CHAR),
    contacto            VARCHAR2(1000 CHAR),
    detalle             VARCHAR2(1000 CHAR)
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

ALTER TABLE checklist
    ADD CONSTRAINT checklist_cliente_fk FOREIGN KEY ( cliente_idcliente )
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

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_checklist_fk FOREIGN KEY ( checklist_idchecklist )
        REFERENCES checklist ( idchecklist );

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

CREATE SEQUENCE checklist_idchecklist_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER checklist_idchecklist_trg BEFORE
    INSERT ON checklist
    FOR EACH ROW
    WHEN ( new.idchecklist IS NULL )
BEGIN
    :new.idchecklist := checklist_idchecklist_seq.nextval;
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

CREATE SEQUENCE pregunta_idpregunta_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pregunta_idpregunta_trg BEFORE
    INSERT ON pregunta
    FOR EACH ROW
    WHEN ( new.idpregunta IS NULL )
BEGIN
    :new.idpregunta := pregunta_idpregunta_seq.nextval;
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
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          10
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
-- CREATE SEQUENCE                         10
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
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('admin1', 'admin', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'admin1@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('admin2', 'admin', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'admin2@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente1', 'cliente', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'cliente1@cliente1.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente2', 'cliente', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'cliente2@cliente2.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente3', 'cliente', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'cliente3@cliente3.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('cliente4', 'cliente', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'cliente4@cliente4.com', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev1', 'profesional', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'prev1@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev2', 'profesional', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'prev2@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev3', 'profesional', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'prev3@consultoria.cl', '1');
INSERT INTO "CONSULTORIA"."USUARIO" (USUARIO, TIPOUSUARIO, CLAVE, MAIL, ACTIVO) VALUES ('prev4', 'profesional', '$2a$10$/Vj4nUtV/nBonAnUZ1Ka5.3L1dhy1J6ZPF0lkJftb62CMpHsztHzi', 'prev4@consultoria.cl', '0');

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
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '4', TO_DATE('2020-06-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '3891 Cursus. St.', 'Choque de auto', '2');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '1', TO_DATE('2020-05-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ap #763-9003 A, Road', 'Herida en mano', '3');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '2', TO_DATE('2020-04-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 454, 935 Tincidunt. Street', 'Accidente de bicicleta', '4');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '10', TO_DATE('2020-03-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '692-5815 Lorem Avenue', 'Burn out', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '20', TO_DATE('2020-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 715, 4249 Amet Rd.', 'Torcedura pie', '2');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '10', TO_DATE('2020-01-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '239-6566 Fringilla Avenue', 'Caida misma altura', '3');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '30', TO_DATE('2020-07-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 127, 6093 Est Rd.', 'Choque de auto', '4');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '2', TO_DATE('2020-06-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 484, 1025 Eleifend Rd.', 'Herida en mano', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '4', TO_DATE('2020-05-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ap #641-9627 Diam. Street', 'Accidente de bicicleta', '2');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '20', TO_DATE('2020-04-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '4686 Adipiscing, Rd.', 'Burn out', '3');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Trayecto', '7', TO_DATE('2020-03-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '134-7343 Bibendum Avenue', 'Torcedura pie', '4');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '8', TO_DATE('2020-02-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'P.O. Box 576, 8072 Egestas Street', 'Ataque de histeria', '1');
INSERT INTO "CONSULTORIA"."REPORTEACCIDENTE" (TIPOACCIDENTE, DIASPERDIDOS, FECHAACCIDENTE, LUGARACCIDENTE, DESCRIPCION, CLIENTE_IDCLIENTE) VALUES ('Laboral', '3', TO_DATE('2020-01-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Av la calle 7777', 'Locura espacial', '2');
/* SOLICITUDES ASESORIA */
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (IDSOLICITUD, FECHASOLICITUD, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE, STATUS, FECHAAGENDADA, LUGAR, CONTACTO, DETALLE) VALUES ('1', TO_DATE('2020-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Preparación para auditoria', 'mañana', '1', 'Agendada', TO_DATE('2020-08-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Oficina Central -  Libertador Bernardo O´Higgins N° 1353', 'Alberto Aranguiz', 'Se realiza checklist');
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (IDSOLICITUD, FECHASOLICITUD, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE, STATUS, FECHAAGENDADA, LUGAR, CONTACTO, DETALLE) VALUES ('2', TO_DATE('2020-07-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Implementación plan de seguridad en faena', 'tarde', '2', 'Realizada', TO_DATE('2020-07-05 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Sucursal Condell - Condell N° 495', 'Boris Bascuñan', 'Se realiza preparación para capacitación');
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (IDSOLICITUD, FECHASOLICITUD, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE, STATUS) VALUES ('3', TO_DATE('2020-07-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Revisar accidentabilidad 2020', 'mañana', '3', 'Pendiente');
INSERT INTO "CONSULTORIA"."SOLICITUDASESORIA" (IDSOLICITUD, FECHASOLICITUD, MOTIVO, PREFERENCIAHORARIO, CLIENTE_IDCLIENTE, STATUS) VALUES ('4', TO_DATE('2020-07-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Asesoria para implementacion de comité paritario', 'tarde', '4', 'Pendiente');
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
/* RESETEAR SECUENCIA FACTURA*/ 
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

/*CHECKLIST*/
drop SEQUENCE "CHECKLIST_IDCHECKLIST_SEQ";
CREATE SEQUENCE  "CHECKLIST_IDCHECKLIST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;

INSERT INTO "CONSULTORIA"."CHECKLIST" (CLIENTE_IDCLIENTE, DESCRIPCION, STATUS, COMENTARIOS) VALUES ('1', 'Sitio de Trabajo en General', 'Respondida', 'Persona de contacto no se encontraba disponible. Se realiza checklist con supervisor reemplazante');
INSERT INTO "CONSULTORIA"."CHECKLIST" (CLIENTE_IDCLIENTE, DESCRIPCION, STATUS, COMENTARIOS) VALUES ('2', 'Limpieza y Actividades Sanitarias', 'Respondida', 'sin comentarios');
INSERT INTO "CONSULTORIA"."CHECKLIST" (CLIENTE_IDCLIENTE, DESCRIPCION, STATUS, COMENTARIOS) VALUES ('3', 'Prevención de Incendios', 'Respondida', 'sin comentarios');
INSERT INTO "CONSULTORIA"."CHECKLIST" (CLIENTE_IDCLIENTE, DESCRIPCION, STATUS, COMENTARIOS) VALUES ('4', 'Eléctrico', 'Respondida', 'sin comentarios');
INSERT INTO "CONSULTORIA"."CHECKLIST" (CLIENTE_IDCLIENTE, DESCRIPCION, STATUS, COMENTARIOS) VALUES ('1', 'Equipo de Protección Personal', 'No respondida', 'Pendiente de aplicación');
INSERT INTO "CONSULTORIA"."CHECKLIST" (CLIENTE_IDCLIENTE, DESCRIPCION, STATUS, COMENTARIOS) VALUES ('2', 'Vehículos Motorizados', 'No respondida', 'aplicación pospuesta hasta 2021');

/*PREGUNTAS*/
DROP SEQUENCE "CONSULTORIA"."PREGUNTA_IDPREGUNTA_SEQ";
CREATE SEQUENCE  "PREGUNTA_IDPREGUNTA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;

INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Existen señales o advertencias de seguridad?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('1', '¿Se llevan a cabo reuniones de seguridad con frecuencia?', 'Si', 'Diariamente al inicio de jornada');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Está disponible un botiquín de primeros auxilios y está equipado adecuadamente?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Se ha completado la capacitación de seguridad relacionada con el trabajo?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Se ha establecido un procedimiento para reportar accidentes?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Existe una política para el abuso de sustancias?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Se mantienen registros de las lesiones?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Están puestos a la vista los números de teléfono para emergencias?', 'No');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('1', '¿Son identificadas las rutas de tráfico?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('1', '¿Existen procedimientos para manejar residuos peligrosos?', 'No Aplica', 'No hay residuos peligrosos');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Están las áreas de trabajo generalmente ordenadas y limpias?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Se elimina regularmente la basura y cualquier desecho?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Están limpios los pasillos y pasarelas?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Está el área de trabajo bien iluminada?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Son proporcionados y usados los contenedores para los desechos?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Son adecuadas y están limpias las instalaciones sanitarias?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Existe un suministro adecuado de agua potable?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('2', '¿Existen vasos adecuados para beber agua?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('2', '¿Están disponibles duchas de emergencia?', 'No Aplica', 'No hay residuos peligrosos');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('2', '¿Existen instalaciones disponibles para el lavado de ojos?', 'No', 'Instalación planificada para enero 2021');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Hay un número y tipos adecuados de extintores de fuego?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Es llevada a cabo capacitación para la prevención de incendios y el uso de los extintores de fuego?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('3', '¿Son inspeccionados periódicamente los extintores de fuego?', 'Si', 'Semestralmente acorde a procedimiento');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Está puesto a la vista el número de teléfono del departamento de bomberos?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Es proporcionado un extintor(es) de fuego en el equipo apropiado?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Están los líquidos inflamables almacenados en contenedores aprobados y están correctamente etiquetados?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Están los líquidos inflamables almacenados correctamente?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Está disponible una alarma contra incendios?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('3', '¿Está establecido un plan de evacuación en caso de un incendio?', 'Si', 'Considerar futuros planes de mudanza');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('3', '¿Están protegidos los suministros de combustible de un impacto accidental?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('4', '¿Cuentan los dispositivos eléctricos con una inspección y codificación vigente?', 'Si', 'Acorde a SEC');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA, COMENTARIOS) VALUES ('4', '¿Es proporcionado el mantenimiento apropiado al equipo eléctrico?', 'Si', 'Mantenciones se efectuan con Empresas Naranjo');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Tiene el equipo la conexión a tierra apropiada?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Se ha establecido un programa asegurado de equipo con conexión a tierra?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Son utilizados y probados los circuitos protegidos con interruptores a tierra en los lugares donde se requieren?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Se proporcionan fusibles?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Son comunicados los peligros eléctricos?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Son proporcionados los extintores de fuego apropiados?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Están las cajas eléctricas equipadas con las cubiertas requeridas, y se utiliza la cubierta?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA, RESPUESTA) VALUES ('4', '¿Están etiquetados los circuitos en las cajas eléctricas?', 'Si');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Han sido llevadas a cabo evaluaciones de peligros y han sido éstas certificadas?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Es adecuado el equipo de protección para la exposición?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Se les proporciona a los empleados PPE cada vez que es necesario?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Es utilizado el PPE?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Están capacitados los empleados para usar el PPE?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Se llevan a cabo inspecciones antes y después de usar el PPE?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Está dispone y es utilizado un mantenimiento adecuado y almacenamiento sanitario?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Es proporcionada protección contra caídas adecuada?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Está disponible la protección para los ojos?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('5', '¿Está disponible la protección para la cara (lentes, gafas protectoras, caretas)?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Se inspeccionan y se les da mantenimiento regular a los vehículos motorizados?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Son calificados los operadores de los vehículos motorizados?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Se seguidas las leyes locales y estatales?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Funcionan los frenos, las luces, y los dispositivos de advertencia del vehículo?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Se controlan los límites de peso y el estrés de carga?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Es transportado el personal de manera correcta?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Están en buenas condiciones todos los vidrios del vehículo?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Existen señales de reversa?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Hay extintores de fuego instalados?');
INSERT INTO "CONSULTORIA"."PREGUNTA" (CHECKLIST_IDCHECKLIST, PREGUNTA) VALUES ('6', '¿Son usados los cinturones de seguridad?');


