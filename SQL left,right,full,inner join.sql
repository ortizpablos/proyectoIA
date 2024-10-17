create database tienda1

use tienda1

create table clientes (
id_cliente int  primary key identity(1,1)not null,
nombre_cliente nvarchar(50) not null,
ciudad_cliente nvarchar(50) not null
);

create table pedidos(
id_pedido int primary key identity(1,1) not null,
descripcion_pedido nvarchar(50) not null,
fecha_pedido date not null,
id_cliente int not null
);

ALTER TABLE clientes
ADD CONSTRAINT fk_clientes_pedidos
foreign key (id_cliente) references clientes(id_cliente);

INSERT INTO clientes (nombre_cliente, ciudad_cliente) VALUES
('Maria Gonzalez', 'Bogotá'),
('Carlos Ramirez', 'Cali'),
('Ana Torres', 'Medellín'),
('Luis Fernandez', 'Barranquilla'),
('Sofia Mendoza', 'Cartagena'),
('Jorge Rojas', 'Pereira'),
('Valentina Martinez', ' '),
('Pedro Castro', 'Bucaramanga'),
('Camila Suarez', 'Armenia'),
('Miguel Lopez', 'Cúcuta'),
('Laura Gutierrez', 'Neiva'),
('Andres Morales', 'Villavicencio'),
('Daniela Ortiz', 'Ibagué'),
('Felipe Navarro', ' '),
('Diana Herrera', 'Santa Marta'),
('Juan Carlos Diaz', 'Sincelejo'),
('Gabriela Peña', 'Montería'),
('Mateo Vargas', 'Pasto'),
('Juliana Castillo', 'Florencia'),
('Ricardo Salinas', ' '),
('Juan Perez', 'Popayan');



INSERT INTO pedidos (descripcion_pedido, fecha_pedido, id_cliente) VALUES
('Pedido de laptops', '2024-09-01', 1),
('Compra de escritorios', '2024-09-02', 2),
('Pedido de monitores', '2024-09-03', 5),
('Orden de sillas de oficina', '2024-09-04', 4),
('Compra de impresoras', '2024-09-05', 5),
('Pedido de proyectores', '2024-09-06', 7),
('Compra de tablets', '2024-09-07', 7),
('Pedido de cables HDMI', '2024-09-08', 8),
('Orden de teclados mecánicos', '2024-09-09', 9),
('Compra de ratones ergonómicos', '2024-09-10', 16),
('Pedido de discos duros externos', '2024-09-11', 2),
('Compra de smartphones', '2024-09-12', 12),
('Pedido de cámaras de seguridad', '2024-09-13', 13),
('Compra de routers Wi-Fi', '2024-09-14', 2),
('Pedido de servidores dedicados', '2024-09-15', 15),
('Orden de equipos de sonido', '2024-09-16', 16),
('Compra de proyectores 4K', '2024-09-17', 17),
('Pedido de software de diseño gráfico', '2024-09-18', 10),
('Compra de unidades SSD', '2024-09-19', 2), 
('Pedido de tarjetas gráficas', '2024-09-20', 20);


select *
from pedidos;

select 
	clientes.id_cliente,
	clientes.nombre_cliente,
	pedidos.id_pedido,
	pedidos.descripcion_pedido
from clientes
inner join 
	pedidos on clientes.id_cliente = pedidos.id_cliente;

select 
	clientes.id_cliente,
	clientes.nombre_cliente,
	pedidos.id_pedido,
	pedidos.descripcion_pedido
from clientes
left join 
	pedidos on clientes.id_cliente = pedidos.id_cliente;

select 
	clientes.id_cliente,
	clientes.nombre_cliente,
	pedidos.id_pedido,
	pedidos.descripcion_pedido
from clientes
right join 
	pedidos on clientes.id_cliente = pedidos.id_cliente;

select 
	clientes.id_cliente,
	clientes.nombre_cliente,
	pedidos.id_pedido,
	pedidos.descripcion_pedido
from clientes
full join 
	pedidos on clientes.id_cliente = pedidos.id_cliente;





