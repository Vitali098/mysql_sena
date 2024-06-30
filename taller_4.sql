create database tall_3;
use tall_3;

create table TCliente(
id_cli BigInt primary key not null,
nom_cli Varchar(30)  not null,
ape_cli Varchar (40)  not null,
dir_cli Varchar (100)  not null,
dep_cli Varchar (30)  not null,
mes_cum_cli Varchar (20)  not null
);

insert into TCliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
values
    (1, 'Maritza', 'Rojas', 'Calle 34 No. 14-45', 'Cordoba', 'Abril'),
    (2, 'Roger', 'Ariza', 'Cra 30 No. 13-45', 'Atlantico', 'Junio'),
    (3, 'Juan Carlos', 'Arenas', 'Diagonal 23 No. 12-34 apto 101', 'Bolivar', 'Marzo'),
    (4, 'Catalina', 'Zapata', 'Av. El Libertador No. 30-14', 'Magdalena', 'Marzo'),
	(5, 'Pedro', 'González', 'Calle 10 No. 20-30', 'Cundinamarca', 'Mayo'),
    (6, 'Laura', 'López', 'Carrera 50 No. 15-25', 'Valle del Cauca', 'Septiembre');


create table TLibro(
id_lib  Int auto_increment primary key not null,
tit_lib Varchar (100) not null,
aut_lib Varchar (100) not null,
edi_lib Varchar (300) not null,
pre_lib Decimal (10,2) not null
);

insert into TLibro (id_lib, tit_lib, aut_lib, edi_lib, pre_lib)
values
    (1, 'Redes cisco', 'Ernesto Arigasello', 'Alfaomega - Rama', '$60.000'),
    (2, 'Facebook y Twitter', 'Veloso Claudio', 'Alfaomega', '$52.000'),
    (3, 'Creación de un portal con php y mysql', 'Jacob Pavón Puertas', 'Alfaomega - Rama', '$40.000'),
    (4, 'Administración de sistemas operativos', 'Julio Gómez López', 'Alfaomega - Rama', '$55.000'),
    (5, 'Introducción a la Programación', 'María Sánchez', 'Editorial X', '$45.000'),
    (6, 'Diseño de Interfaces de Usuario', 'Carlos Martínez', 'Editorial Y', '$58.000');

create table TPedido(
id_ped Int auto_increment primary key not null,
Fec_ped Date,
val_ped Int,
id_cli_ped BigInt,
foreign key (id_cli_ped) references TCliente(id_cli)
);

insert into TPedido (id_ped, id_cli_ped, Fec_ped, val_ped)
values
    (1, 1, '2012-02-25', '$95.000'),
    (2, 2, '2012-04-30', '$60.000'),
    (3, 3, '2011-12-10', '$92.000'),
    (4, 4, '2012-02-25', '$60.000'),
	(5, 5, '2012-06-15', '$75.000'),
    (6, 6, '2012-08-20', '$85.000');



create table TLibrosXPedido(
id_ped_artped  Int not null,
id_lib_artped  Int not null,
can_art_artped int not null,
val_ven_artped Decimal (10,2),
primary key (id_ped_artped, id_lib_artped),
foreign key (id_ped_artped) references TPedido(id_ped),
foreign key (id_lib_artped) references TLibro(id_lib)
);

insert into TLibrosXPedido (id_ped_artped, id_lib_artped, can_art_artped, val_ven_artped)
values
    (1, 1, 3, '$40.000'),
    (2, 1, 4, '$55.000'),
    (3, 2, 1, '$60.000'),
    (4, 3, 2, '$52.000'),
    (5, 3, 3, '$40.000'),
    (6, 4, 1, '$60.000');
    
/* A. Listar todos los pedidos realizados incluyendo el nombre y autor del Libro */
SELECT TP.id_ped AS Pedido_ID, TP.Fec_ped AS Fecha_Pedido, TP.val_ped AS Valor_Pedido, 
       TL.tit_lib AS Titulo_Libro, TL.aut_lib AS Autor_Libro
