create database jos3;
use jos3;

create table TProfesor(
Id_Profe bigint(20) not null primary key,
Nombre varchar(20) not null,
Apellido Varchar(40) not null,
Categoria int not null,
Salario double not null
);

create table TCurso(
Id_Curso int not null primary key,
Nombre Varchar (40),
Horas Int not null,
Valor Double not null
);

create table TEstudiante(
Id_Estudiante BigInt(11) not null primary key,
Nombre Varchar(20),
Apellido Varchar(40),
Edad Int not null
);

create table TEstudianteXCurso(
Cod_Cur Int not null,
Id_Estu BigInt(11) not null,
Fecha_Ini Date not null,
foreign key (Cod_Cur) references TCurso(Id_Curso),
foreign key (Id_Estu) references TEStudiante(Id_Estudiante)
);

INSERT INTO TProfesor (Id_Profe, Nombre, Apellido, Categoria, Salario) VALUES
(63502720, 'Martha', 'Rojas', 2, 690000),
(91216904, 'Carlos', 'Pérez', 3, 950000),
(13826789, 'Maritza', 'Angarita', 1, 550000),
(1098765789, 'Alejandra', 'Torres', 4, 1100000);


INSERT INTO TCurso (Id_Curso, Nombre, Horas, Valor) VALUES
(149842, 'Fundamentos de bases de datos', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Fundamentos de MySQL', 60, 3000000);


INSERT INTO TEstudiante (Id_Estudiante, Nombre, Apellido, Edad) VALUES
(63502720, 'María', 'Pérez', 20),
(91245678, 'Carlos José', 'López', 30),
(1098098097, 'Jonatan', 'Ardila', 10),
(1098765679, 'Carlos', 'Martínez', 40);


INSERT INTO TEstudianteXCurso (Cod_Cur, Id_Estu, Fecha_Ini) VALUES
(289011, 91245678, '2023-02-01'),
(250067, 63502720, '2023-03-01'),
(289011, 1098098097, '2023-02-01'),
(345671, 63502720, '2023-04-01');


/* A. Mostrar los salarios de los profesores ordenados por categoría. */
SELECT Salario FROM TProfesor ORDER BY Categoria;

/* B. Mostrar los cursos cuyo valor sea mayor a $500.000. */
SELECT * FROM TCurso WHERE Valor > 500000;

/* C. Contar el número de estudiantes cuya edad sea mayor a 20.*/
SELECT COUNT(*) FROM TEstudiante WHERE Edad > 20;

/* D. Mostrar el nombre y la edad del estudiante más joven.*/
SELECT Nombre, Edad FROM TEstudiante ORDER BY Edad ASC LIMIT 1;

/* E. Calcular el valor promedio de los cursos cuyas horas sean mayores a 40.*/
SELECT AVG(Valor) FROM TCurso WHERE Horas > 40;

/* F. Obtener el sueldo promedio de los profesores de la categoría 1. */
SELECT AVG(Salario) FROM TProfesor WHERE Categoria = 1;

/* G. Mostrar todos los campos de la tabla curso en orden descendente según el valor. */
SELECT * FROM TCurso ORDER BY Valor DESC;

/* H. Mostrar el nombre del profesor con menor sueldo.*/
SELECT Nombre FROM TProfesor ORDER BY Salario ASC LIMIT 1;

/* I. Visualizar los profesores cuyo sueldo este entre $500.000 y $700.000.*/
SELECT * FROM TProfesor WHERE Salario BETWEEN 500000 AND 700000;

/* J. Listar todos los estudiantes que iniciaron curso en Enero y Febrero del 2023.*/
SELECT * FROM TEstudiante WHERE Id_Estudiante IN (SELECT Id_Estu FROM TEstudianteXCurso WHERE Fecha_Ini BETWEEN '2023-01-01' AND '2023-02-28');

/* K. Mostrar los nombre de los estudiantes sin repeticiones.L. Visualizar el nombre del Curso, las Horas del curso mas costoso.*/
SELECT DISTINCT Nombre FROM TEstudiante;

/* L. Visualizar el nombre del Curso, las Horas del curso mas costoso.*/
SELECT Nombre, Horas FROM TCurso ORDER BY Valor DESC LIMIT 1;

/* M. Visualizar todos los Estudiantes organizados por apellido.*/
SELECT * FROM TEstudiante ORDER BY Apellido;