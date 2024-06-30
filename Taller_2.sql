create database js;
use js;

create table aprendiz(
id_aprendiz int not null,
nombres varchar(45) not null,
apellidos varchar (45) not null,
telefono bigint not null,
ciudad varchar(45) not null,
barrio varchar (45) not null,
email varchar (45) not null,
fecha_ingreso date not null,
primary key (id_aprendiz)
);

create table materia(
cod_consecutivo int not null,
cod_materia int not null,
descripcion text not null,
id_estudiante int not null,
nota int not null,
id_instructor int not null,
Primary key (cod_consecutivo, cod_materia),
foreign key (id_estudiante) references aprendiz (id_aprendiz),
foreign key (id_instructor) references Instructor (id_instructor)
);

create table Instructor(
id_instructor int not null,
nombres varchar(45) not null,
apellidos varchar(45) not null,
telefono int not null,
ciudad varchar(45) not null,
barrio varchar (45) not null,
email varchar (45) not null,
profesion varchar (45) not null,
primary key(id_instructor)
);


select*from aprendiz;
insert into aprendiz (id_aprendiz, nombres, apellidos, telefono, ciudad, barrio, email, fecha_ingreso) values ("72642987", "Juan A", "Alvarez C", "30065478", "Barranquilla", "Chiquira", "JuanA@gmail.com", "2023-05-12");
insert into aprendiz (id_aprendiz, nombres, apellidos, telefono, ciudad, barrio, email, fecha_ingreso) values ("1048562987", "Karla", "Morales", "31065477", "Soledad", "Hipodromo", "JuanA@hotmail.com", "2021-05-1");
insert into aprendiz (id_aprendiz, nombres, apellidos, telefono, ciudad, barrio, email, fecha_ingreso) values ("1007556954", "Ivan", "Gamero", "0", "Barranquilla", "Sevillar", "Ivanga@gmail.com", "2023-03-20");
insert into aprendiz (id_aprendiz, nombres, apellidos, telefono, ciudad, barrio, email, fecha_ingreso) values ("55930412", "manuel", "ospino", "3212223", "Soledad", "Ciudad jardin", "manue@hotmail.com", "2022-12-02");
insert into aprendiz (id_aprendiz, nombres, apellidos, telefono, ciudad, barrio, email, fecha_ingreso) values ("55842632", "Brandon", "Vargas", "312543676", "Soledad", "Boston", "brandon123@hotmail.com", "2019-02-15");
insert into aprendiz (id_aprendiz, nombres, apellidos, telefono, ciudad, barrio, email, fecha_ingreso) values ("1048562988", "Camilo", "Olaya", "3047284", "Barranquilla", "El Rosario", "olaya67@hotmail.com", "2020-09-12");

select*from Instructor;
insert into Instructor (Id_instructor, nombres, Apellidos, Telefono, Ciudad, Barrio, Email, profesion)  values ("22330451", "Patricia", "manjarrez", "3280628", "Barranquilla", "Miramar", "Patricia.manjarrez@gmail.com", "Ingeniera de sistemas");
insert into Instructor (Id_instructor, nombres, Apellidos, Telefono, Ciudad, Barrio, Email, profesion)  values ("1045621457", "ramiro", "null", "321621357", "Barranquilla", "El Prado", "ramiro.esc@hotmail.com", "tecnologo en Adso");
insert into Instructor (Id_instructor, nombres, Apellidos, Telefono, Ciudad, Barrio, Email, profesion)  values ("72642987", "Juan A", "Alvarez C", "30065478", "Barranquilla", "Chiquira", "JuanA@gmail.com", "tecnologo en Adso");
insert into Instructor (Id_instructor, nombres, Apellidos, Telefono, Ciudad, Barrio, Email, profesion)  values ("104562444", "Jose", "null", "3125431213", "Barranquilla", "El bosque", "josedelcarmen123@hotmail.", "Ingeniero en sistemas");
insert into Instructor (Id_instructor, nombres, Apellidos, Telefono, Ciudad, Barrio, Email, profesion)  values ("726536344", "juan", "Del Carmen", "3124231123", "Barranquilla", "El carrique", "juan1234@gmail.com", "Pro master en ciberceguridad");

select*from materia;
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("1", "001", "Programacion orientada a Objetos", "72642987", "7.2", "22330451");
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("2", "002", "Base de Datos", "1048562987", "5.2", "22330451");
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("3", "003", "Programacion en Java", "1048562987", "9.2", "1045621457");
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("4", "003", "Programacion en Java", "55930412", "9.2", "1045621457");
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("5", "002", "Base de Datos Mysql", "72642987", "5.2", "72642987");
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("6", "001", "Programacion orientada a Objetos", "1048562987", "7.2", "72642987");
insert into materia (cod_consecutivo, cod_materia, descripcion, id_estudiante, nota, id_instructor)  values ("7", "004", "Base de datos", "1048562988", "2.2", "726536344");
insert into materia (Cod_consecutivo, Cod_materia, Descripcion, id_estudiante, Nota, id_instructor)  values ("8", "001", "Programacion orientada a Objetos", "55842632", "9", "104562444");


/* Actualiza los nombres, apellidos, telefono del Aprendiz donde su id=55930412 */
update aprendiz set nombres= "Teplon", Telefono = 22123123, Apellidos="Simanca"  where id_aprendiz=55930412;

/* Consulte los datos que hay en la tabla Aprendiz donde su id=55930412 */
select * from aprendiz where id_aprendiz=55930412;

/* Actualiza en la tabla Materia los códigos de la materias y el nombre de la materias (campo
descripcion) donde id_estudiante=72642987 */
update materia set cod_materia= "006", Descripcion="Ingeniero en sistemas" where id_estudiante=72642987;

/* Mostrar registos de la tabla Materia donde id_estudiante=72642987 */
select * from materia where id_estudiante=72642987;

/* Elimine de la tabla Aprendiz el ultimo registro */
delete from aprendiz where id_aprendiz=1048562988;
delete from aprendiz order by id_aprendiz desc limit 1;
delete from aprendiz where id_aprendiz = last_insert_id();
delete from aprendiz where id_aprendiz = (select * from (select max(id_aprendiz) from aprendiz));