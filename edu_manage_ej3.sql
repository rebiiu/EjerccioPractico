DROP DATABASE IF EXISTS edu_manage;

CREATE DATABASE edu_manage;
USE edu_manage;

CREATE TABLE tb_profesores(
id_profesor CHAR(36) PRIMARY KEY DEFAULT UUID(),
nombre VARCHAR(100),
apellido VARCHAR(100),
correo_electronico VARCHAR(100) unique
);

CREATE TABLE tb_materias(
id_materia CHAR(36) PRIMARY KEY DEFAULT UUID(),
nombre_materia VARCHAR(100),
grupo_materia CHAR,
id_profesor CHAR ,
cupos INT,
FOREIGN KEY (id_profesor) REFERENCES tb_profesores(id_profesor)
);

CREATE TABLE tb_alumnos(
id_alumno CHAR(36) PRIMARY KEY DEFAULT UUID(),
carnet_alumno VARCHAR(10) UNIQUE,
nombre_alumno VARCHAR(50),
apellido_alumno VARCHAR(50),
edad_alumno INT
);

CREATE TABLE tb_inscripciones(
id_inscripcion CHAR(36) PRIMARY KEY DEFAULT UUID(),
id_alumno CHAR,
id_materia CHAR,
fecha_inscripcion DATE,
estado ENUM ('Activo', 'Inactivo'),
FOREIGN KEY (id_alumno) REFERENCES tb_alumnos(id_alumno)
);

CREATE TABLE tb_calificaciones(
id_calificacion CHAR(36) PRIMARY KEY DEFAULT UUID(),
id_inscripcion CHAR,
calificacion_final DECIMAL(5,2) CHECK (calificacion_final >= 0),
fecha_calificacion DATE,
FOREIGN KEY (id_inscripcion) REFERENCES tb_inscripciones(id_inscripcion)
);

/*--------INSERCIÓN DE DATOS---------------------*/

DELIMITER //

CREATE PROCEDURE agregar_profesor(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_correo_electronico VARCHAR(100)
)
BEGIN
    DECLARE p_id_profesor CHAR(36);

    SET p_id_profesor = UUID();

    INSERT INTO tb_profesores (id_profesor, nombre, apellido, correo_electronico) 
    VALUES (p_id_profesor, p_nombre, p_apellido, p_correo_electronico);
END//

DELIMITER ;

CALL agregar_profesor('Nombre', 'Apellido', 'correo@example.com');
CALL agregar_profesor('Nombre1', 'Apellido1', 'correo1@example.com');
CALL agregar_profesor('Nombre2', 'Apellido2', 'correo2@example.com');
CALL agregar_profesor('Nombre3', 'Apellido3', 'correo3@example.com');
CALL agregar_profesor('Nombre4', 'Apellido4', 'correo4@example.com');
CALL agregar_profesor('Nombre5', 'Apellido5', 'correo5@example.com');
CALL agregar_profesor('Nombre6', 'Apellido6', 'correo6@example.com');
CALL agregar_profesor('Nombre7', 'Apellido7', 'correo7@example.com');
CALL agregar_profesor('Nombre8', 'Apellido8', 'correo8@example.com');
CALL agregar_profesor('Nombre9', 'Apellido9', 'correo9@example.com');
CALL agregar_profesor('Nombre10', 'Apellido10', 'correo10@example.com');
CALL agregar_profesor('Nombre11', 'Apellido11', 'correo11@example.com');
CALL agregar_profesor('Nombre12', 'Apellido12', 'correo12@example.com');
CALL agregar_profesor('Nombre13', 'Apellido13', 'correo13@example.com');
CALL agregar_profesor('Nombre14', 'Apellido14', 'correo14@example.com');

SELECT * FROM tb_profesores;


/*--------Materia---------------------*/

DELIMITER //

CREATE PROCEDURE agregar_materia(
    IN p_nombre_materia VARCHAR(100),
    IN p_grupo_materia CHAR(1),
    IN p_id_profesor CHAR(36),
    IN p_cupos INT
)
BEGIN
    DECLARE p_id_materia CHAR(36);

    SET p_id_materia = UUID();

    INSERT INTO tb_materias (id_materia, nombre_materia, grupo_materia, id_profesor, cupos) 
    VALUES (p_id_materia, p_nombre_materia, p_grupo_materia, p_id_profesor, p_cupos);
