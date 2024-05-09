--Insercion de datos




INSERT INTO pais (id_pais, nombre_pais) VALUES
(1, 'España'),
(2, 'Francia'),
(3, 'Alemania'),
(4, 'Italia'),
(5, 'Reino Unido');



INSERT INTO ciudad (id_ciudad, nombre_ciudad, codigo_postal, id_pais) VALUES
(1, 'Madrid', '28001', 1),
(2, 'Fuenlabrada', '08001', 1),
(3, 'París', '75001', 2),
(4, 'Marsella', '13001', 2),
(5, 'Berlín', '10115', 3),
(6, 'Múnich', '80331', 3),
(7, 'Roma', '00100', 4),
(8, 'Milán', '20121', 4),
(9, 'Londres', 'SW1A 1AA', 5),
(10, 'Manchester', 'M1 1AB', 5);


INSERT INTO oficina (id_oficina, id_ciudad, nombre_pais, telefono, linea_direccion1, linea_direccion2) VALUES
('OF1', 1, 'España', '+34 91 123 4567', 'Calle Mayor', '1A'),
('OF2', 2, 'España', '+34 93 987 6543', 'Rambla Catalunya', '2B'),
('OF3', 3, 'Francia', '+33 1 2345 6789', 'Rue de Rivoli', '3C'),
('OF4', 4, 'Francia', '+33 4 5678 9012', 'Avenue de la Canebière', '4D'),
('OF5', 5, 'Alemania', '+49 30 3456 7890', 'Unter den Linden', '5E'),
('OF6', 6, 'Alemania', '+49 89 6789 0123', 'Marienplatz', '6F'),
('OF7', 7, 'Italia', '+39 06 1234 5678', 'Via Nazionale', '7A'),
('OF8', 8, 'Italia', '+39 02 9876 5432', 'Corso Como', '8B'),
('OF9', 9, 'Reino Unido', '+44 20 1234 5678', 'Buckingham Palace Road', '9C'),
('OF10', 10, 'Reino Unido', '+44 161 987 6543', 'Deansgate', '10D'),
('OF11', 1, 'España', '+34 111 487 8543', 'Eszlaña', '102D');


INSERT INTO puesto (id_puesto, nombre_puesto) VALUES
(1, 'CEO'),
(2, 'Gerente'),
(3, 'Representante de Ventas'),
(4, 'Desarrollador');


INSERT INTO jefe (id_jefe, nombre, apellido1, apellido2, email, id_oficina, id_puesto) VALUES
(7, 'Juan', 'Patroclo', 'García', 'juan.perez@example.com', 'OF1', 1),
(8, 'María', 'López', 'Martínez', 'maria.lopez@example.com', 'OF3', 2),
(9, 'Alberto', 'Soria', NULL, 'albertosoria@example.com', 'OF4', 3);


INSERT INTO empleado (id_empleado, nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, id_puesto) VALUES
(103, 'Marta', 'Rodríguez', 'Gómez', '103', 'marta.rodriguez@example.com', 'OF2', NULL, 2), 
(104, 'Carlos', 'Martín', 'López', '104', 'carlos.martin@example.com', 'OF3', 8, 3), 
(105, 'Laura', 'Sánchez', 'Fernández', '105', 'laura.sanchez@example.com', 'OF7', 7, 4), 
(106, 'Diego', 'Hernández', 'García', '106', 'diego.hernandez@example.com', 'OF7', 7, 3), 
(107, 'Sofía', 'López', 'Martínez', '107', 'sofia.lopez@example.com', 'OF8', 7, NULL), 
(108, 'Elena', 'Gómez', 'Pérez', '108', 'elena.gomez@example.com', 'OF8', 7, NULL), 
(109, 'Luis', 'Martín', 'Sánchez', '109', 'luis.martin@example.com', 'OF9', 9, 3), 
(110, 'Julia', 'García', 'Fernández', '110', 'julia.garcia@example.com', 'OF9', 9, 4), 
(111, 'Marcos', 'Pérez', 'Gómez', '111', 'marcos.perez@example.com', 'OF10', 8, 3),
(30, 'James', 'Locke', 'Fernández', '150', 'James.lrcia@example.com', 'OF1', 8, 4), 
(11, 'Joseph', 'Roblox', 'Gómez', '171', 'marcos.robrez@example.com', 'OF1', 8, 3),
(112, 'Lucía', 'Martínez', 'López', '112', 'lucia.martinez@example.com', NULL, 8, 4); 