FROM TPedido TP
INNER JOIN TLibrosXPedido TXP ON TP.id_ped = TXP.id_ped_artped
INNER JOIN TLibro TL ON TXP.id_lib_artped = TL.id_lib;

/*  B. Visualizar los clientes que cumplen años en marzo */
SELECT id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli
FROM TCliente
WHERE mes_cum_cli = 'Marzo';

/* C. Mostrar el precio máximo del libro por editorial */
SELECT edi_lib AS Editorial, MAX(pre_lib) AS Precio_Maximo_por_Editorial
FROM TLibro
GROUP BY edi_lib;

/* D. Visualizar los datos del pedido 1, incluyendo el nombre del cliente, la dirección del mismo, el departamento y el valor, nombre, editorial de los Libros que tiene dicho pedido */
SELECT TP.id_ped AS Pedido_ID, TC.nom_cli AS Nombre_Cliente, TC.dir_cli AS Direccion_Cliente, TC.dep_cli AS Departamento,
       TP.val_ped AS Valor_Pedido, TL.tit_lib AS Titulo_Libro, TL.edi_lib AS Editorial_Libro
FROM TPedido TP
INNER JOIN TCliente TC ON TP.id_cli_ped = TC.id_cli
INNER JOIN TLibrosXPedido TXP ON TP.id_ped = TXP.id_ped_artped
INNER JOIN TLibro TL ON TXP.id_lib_artped = TL.id_lib
WHERE TP.id_ped = 1;

/* E. Visualizar nombres de clientes, las fechas y los valores de los pedidos */
SELECT TC.nom_cli AS Nombre_Cliente, TP.Fec_ped AS Fecha_Pedido, TP.val_ped AS Valor_Pedido
FROM TPedido TP
INNER JOIN TCliente TC ON TP.id_cli_ped = TC.id_cli;

/* F. Mostrar cuál es el pedido más costoso y cuál es el menos costoso */
SELECT MAX(val_ped) AS Pedido_Mas_Costoso, MIN(val_ped) AS Pedido_Menos_Costoso
FROM TPedido;

/* G. Mostrar cuantos libros se tienen de cada editorial */
SELECT edi_lib AS Editorial, COUNT(*) AS Cantidad_Libros
FROM TLibro
GROUP BY edi_lib;

/* H. Mostrar los pedidos con los respectivos libros (código libro, nombre, valor y cantidad pedida) */
SELECT TP.id_ped AS Pedido_ID, TL.id_lib AS Codigo_Libro, TL.tit_lib AS Nombre_Libro, TL.pre_lib AS Precio_Libro, TXP.can_art_artped AS Cantidad_Pedida
FROM TPedido TP
INNER JOIN TLibrosXPedido TXP ON TP.id_ped = TXP.id_ped_artped
INNER JOIN TLibro TL ON TXP.id_lib_artped = TL.id_lib;

/* I. Visualizar todos los clientes organizados por apellido */
SELECT *
FROM TCliente
ORDER BY ape_cli;

/* J. Visualizar todos los Libros organizados por autor */
SELECT *
FROM TLibro
ORDER BY aut_lib;

/* K. Visualizar los pedidos que se han realizado para el Libro con id 3 */
SELECT TP.id_ped AS Pedido_ID, TC.nom_cli AS Nombre_Cliente, TC.ape_cli AS Apellido_Cliente, TC.dir_cli AS Direccion_Cliente,
       TP.Fec_ped AS Fecha_Pedido, TXP.can_art_artped AS Cantidad_Solicitada,
       TL.tit_lib AS Titulo_Libro, TL.edi_lib AS Editorial_Libro
FROM TPedido TP
INNER JOIN TCliente TC ON TP.id_cli_ped = TC.id_cli
INNER JOIN TLibrosXPedido TXP ON TP.id_ped = TXP.id_ped_artped
INNER JOIN TLibro TL ON TXP.id_lib_artped = TL.id_lib
WHERE TL.id_lib = 3;