END//

DELIMITER ;

CALL agregar_materia('Matemáticas', '1', '287bf', 30);
CALL agregar_materia('Matemáticas1', '2', '287ca', 30);
CALL agregar_materia('Matemáticas2', '3', '287d7', 30);
CALL agregar_materia('Matemáticas3', '4', '287dd', 30);
CALL agregar_materia('Matemáticas4', '5', '287e3', 30);
CALL agregar_materia('Matemáticas5', '6', '287e6', 30);
CALL agregar_materia('Matemáticas6', '7', '287ea', 30);
CALL agregar_materia('Matemáticas7', '8', '287ee', 30);
CALL agregar_materia('Matemáticas8', '9', '287f1', 30);
CALL agregar_materia('Matemáticas9', 'a', '287f5', 30);
CALL agregar_materia('Matemáticas10', 'b', '287f8', 30);
CALL agregar_materia('Matemáticas11', 'c', '287fc', 30);
CALL agregar_materia('Matemáticas12', 'd', '287ff', 30);
CALL agregar_materia('Matemáticas13', 'e', '28803', 30);
CALL agregar_materia('Matemáticas14', 'f', '28806', 30);

SELECT * FROM tb_materias;



/*--------Alumno---------------------*/

DELIMITER //


CREATE PROCEDURE insertar_alumno(
    IN p_carnet_alumno VARCHAR(10),
    IN p_nombre_alumno VARCHAR(50),
    IN p_apellido_alumno VARCHAR(50),
    IN p_edad_alumno INT
)
BEGIN
    DECLARE p_id_alumno CHAR(36);

    SET p_id_alumno = UUID();

    INSERT INTO tb_alumnos (id_alumno, carnet_alumno, nombre_alumno, apellido_alumno, edad_alumno) 
    VALUES (p_id_alumno, p_carnet_alumno, p_nombre_alumno, p_apellido_alumno, p_edad_alumno);
END//

DELIMITER ;

CALL insertar_alumno('0001', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0002', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0003', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0004', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0005', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0006', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0007', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0008', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0009', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0010', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0011', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0012', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0013', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0014', 'Juan', 'Pérez', 25);
CALL insertar_alumno('0015', 'Juan', 'Pérez', 25);

SELECT * FROM tb_alumnos;


/*--------Inscripcion---------------------*/

DELIMITER //

CREATE PROCEDURE insertar_inscripcion(
    IN p_id_alumno CHAR(36),
    IN p_id_materia CHAR(36),
    IN p_fecha_inscripcion DATE,
    IN p_estado ENUM('Activo', 'Inactivo')
)
BEGIN
    DECLARE p_id_inscripcion CHAR(36);

    SET p_id_inscripcion = UUID();

    INSERT INTO tb_inscripciones (id_inscripcion, id_alumno, id_materia, fecha_inscripcion, estado) 
    VALUES (p_id_inscripcion, p_id_alumno, p_id_materia, p_fecha_inscripcion, p_estado);
END//

DELIMITER ;

CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');
CALL insertar_inscripcion('id_del_alumno', 'id_de_la_materia', '2024-02-28', 'Activo');

SELECT * FROM tb_inscripciones;


/*--------Calificacion---------------------*/

DELIMITER //

CREATE PROCEDURE insertar_calificacion(
    IN p_id_inscripcion CHAR(36),
    IN p_calificacion_final DECIMAL(5,2),
    IN p_fecha_calificacion DATE
)
BEGIN
    DECLARE p_id_calificacion CHAR(36);

    SET p_id_calificacion = UUID();

    INSERT INTO tb_calificaciones (id_calificacion, id_inscripcion, calificacion_final, fecha_calificacion) 
    VALUES (p_id_calificacion, p_id_inscripcion, p_calificacion_final, p_fecha_calificacion);
END//

DELIMITER ;

CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');
CALL insertar_calificacion('id_de_la_inscripcion', 95.5, '2024-02-28');


SELECT * FROM tb_calificaciones;

/*--------Trigger---------------------*/


DELIMITER //

CREATE TRIGGER actualizar_cupos_despues_inscripcion
AFTER INSERT ON tb_inscripciones
FOR EACH ROW
BEGIN
    UPDATE tb_materias 
    SET cupos = cupos - 1
    WHERE id_materia = NEW.id_materia;
END//

DELIMITER ;