INSERT INTO cliente (id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, fax, telefono, id_ciudad, id_direccion, id_empleado_rep_ventas, limite_credito)
VALUES
(1, 'Cliente A', 'Juan', 'Pérez', '123-456-7890', '123-456-7890', 1, 1, 103, 10000.00),
(2, 'Cliente B', 'María', 'Gómez', '987-654-3210', '987-654-3210', 2, 2, 104, 15000.00),
(3, 'Cliente C', 'Pedro', 'Rodríguez', '111-222-3333', '111-222-3333', 1, 1, 105, 20000.00), 
(4, 'Cliente D', 'Ana', 'López', '444-555-6666', '444-555-6666', 4, 4, 107, 25000.00),
(5, 'Cliente E', 'Carlos', 'Martínez', '777-888-9999', '777-888-9999', 1, 5, 30, 30000.00),
(6, 'Cliente F', 'Laura', 'Fernández', '000-111-2222', '000-111-2222', 1, 6, 11, 35000.00),
(7, 'Cliente G', 'Javier', 'Sánchez', '023-521-2122', '120-111-2222', 1, 6, 107, 35000.00),
(8, 'Cliente H', 'Yunikua', 'Falcon', '563-474-5845', '333-444-5555', 7, 7, NULL, 40000.00),
(9, 'Cliente I', 'Chin', 'Orozco', '323-454-1255', '300-404-5555', 7, 7, NULL, 40000.00),
(10, 'Cliente J', 'Jezabel', 'Nobu', '533-234-5675', '313-600-5345', 7, 7, NULL, 40000.00);


INSERT INTO forma_pago (id_forma_pago, nombre_forma_pago) VALUES
(1, 'Transferencia bancaria'),
(2, 'Cheque'),
(3, 'PayPal'),
(4, 'Tarjeta de Credito');

INSERT INTO estado_pedido (id_estado, nombre_estado) VALUES
(1, 'Pendiente'),
(2, 'Procesando'),
(3, 'En tránsito'),
(4, 'Entregado'),
(5, 'Cancelado');


INSERT INTO proveedor (id_proveedor, nombre, id_ciudad)
VALUES
('PROV1', 'Proveedor Luminarias', 1),
('PROV2', 'Proveedor Decoraciones', 2),
('PROV3', 'Proveedor Relojes', 3),
('PROV4', 'Proveedor Música', 4),
('PROV5', 'Proveedor Muebles', 5),
('PROV6', 'Proveedor Astronomía', 6),
('PROV7', 'Proveedor Electrónica', 4),
('PROV8', 'Proveedor Cocina', 3),
('PROV9', 'Proveedor Juguetes', 1),
('PROV10', 'Proveedor Frutales', 2),
('PROV11', 'Proveedor Calzado', 1);


INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen)
VALUES
('Iluminación', 'Descripción de la gama de Iluminación en texto.', '<p>Descripción de la gama de Iluminación en HTML.</p>', 'imagen_iluminacion.jpg'),
('Decoración', 'Descripción de la gama de Decoración en texto.', '<p>Descripción de la gama de Decoración en HTML.</p>', 'imagen_decoracion.jpg'),
('Relojes', 'Descripción de la gama de Relojes en texto.', '<p>Descripción de la gama de Relojes en HTML.</p>', 'imagen_relojes.jpg'),
('Ornamentales', 'Descripción de la gama de Ornamentales en texto.', '<p>Descripción de la gama de Ornamentales en HTML.</p>', 'imagen_ornamentales.jpg'),
('Música', 'Descripción de la gama de Música en texto.', '<p>Descripción de la gama de Música en HTML.</p>', 'imagen_musica.jpg'),
('Muebles', 'Descripción de la gama de Muebles en texto.', '<p>Descripción de la gama de Muebles en HTML.</p>', 'imagen_muebles.jpg'),
('Ciencia', 'Descripción de la gama de Ciencia en texto.', '<p>Descripción de la gama de Ciencia en HTML.</p>', 'imagen_ciencia.jpg'),
('Electrónica', 'Descripción de la gama de Electrónica en texto.', '<p>Descripción de la gama de Electrónica en HTML.</p>', 'imagen_electronica.jpg'),
('Cocina', 'Descripción de la gama de Cocina en texto.', '<p>Descripción de la gama de Cocina en HTML.</p>', 'imagen_cocina.jpg'),
('Juguetes', 'Descripción de la gama de Juguetes en texto.', '<p>Descripción de la gama de Juguetes en HTML.</p>', 'imagen_juguetes.jpg'),
('Frutales', 'Descripción de la gama de Ropa en texto.', '<p>Descripción de la gama de Ropa en HTML.</p>', 'imagen_ropa.jpg'),
('Calzado', 'Descripción de la gama de Calzado en texto.', '<p>Descripción de la gama de Calzado en HTML.</p>', 'imagen_calzado.jpg');

INSERT INTO dimensiones (id_dimensiones, ancho, alto, largo)
VALUES
(1, 20.5, 30.0, 15.0),
(2, 12.0, 25.0, 10.0),
(3, 18.0, 18.0, 3.0),
(4, 100.0, 40.0, 10.0),
(5, 120.0, 80.0, 5.0),
(6, 60.0, 60.0, 30.0),
(7, 40.0, 60.0, 20.0),
(8, 30.0, 20.0, 10.0),
(9, 15.0, 10.0, 5.0),
(10, 50.0, 70.0, 5.0),
(11, 25.0, 15.0, 8.0);

