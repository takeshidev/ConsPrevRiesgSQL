
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


