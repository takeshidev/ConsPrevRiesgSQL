-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-08-05 15:55:08 CLT
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

CREATE TABLE asesoria (
    idasesoria           INTEGER NOT NULL,
    casoasesoria_idcaso  INTEGER NOT NULL,
    fechaasesoria        DATE,
    profesional          INTEGER,
    lugar                VARCHAR2(1000 CHAR),
    comentarios          VARCHAR2(1000 CHAR)
);

ALTER TABLE asesoria ADD CONSTRAINT asesoria_pk PRIMARY KEY ( idasesoria );

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

CREATE TABLE casoasesoria (
    idcaso             INTEGER NOT NULL,
    cliente_idcliente  INTEGER NOT NULL,
    codigocontrato     VARCHAR2(100 CHAR),
    plan               VARCHAR2(100 CHAR),
    contacto           VARCHAR2(100 CHAR),
    casoactivo         VARCHAR2(100 CHAR)
);

ALTER TABLE casoasesoria ADD CONSTRAINT casoasesoria_pk PRIMARY KEY ( idcaso );

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

ALTER TABLE asesoria
    ADD CONSTRAINT asesoria_casoasesoria_fk FOREIGN KEY ( casoasesoria_idcaso )
        REFERENCES casoasesoria ( idcaso );

ALTER TABLE capacitacion
    ADD CONSTRAINT capacitacion_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE casoasesoria
    ADD CONSTRAINT casoasesoria_cliente_fk FOREIGN KEY ( cliente_idcliente )
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

CREATE SEQUENCE asesoria_idasesoria_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER asesoria_idasesoria_trg BEFORE
    INSERT ON asesoria
    FOR EACH ROW
    WHEN ( new.idasesoria IS NULL )
BEGIN
    :new.idasesoria := asesoria_idasesoria_seq.nextval;
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

CREATE SEQUENCE casoasesoria_idcaso_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER casoasesoria_idcaso_trg BEFORE
    INSERT ON casoasesoria
    FOR EACH ROW
    WHEN ( new.idcaso IS NULL )
BEGIN
    :new.idcaso := casoasesoria_idcaso_seq.nextval;
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
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          12
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
-- CREATE SEQUENCE                         12
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