INSERT INTO producto (id_producto, nombre, gama, id_dimensiones, id_proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
VALUES
('PROD1', 'Lámpara de Mesa', 'Iluminación', 1, 'PROV1', 'Lámpara de mesa con diseño moderno.', 100, 70.00, 55.00),
('PROD2', 'Figura Decorativa', 'Decoración', 2, 'PROV2', 'Figura decorativa para el hogar.', 150, 90.00, 75.00),
('PROD3', 'Reloj de Pared', 'Relojes', 3, 'PROV3', 'Reloj de pared con estilo clásico.', 120, 110.00, 95.00),
('PROD4', 'Jarrón de Porcelana', 'Ornamentales', 1, 'PROV1', 'Jarrón de Porcelana de diseño elegante.', 80, 60.00, 45.00),
('PROD5', 'Cuadro Moderno', 'Ornamentales', 2, 'PROV2', 'Cuadro decorativo con estilo moderno.', 150, 80.00, 65.00),
('PROD6', 'Lámpara de Pie', 'Ornamentales', 3, 'PROV3', 'Lámpara de Pie con diseño contemporáneo.', 150, 120.00, 95.00),
('PROD7', 'Guitarra Acústica', 'Música', 4, 'PROV4', 'Guitarra acústica para músicos profesionales.', 70, 400.00, 300.00),
('PROD8', 'Mesa de Comedor', 'Muebles', 5, 'PROV5', 'Mesa de comedor extensible en madera de roble.', 90, 700.00, 500.00),
('PROD9', 'Telescopio Astronómico', 'Ciencia', 6, 'PROV6', 'Telescopio para aficionados a la astronomía.', 120, 300.00, 200.00),
('PROD10', 'Teléfono Inteligente', 'Electrónica', 7, 'PROV7', 'Teléfono inteligente de última generación.', 200, 500.00, 400.00),
('PROD11', 'Robot de Cocina', 'Cocina', 8, 'PROV8', 'Robot de cocina multifunción.', 100, 250.00, 200.00),
('PROD12', 'Set de Construcción', 'Juguetes', 9, 'PROV9', 'Set de construcción para niños.', 300, 30.00, 25.00),
('PROD13', 'Salpicon', 'Frutales', 10, 'PROV10', 'Salpicon deportivo de alta calidad.', 150, 40.00, 30.00),
('PROD14', 'Zapatos de Cuero', 'Calzado', 11, 'PROV11', 'Zapatos de cuero elegantes y duraderos.', 80, 120.00, 90.00),
('PROD15', 'Auriculares Inalámbricos', 'Electrónica', 7, 'PROV7', 'Auriculares inalámbricos con cancelación de ruido.', 120, 150.00, 120.00),
('PROD16', 'Sartén Antiadherente', 'Cocina', 8, 'PROV8', 'Sartén antiadherente de alta resistencia.', 200, 35.00, 25.00),
('PROD17', 'Muñeca de Peluche', 'Juguetes', 9, 'PROV9', 'Muñeca de peluche suave y adorable.', 250, 20.00, 15.00),
('PROD18', 'Piña', 'Frutales', 10, 'PROV10', 'Piña de estilo moderno.', 100, 60.00, 45.00),
('PROD19', 'Botas de Montaña', 'Calzado', 11, 'PROV11', 'Botas de montaña resistentes al agua.', 70, 80.00, 65.00),
('PROD20', 'Cámara Digital', 'Electrónica', 7, 'PROV7', 'Cámara digital compacta de alta resolución.', 180, 300.00, 250.00);

INSERT INTO pago (id_pago, id_cliente, id_forma_pago, fecha_pago, total)
VALUES
(1, 1, 3, '2008-01-15', 100.00),
(2, 2, 2, '2008-05-20', 150.00),
(3, 3, 3, '2008-07-10', 200.00),
(4, 4, 4, '2009-01-05', 250.00),  
(5, 5, 3, '2009-11-30', 300.00),
(6, 5, 2, '2008-12-25', 350.00),
(8, 1, 3, '2008-01-15', 100.00),
(9, 2, 2, '2008-05-20', 150.00),
(10, 3, 3, '2008-07-10', 200.00),
(11, 4, 4, '2009-01-05', 250.00),  
(12, 5, 3, '2009-11-30', 300.00),
(13, 6, 2, '2008-12-25', 350.00),
(14, 1, 3, '2010-09-18', 400.00),
(15, 1, 3, '2008-03-15', 150.00),
(16, 2, 2, '2009-08-20', 200.00),
(17, 3, 3, '2010-01-10', 250.00),
(18, 4, 4, '2008-08-05', 300.00),  
(19, 5, 3, '2009-05-14', 3500.00),
(20, 4, 2, '2010-02-17', 400.00),
(21, 1, 3, '2008-07-10', 450.00),
(22, 2, 2, '2009-12-08', 500.00),
(23, 3, 3, '2010-05-02', 550.00),
(24, 4, 4, '2008-09-20', 600.00),  
(25, 5, 3, '2009-04-14', 650.00),
(26, 2, 2, '2010-03-18', 700.00);


INSERT INTO pedido (id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, id_cliente, metodo_pago, id_pago, id_estado)
VALUES
(1, '2008-01-08', '2008-01-10', '2008-01-11', 'Pedido entregado', 1, 'Transferencia bancaria', NULL, 4),
(2, '2010-05-07', '2010-05-09', '2010-01-10', 'Pedido entregado', 2, 'PayPal', NULL, 4),
(3, '2009-01-06', '2009-01-08', '2009-05-07', 'Pedido procesado', 3, 'Tarjeta de Credito', NULL, 1),
(4, '2008-05-08', '2008-05-10', '2008-06-08', 'Pedido en proceso de preparación', 1, 'PayPal', NULL, 1),
(5, '2010-05-07', '2010-05-09', '2010-03-07', 'Pedido en tránsito', 2, 'Cheque', NULL, 1),
(6, '2009-05-06', '2009-05-08', '2009-04-07', 'Pedido procesado', 3, 'PayPal', NULL, 1),
(8, '2008-05-10', '2008-05-12', '2008-01-10', 'Pedido entregado antes de la fecha esperada', 1, 'Transferencia bancaria', 1, 4),
(9, '2009-05-11', '2009-05-13', '2009-05-11', 'Pedido entregado antes de la fecha esperada', 2, 'PayPal', 2, 4),
(10, '2010-05-12', '2010-05-14', '2010-05-11', 'Pedido entregado antes de la fecha esperada', 3, 'Tarjeta de Credito', 3, 4),
(11, '2008-05-12', '2008-05-14', '2008-05-12', 'Pedido entregado en la fecha esperada', 4, 'Transferencia bancaria', 4, 4),
(12, '2009-05-12', '2009-05-14', '2009-05-13', 'Pedido Cancelado', 5, 'PayPal', 5, 5),
(13, '2008-03-15', '2008-03-17', '2008-03-16', 'Pedido entregado', 1, 'Transferencia bancaria', NULL, 4),
(14, '2009-08-20', '2009-08-22', '2009-08-21', 'Pedido entregado', 2, 'PayPal', NULL, 4),
(15, '2010-01-10', '2010-01-12', '2010-01-11', 'Pedido procesado', 3, 'Tarjeta de Credito', NULL, 1),
(16, '2008-08-05', '2008-08-07', '2008-08-06', 'Pedido en proceso de preparación', 1, 'PayPal', NULL, 1),
(17, '2009-05-14', '2009-05-16', '2009-05-15', 'Pedido en tránsito', 2, 'Cheque', NULL, 1),
(18, '2010-02-17', '2010-02-19', '2010-02-18', 'Pedido procesado', 3, 'PayPal', NULL, 1),
(19, '2008-07-10', '2008-07-12', '2008-07-11', 'Pedido entregado antes de la fecha esperada', 1, 'Transferencia bancaria', NULL, 4),
(20, '2009-12-08', '2009-12-10', '2009-12-09', 'Pedido entregado antes de la fecha esperada', 2, 'PayPal', NULL, 4),
(21, '2010-05-02', '2010-05-04', '2010-05-03', 'Pedido entregado antes de la fecha esperada', 3, 'Tarjeta de Credito', NULL, 4),
(22, '2008-09-20', '2008-09-22', '2008-09-21', 'Pedido entregado en la fecha esperada', 4, 'Transferencia bancaria', NULL, 4),
(23, '2009-04-14', '2009-04-16', '2009-04-15', 'Pedido Cancelado', 5, 'PayPal', NULL, 5),
(24, '2010-03-18', '2010-03-20', '2010-03-19', 'Pedido en proceso', 6, 'Transferencia bancaria', NULL, 1);

INSERT INTO detalle_pedido (id_detalle_pedido, id_pedido, id_producto, cantidad, precio_unidad, numero_linea)
VALUES
(1, 1, 'PROD1', 2, 50.00, 1),
(2, 1, 'PROD2', 1, 100.00, 2),
(3, 2, 'PROD3', 3, 30.00, 1),
(4, 3, 'PROD1', 1, 50.00, 1),
(5, 3, 'PROD3', 2, 30.00, 2),
(6, 13, 'PROD1', 3, 50.00, 1),
(7, 13, 'PROD2', 2, 100.00, 2),
(8, 14, 'PROD3', 3, 30.00, 1),
(9, 15, 'PROD4', 2, 60.00, 1),
(10, 16, 'PROD5', 1, 80.00, 1),
(11, 17, 'PROD6', 3, 120.00, 1),
(12, 18, 'PROD7', 2, 400.00, 1),
(13, 19, 'PROD8', 3, 700.00, 1),
(14, 20, 'PROD9', 12, 3000.00, 1),
(15, 21, 'PROD10', 2, 500.00, 1),
(16, 22, 'PROD11', 1, 250.00, 1),
(17, 23, 'PROD12', 3, 30.00, 1);
