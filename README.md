# GARDEN





```sql

+----------------------------------+
| Tables_in_garden                 |
+----------------------------------+
| ciudad                           |
| cliente                          |
| detalle_pedido                   |
| dimensiones                      |
| direccion                        |
| empleado                         |
| estado_pedido                    |
| forma_pago                       |
| gama_producto                    |
| jefe                             |
| oficina                          |
| pago                             |
| pais                             |
| pedido                           |
| producto                         |
| proveedor                        |
| puesto                           |
| region                           |
| stock                            |
+----------------------------------+
```



# Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   SELECT ofi.id_oficina, c.nombre_ciudad
   FROM oficina AS ofi
   INNER JOIN ciudad AS c ON ofi.id_ciudad = c.id_ciudad;
   
   +------------+---------------+
   | id_oficina | nombre_ciudad |
   +------------+---------------+
   | OF1        | Madrid        |
   | OF11       | Madrid        |
   | OF2        | Fuenlabrada   |
   | OF3        | París         |
   | OF4        | Marsella      |
   | OF5        | Berlín        |
   | OF6        | Múnich        |
   | OF7        | Roma          |
   | OF8        | Milán         |
   | OF9        | Londres       |
   | OF10       | Manchester    |
   +------------+---------------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   SELECT o.id_oficina, c.nombre_ciudad, o.telefono
   
   FROM ciudad  AS c
   
   JOIN oficina o ON c.id_ciudad = o.id_ciudad
   
   WHERE o.nombre_pais = 'España';
   
   +------------+---------------+------------------+
   | id_oficina | nombre_ciudad | telefono         |
   +------------+---------------+------------------+
   | OF1        | Madrid        | +34 91 123 4567  |
   | OF11       | Madrid        | +34 111 487 8543 |
   | OF2        | Fuenlabrada   | +34 93 987 6543  |
   +------------+---------------+------------------+
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
    jefe tiene un código de jefe igual a 7.

  ```sql
  SELECT nombre, apellido1, apellido2, email
  
  FROM empleado
  
  WHERE id_jefe = 7;
  
  +--------+------------+------------+-----------------------------+
  | nombre | apellido1  | apellido2  | email                       |
  +--------+------------+------------+-----------------------------+
  | Pedro  | González   | Sánchez    | pedro.gonzalez@example.com  |
  | Ana    | Díaz       | Fernández  | ana.diaz@example.com        |
  | Laura  | Sánchez    | Fernández  | laura.sanchez@example.com   |
  | Diego  | Hernández  | García     | diego.hernandez@example.com |
  | Sofía  | López      | Martínez   | sofia.lopez@example.com     |
  | Elena  | Gómez      | Pérez      | elena.gomez@example.com     |
  +--------+------------+------------+-----------------------------+
  ```

  

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
    empresa.

  ```sql
  SELECT nombre, apellido1, apellido2, email
  
  FROM jefe
  
  +--------+-----------+-----------+-------------------------+
  | nombre | apellido1 | apellido2 | email                   |
  +--------+-----------+-----------+-------------------------+
  | Juan   | Patroclo  | García    | juan.perez@example.com  |
  | María  | López     | Martínez  | maria.lopez@example.com |
  +--------+-----------+-----------+-------------------------+
  ```

  

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
    empleados que no sean representantes de ventas.

  ```sql
  SELECT nombre, apellido1, apellido2, nombre_puesto
  FROM empleado
  JOIN puesto ON empleado.id_puesto = puesto.id_puesto
  WHERE puesto.nombre_puesto != 'Representante de Ventas';
  
  +--------+------------+------------+---------------+
  | nombre | apellido1  | apellido2  | nombre_puesto |
  +--------+------------+------------+---------------+
  | Marta  | Rodríguez  | Gómez      | Gerente       |
  | Laura  | Sánchez    | Fernández  | Desarrollador |
  | Elena  | Gómez      | Pérez      | Desarrollador |
  | Julia  | García     | Fernández  | Desarrollador |
  | Lucía  | Martínez   | López      | Desarrollador |
  +--------+------------+------------+---------------+
  ```

  

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente c
   INNER JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
   INNER JOIN pais p ON ci.id_pais = p.id_pais
   WHERE p.nombre_pais = 'España';
   
   +----------------+
   | nombre_cliente |
   +----------------+
   | Cliente A      |
   | Cliente C      |
   | Cliente B      |
   +----------------+
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un
    pedido.

  ```sql
  SELECT id_estado, nombre_estado 
  FROM estado_pedido;
  
  +-----------+---------------+
  | id_estado | nombre_estado |
  +-----------+---------------+
  |         1 | Pendiente     |
  |         2 | Procesando    |
  |         3 | En tránsito   |
  |         4 | Entregado     |
  |         5 | Cancelado     |
  +-----------+---------------+
  ```

  

8. Devuelve un listado con el código de cliente de aquellos clientes que
    realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
    aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
    • Utilizando la función YEAR de MySQL.
    • Utilizando la función DATE_FORMAT de MySQL.
    • Sin utilizar ninguna de las funciones anteriores.

  ```sql
  1. SELECT DISTINCT c.id_cliente
  FROM cliente c
  INNER JOIN pago p ON c.id_cliente = p.id_cliente
  WHERE YEAR(p.fecha_pago) = 2008;
  
  2. SELECT DISTINCT id_cliente
  FROM pago
  WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';
  
  3. SELECT DISTINCT c.id_cliente
  FROM cliente c
  INNER JOIN pago p ON c.id_cliente = p.id_cliente
  WHERE p.fecha_pago >= '2008-01-01' AND p.fecha_pago <= '2008-12-31';
  
  +------------+
  | id_cliente |
  +------------+
  |          1 |
  |          3 |
  |          2 |
  |          6 |
  +------------+
  ```

  

9. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos que no han sido entregados a
    tiempo.

  ```sql
  SELECT p.id_pedido, c.id_cliente, p.fecha_esperada, p.fecha_entrega
  FROM pedido p
  INNER JOIN cliente c ON p.id_cliente = c.id_cliente
  WHERE p.fecha_entrega > p.fecha_esperada;
  
  +-----------+------------+----------------+---------------+
  | id_pedido | id_cliente | fecha_esperada | fecha_entrega |
  +-----------+------------+----------------+---------------+
  |         1 |          1 | 2008-01-10     | 2008-05-11    |
  |         2 |          2 | 2010-05-09     | 2010-05-10    |
  |         3 |          3 | 2009-01-08     | 2009-05-07    |
  +-----------+------------+----------------+---------------+
  ```

  

10. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
    menos dos días antes de la fecha esperada.
    • Utilizando la función ADDDATE de MySQL.
    • Utilizando la función DATEDIFF de MySQL.
    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
    resta -?

    ```sql
    1. SELECT p.id_pedido, p.id_cliente, p.fecha_esperada, p.fecha_entrega
    FROM pedido p
    WHERE p.fecha_entrega = ADDDATE(p.fecha_esperada, -2);
    
    2. SELECT p.id_pedido, p.id_cliente, p.fecha_esperada, p.fecha_entrega
    FROM pedido p
    WHERE DATEDIFF(p.fecha_esperada, p.fecha_entrega) >= 2;
    
    3. SELECT p.fecha_entrega, p.fecha_esperada, p.id_cliente, p.id_pedido
    FROM pedido p
    WHERE p.fecha_entrega = p.fecha_esperada - 2;
    
    
    +-----------+------------+----------------+---------------+
    | id_pedido | id_cliente | fecha_esperada | fecha_entrega |
    +-----------+------------+----------------+---------------+
    |         4 |          1 | 2008-05-10     | 2008-05-08    |
    |         5 |          2 | 2010-05-09     | 2010-05-07    |
    |         8 |          1 | 2008-05-12     | 2008-05-10    |
    |         9 |          2 | 2009-05-13     | 2009-05-11    |
    |        11 |          4 | 2008-05-14     | 2008-05-12    |
    +-----------+------------+----------------+---------------+
    ```
    
    
    
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    
    SELECT p.id_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.id_cliente, p.metodo_pago, p.id_pago
    FROM pedido p
    INNER JOIN estado_pedido ep ON p.id_estado = ep.id_estado
    WHERE ep.nombre_estado = 'Cancelado' AND YEAR(p.fecha_pedido) = 2009;
    
    +-----------+--------------+----------------+---------------+------------+-------------+---------+
    | id_pedido | fecha_pedido | fecha_esperada | fecha_entrega | id_cliente | metodo_pago | id_pago |
    +-----------+--------------+----------------+---------------+------------+-------------+---------+
    |        12 | 2009-05-12   | 2009-05-14     | 2009-05-13    |          5 | PayPal      |       5 |
    +-----------+--------------+----------------+---------------+------------+-------------+---------+
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el
    mes de enero de cualquier año.

    ```sql
    
    SELECT id_pedido, fecha_pedido, fecha_entrega, comentarios
    FROM pedido
    WHERE MONTH(fecha_entrega) = 1;
    
    +-----------+--------------+---------------+---------------------------------------------+
    | id_pedido | fecha_pedido | fecha_entrega | comentarios                                 |
    +-----------+--------------+---------------+---------------------------------------------+
    |         1 | 2008-01-08   | 2008-01-11    | Pedido entregado                            |
    |         2 | 2010-05-07   | 2010-01-10    | Pedido entregado                            |
    |         8 | 2008-05-10   | 2008-01-10    | Pedido entregado antes de la fecha esperada |
    +-----------+--------------+---------------+---------------------------------------------+
    ```
    
    
    
13. Devuelve un listado con todos los pagos que se realizaron en el
    año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```sql
    SELECT id_pago, id_cliente, fecha_pago, total
    FROM pago
    WHERE YEAR(fecha_pago) = 2008 AND id_forma_pago = 3
    ORDER BY total DESC;
    
    +---------+------------+------------+--------+
    | id_pago | id_cliente | fecha_pago | total  |
    +---------+------------+------------+--------+
    |       3 |          3 | 2008-07-10 | 200.00 |
    |      10 |          3 | 2008-07-10 | 200.00 |
    |       1 |          1 | 2008-01-15 | 100.00 |
    |       8 |          1 | 2008-01-15 | 100.00 |
    +---------+------------+------------+--------+
    ```
    
    
    
14. Devuelve un listado con todas las formas de pago que aparecen en la
    tabla pago. Tenga en cuenta que no deben aparecer formas de pago
    repetidas.

    ```sql
    SELECT DISTINCT id_forma_pago, nombre_forma_pago
    FROM forma_pago
    
    +---------------+------------------------+
    | id_forma_pago | nombre_forma_pago      |
    +---------------+------------------------+
    |             1 | Transferencia bancaria |
    |             2 | Cheque                 |
    |             3 | PayPal                 |
    |             4 | Tarjeta de Credito     |
    +---------------+------------------------+
    ```
    
    
    
15. Devuelve un listado con todos los productos que pertenecen a la
    gama Ornamentales y que tienen más de 100 unidades en stock. El listado
    deberá estar ordenado por su precio de venta, mostrando en primer lugar
    los de mayor precio.

    ```sql
    SELECT id_producto, nombre, gama, cantidad_en_stock, precio_venta
    FROM producto
    WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100
    ORDER BY precio_venta DESC;
    
    +-------------+-----------------+--------------+-------------------+--------------+
    | id_producto | nombre          | gama         | cantidad_en_stock | precio_venta |
    +-------------+-----------------+--------------+-------------------+--------------+
    | PROD6       | Lámpara de Pie  | Ornamentales |               150 |       120.00 |
    | PROD5       | Cuadro Moderno  | Ornamentales |               150 |        80.00 |
    +-------------+-----------------+--------------+-------------------+--------------+
    ```
    
    
    
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
    cuyo representante de ventas tenga el código de empleado 11 o 30.

```sql
SELECT c.id_cliente, c.nombre_contacto, c.apellido_contacto, c.id_ciudad, c.id_empleado_rep_ventas
FROM cliente c
INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
INNER JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
WHERE ci.nombre_ciudad = 'Madrid' AND (e.id_empleado = 11 OR e.id_empleado = 30);


+------------+-----------------+-------------------+-----------+------------------------+
| id_cliente | nombre_contacto | apellido_contacto | id_ciudad | id_empleado_rep_ventas |
+------------+-----------------+-------------------+-----------+------------------------+
|          5 | Carlos          | Martínez          |         1 |                     30 |
|          6 | Laura           | Fernández         |         1 |                     11 |
+------------+-----------------+-------------------+-----------+------------------------+
```



# Consultas multitabla (Composición interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
    representante de ventas.

  ```sql
  SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, e.nombre, e.apellido1
  
  FROM cliente c
  
  INNER JOIN empleado AS e ON e.id_empleado = c.id_empleado_rep_ventas
  
  +----------------+-----------------+-------------------+--------+------------+
  | nombre_cliente | nombre_contacto | apellido_contacto | nombre | apellido1  |
  +----------------+-----------------+-------------------+--------+------------+
  | Cliente A      | Juan            | Pérez             | Marta  | Rodríguez  |
  | Cliente B      | María           | Gómez             | Carlos | Martín     |
  | Cliente C      | Pedro           | Rodríguez         | Laura  | Sánchez    |
  | Cliente D      | Ana             | López             | Sofía  | López      |
  | Cliente E      | Carlos          | Martínez          | James  | Locke      |
  | Cliente F      | Laura           | Fernández         | Joseph | Roblox     |
  | Cliente G      | Javier          | Sánchez           | Sofía  | López      |
  +----------------+-----------------+-------------------+--------+------------+
  ```

  

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
    nombre de sus representantes de ventas.

  ```sql
  SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, 
  
  c.apellido_contacto, e.nombre, e.apellido1
  
  FROM cliente c
  
  INNER JOIN empleado AS e ON e.id_empleado = c.id_empleado_rep_ventas
  
  WHERE c.id_cliente IN (SELECT DISTINCT id_cliente FROM pago);
  
  
  +------------+----------------+-----------------+-------------------+--------+------------+
  | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | nombre | apellido1  |
  +------------+----------------+-----------------+-------------------+--------+------------+
  |          1 | Cliente A      | Juan            | Pérez             | Marta  | Rodríguez  |
  |          2 | Cliente B      | María           | Gómez             | Carlos | Martín     |
  |          3 | Cliente C      | Pedro           | Rodríguez         | Laura  | Sánchez    |
  |          4 | Cliente D      | Ana             | López             | Sofía  | López      |
  |          5 | Cliente E      | Carlos          | Martínez          | James  | Locke      |
  |          6 | Cliente F      | Laura           | Fernández         | Joseph | Roblox     |
  +------------+----------------+-----------------+-------------------+--------+------------+
  ```

  

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
    el nombre de sus representantes de ventas.

  ```sql
  SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, 
  
  c.apellido_contacto, e.nombre, e.apellido1
  
  FROM cliente c
  
  INNER JOIN empleado AS e ON e.id_empleado = c.id_empleado_rep_ventas
  
  WHERE c.id_cliente NOT IN (SELECT DISTINCT id_cliente FROM pago);
  
  +------------+----------------+-----------------+-------------------+--------+-----------+
  | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | nombre | apellido1 |
  +------------+----------------+-----------------+-------------------+--------+-----------+
  |          7 | Cliente G      | Javier          | Sánchez           | Sofía  | López     |
  +------------+----------------+-----------------+-------------------+--------+-----------+
  ```

  

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
    representantes junto con la ciudad de la oficina a la que pertenece el
    representante.

  ```sql
  SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, e.nombre, e.apellido1, cd.nombre_ciudad
  
  FROM cliente c
  
  INNER JOIN empleado AS e ON e.id_empleado = c.id_empleado_rep_ventas
  
  INNER JOIN oficina AS ofi ON ofi.id_oficina = e.id_oficina
  
  INNER JOIN ciudad AS cd ON cd.id_ciudad = ofi.id_ciudad
  
  WHERE c.id_cliente IN (SELECT DISTINCT id_cliente FROM pago);
  
  +------------+----------------+-----------------+-------------------+--------+------------+---------------+
  | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | nombre | apellido1  | nombre_ciudad |
  +------------+----------------+-----------------+-------------------+--------+------------+---------------+
  |          6 | Cliente F      | Laura           | Fernández         | Joseph | Roblox     | Madrid        |
  |          5 | Cliente E      | Carlos          | Martínez          | James  | Locke      | Madrid        |
  |          1 | Cliente A      | Juan            | Pérez             | Marta  | Rodríguez  | Fuenlabrada   |
  |          2 | Cliente B      | María           | Gómez             | Carlos | Martín     | París         |
  |          3 | Cliente C      | Pedro           | Rodríguez         | Laura  | Sánchez    | Roma          |
  |          4 | Cliente D      | Ana             | López             | Sofía  | López      | Milán         |
  +------------+----------------+-----------------+-------------------+--------+------------+---------------+
  
  ```

  

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
    de sus representantes junto con la ciudad de la oficina a la que pertenece el
    representante.

  ```sql
  SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, e.nombre, e.apellido1, cd.nombre_ciudad
  
  FROM cliente c
  
  INNER JOIN empleado AS e ON e.id_empleado = c.id_empleado_rep_ventas
  
  INNER JOIN oficina AS ofi ON ofi.id_oficina = e.id_oficina
  
  INNER JOIN ciudad AS cd ON cd.id_ciudad = ofi.id_ciudad
  
  WHERE c.id_cliente NOT IN (SELECT DISTINCT id_cliente FROM pago);
  
  +------------+----------------+-----------------+-------------------+--------+-----------+---------------+
  | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | nombre | apellido1 | nombre_ciudad |
  +------------+----------------+-----------------+-------------------+--------+-----------+---------------+
  |          7 | Cliente G      | Javier          | Sánchez           | Sofía  | López     | Milán         |
  +------------+----------------+-----------------+-------------------+--------+-----------+---------------+
  
  ```

  

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```sql
   SELECT DISTINCT o.id_oficina, o.linea_direccion1, o.linea_direccion2,
   
   o.telefono
   
   FROM cliente c
   
   JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
   
   JOIN oficina o ON ci.id_ciudad = o.id_ciudad
   
   WHERE ci.nombre_ciudad = 'Fuenlabrada';
   
   
   +------------+------------------+------------------+-----------------+
   | id_oficina | linea_direccion1 | linea_direccion2 | telefono        |
   +------------+------------------+------------------+-----------------+
   | OF2        | Rambla Catalunya | 2B               | +34 93 987 6543 |
   +------------+------------------+------------------+-----------------+
   ```

   

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
    con la ciudad de la oficina a la que pertenece el representante.

  ```sql
  SELECT c.nombre_contacto, c.nombre_contacto, c.apellido_contacto,
  
  e.nombre, e.apellido1, ci.nombre_ciudad
  
  FROM cliente AS c
  
  JOIN empleado AS e ON c.id_empleado_rep_ventas = e.id_empleado
  
  JOIN oficina AS ofi ON e.id_oficina = ofi.id_oficina
  
  JOIN ciudad AS ci ON ofi.id_ciudad = ci.id_ciudad;
  
  +-----------------+-----------------+-------------------+--------+------------+---------------+
  | nombre_contacto | nombre_contacto | apellido_contacto | nombre | apellido1  | nombre_ciudad |
  +-----------------+-----------------+-------------------+--------+------------+---------------+
  | Juan            | Juan            | Pérez             | Marta  | Rodríguez  | Fuenlabrada   |
  | María           | María           | Gómez             | Carlos | Martín     | París         |
  | Pedro           | Pedro           | Rodríguez         | Laura  | Sánchez    | Roma          |
  | Ana             | Ana             | López             | Sofía  | López      | Milán         |
  | Carlos          | Carlos          | Martínez          | James  | Locke      | Madrid        |
  | Laura           | Laura           | Fernández         | Joseph | Roblox     | Madrid        |
  | Javier          | Javier          | Sánchez           | Sofía  | López      | Milán         |
  +-----------------+-----------------+-------------------+--------+------------+---------------+
  ```

  

8. Devuelve un listado con el nombre de los empleados junto con el nombre
    de sus jefes.

  ```sql
  SELECT e.nombre, e.apellido1, j.nombre, j.apellido1, j.apellido2
  
  FROM empleado AS e
  
  INNER JOIN jefe AS j ON e.id_jefe = j.id_jefe
  
  
  +--------+------------+--------+-----------+-----------+
  | nombre | apellido1  | nombre | apellido1 | apellido2 |
  +--------+------------+--------+-----------+-----------+
  | Laura  | Sánchez    | Juan   | Patroclo  | García    |
  | Diego  | Hernández  | Juan   | Patroclo  | García    |
  | Sofía  | López      | Juan   | Patroclo  | García    |
  | Elena  | Gómez      | Juan   | Patroclo  | García    |
  | Joseph | Roblox     | María  | López     | Martínez  |
  | James  | Locke      | María  | López     | Martínez  |
  | Carlos | Martín     | María  | López     | Martínez  |
  | Luis   | Martín     | María  | López     | Martínez  |
  | Julia  | García     | María  | López     | Martínez  |
  | Marcos | Pérez      | María  | López     | Martínez  |
  | Lucía  | Martínez   | María  | López     | Martínez  |
  +--------+------------+--------+-----------+-----------+
  ```

  

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
    de su jefe y el nombre del jefe de sus jefe.

  ```sql
  SELECT e.nombre, e.apellido1, j.nombre AS nombre_jefe, j.apellido1  AS
  
  apellido1_jefe, j.apellido2 AS apellido2_jefe
  
  FROM empleado AS e
  
  INNER JOIN jefe AS j ON e.id_jefe = j.id_jefe
  
  +--------+------------+-------------+----------------+----------------+
  | nombre | apellido1  | nombre_jefe | apellido1_jefe | apellido2_jefe |
  +--------+------------+-------------+----------------+----------------+
  | Laura  | Sánchez    | Juan        | Patroclo       | García         |
  | Diego  | Hernández  | Juan        | Patroclo       | García         |
  | Sofía  | López      | Juan        | Patroclo       | García         |
  | Elena  | Gómez      | Juan        | Patroclo       | García         |
  | Joseph | Roblox     | María       | López          | Martínez       |
  | James  | Locke      | María       | López          | Martínez       |
  | Carlos | Martín     | María       | López          | Martínez       |
  | Luis   | Martín     | María       | López          | Martínez       |
  | Julia  | García     | María       | López          | Martínez       |
  | Marcos | Pérez      | María       | López          | Martínez       |
  | Lucía  | Martínez   | María       | López          | Martínez       |
  +--------+------------+-------------+----------------+----------------+
  ```

  

10. Devuelve el nombre de los clientes a los que no se les ha entregado a
    tiempo un pedido.

    ```sql
    SELECT p.id_pedido, c.id_cliente, c.nombre_contacto, c.apellido_contacto, p.fecha_esperada,
    
    p.fecha_entrega
    
    FROM pedido p
    
    INNER JOIN cliente c ON p.id_cliente = c.id_cliente
    
    WHERE p.fecha_entrega > p.fecha_esperada;
    
    
    +-----------+------------+-----------------+-------------------+----------------+---------------+
    | id_pedido | id_cliente | nombre_contacto | apellido_contacto | fecha_esperada | fecha_entrega |
    +-----------+------------+-----------------+-------------------+----------------+---------------+
    |         1 |          1 | Juan            | Pérez             | 2008-01-10     | 2008-01-11    |
    |         3 |          3 | Pedro           | Rodríguez         | 2009-01-08     | 2009-05-07    |
    |         4 |          1 | Juan            | Pérez             | 2008-05-10     | 2008-06-08    |
    +-----------+------------+-----------------+-------------------+----------------+---------------+
    ```

    

11. Devuelve un listado de las diferentes gamas de producto que ha comprado
    cada cliente.

    ```sql
    SELECT c.nombre_contacto AS nombre_cliente, c.apellido_contacto as apellido_cliente, g.gama AS gama_comprada
    
    FROM cliente AS c
    
    JOIN pedido AS p ON c.id_cliente = p.id_cliente
    
    JOIN detalle_pedido AS dp ON p.id_pedido = dp.id_pedido
    
    JOIN producto AS pr ON dp.id_producto = pr.id_producto
    
    JOIN gama_producto AS g ON pr.gama = g.gama
    
    
    +----------------+------------------+---------------+
    | nombre_cliente | apellido_cliente | gama_comprada |
    +----------------+------------------+---------------+
    | Juan           | Pérez            | Iluminación   |
    | Juan           | Pérez            | Decoración    |
    | María          | Gómez            | Relojes       |
    | Pedro          | Rodríguez        | Iluminación   |
    | Pedro          | Rodríguez        | Relojes       |
    +----------------+------------------+---------------+
    ```

    

# Consultas multitabla (Composición externa)

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.
1. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

  ```sql
  
  SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto
  
  FROM cliente c
  
  LEFT JOIN pago p ON c.id_cliente = p.id_cliente
  
  WHERE p.id_pago IS NULL;
  
  +------------+----------------+-----------------+-------------------+
  | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto |
  +------------+----------------+-----------------+-------------------+
  |          8 | Cliente H      | Yunikua         | Falcon            |
  |          9 | Cliente I      | Chin            | Orozco            |
  |         10 | Cliente J      | Jezabel         | Nobu              |
  +------------+----------------+-----------------+-------------------+
  ```

  

2. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pedido

  ```sql
  
  SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto
  
  FROM cliente c
  
  LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
  
  WHERE p.id_pedido IS NULL;
  
  +------------+----------------+-----------------+-------------------+
  | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto |
  +------------+----------------+-----------------+-------------------+
  |          8 | Cliente H      | Yunikua         | Falcon            |
  |          9 | Cliente I      | Chin            | Orozco            |
  |         10 | Cliente J      | Jezabel         | Nobu              |
  +------------+----------------+-----------------+-------------------+
  ```

  

3. Devuelve un listado que muestre los clientes que no han realizado ningún
    pago y los que no han realizado ningún pedido.

  ```sql
  SELECT c.id_cliente, c.nombre_cliente
  FROM cliente c
  WHERE c.id_cliente NOT IN (
      SELECT DISTINCT p.id_cliente
      FROM pago p
      UNION
      SELECT DISTINCT pd.id_cliente
      FROM pedido pd
  );
  
  +------------+----------------+
  | id_cliente | nombre_cliente |
  +------------+----------------+
  |          8 | Cliente H      |
  |          9 | Cliente I      |
  |         10 | Cliente J      |
  +------------+----------------+
  ```

  

4. Devuelve un listado que muestre solamente los empleados que no tienen
    una oficina asociada.

  ```sql
  SELECT e.id_empleado, e.nombre, e.apellido1, e.apellido2
  
  FROM empleado e
  
  WHERE e.id_oficina IS NULL;
  
  +-------------+--------+-----------+-----------+
  | id_empleado | nombre | apellido1 | apellido2 |
  +-------------+--------+-----------+-----------+
  |         112 | Lucía  | Martínez  | López     |
  +-------------+--------+-----------+-----------+
  ```

  

5. Devuelve un listado que muestre solamente los empleados que no tienen un
    cliente asociado.

  ```sql
  SELECT e.id_empleado, e.nombre, e.apellido1, e.apellido2
  
  FROM empleado e
  
  LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
  
  WHERE c.id_cliente IS NULL;
  
  +-------------+--------+------------+------------+
  | id_empleado | nombre | apellido1  | apellido2  |
  +-------------+--------+------------+------------+
  |         106 | Diego  | Hernández  | García     |
  |         108 | Elena  | Gómez      | Pérez      |
  |         109 | Luis   | Martín     | Sánchez    |
  |         110 | Julia  | García     | Fernández  |
  |         111 | Marcos | Pérez      | Gómez      |
  |         112 | Lucía  | Martínez   | López      |
  +-------------+--------+------------+------------+
  ```

  

6. Devuelve un listado que muestre solamente los empleados que no tienen un
    cliente asociado junto con los datos de la oficina donde trabajan.

  ```sql
  SELECT e.id_empleado, e.nombre, e.apellido1, e.apellido2, o.nombre_pais, o.id_ciudad
  
  FROM empleado e
  
  LEFT JOIN cliente c ON e.id_empleado = c.id_empleado_rep_ventas
  
  INNER JOIN oficina o ON e.id_oficina = o.id_oficina
  
  WHERE c.id_cliente IS NULL;
  
  +-------------+--------+------------+------------+-------------+-----------+
  | id_empleado | nombre | apellido1  | apellido2  | nombre_pais | id_ciudad |
  +-------------+--------+------------+------------+-------------+-----------+
  |         106 | Diego  | Hernández  | García     | Italia      |         7 |
  |         108 | Elena  | Gómez      | Pérez      | Italia      |         8 |
  |         109 | Luis   | Martín     | Sánchez    | Reino Unido |         9 |
  |         110 | Julia  | García     | Fernández  | Reino Unido |         9 |
  |         111 | Marcos | Pérez      | Gómez      | Reino Unido |        10 |
  +-------------+--------+------------+------------+-------------+-----------+
  ```

  

7. Devuelve un listado que muestre los empleados que no tienen una oficina
    asociada y los que no tienen un cliente asociado.

  ```sql
  SELECT e.id_empleado, e.nombre, e.apellido1, e.apellido2
  
  FROM cliente c
  
  RIGHT JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
  
  WHERE c.id_cliente IS NULL;
  
  +-------------+--------+------------+------------+
  | id_empleado | nombre | apellido1  | apellido2  |
  +-------------+--------+------------+------------+
  |         106 | Diego  | Hernández  | García     |
  |         108 | Elena  | Gómez      | Pérez      |
  |         109 | Luis   | Martín     | Sánchez    |
  |         110 | Julia  | García     | Fernández  |
  |         111 | Marcos | Pérez      | Gómez      |
  |         112 | Lucía  | Martínez   | López      |
  +-------------+--------+------------+------------+
  ```

  

8. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

  ```sql
  SELECT p.id_producto, p.nombre
  
  FROM producto p
  
  LEFT JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
  
  WHERE dp.id_detalle_pedido IS NULL;
  
  +-------------+---------------------------+
  | id_producto | nombre                    |
  +-------------+---------------------------+
  | PROD13      | Salpicon                  |
  | PROD14      | Zapatos de Cuero          |
  | PROD15      | Auriculares Inalámbricos  |
  | PROD16      | Sartén Antiadherente      |
  | PROD17      | Muñeca de Peluche         |
  | PROD18      | Piña                      |
  | PROD19      | Botas de Montaña          |
  | PROD20      | Cámara Digital            |
  +-------------+---------------------------+
  ```

  

9. Devuelve un listado de los productos que nunca han aparecido en un
    pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
    producto.

  ```sql
  SELECT p.nombre, p.descripcion, g.imagen
  
  FROM producto AS p
  
  LEFT JOIN detalle_pedido AS dp ON p.id_producto = dp.id_producto
  
  LEFT JOIN gama_producto AS g ON p.gama = g.gama
  
  WHERE dp.id_detalle_pedido IS NULL;
  
  +---------------------------+------------------------------------------------------+------------------------+
  | nombre                    | descripcion                                          | imagen                 |
  +---------------------------+------------------------------------------------------+------------------------+
  | Salpicon                  | Salpicon deportivo de alta calidad.                  | imagen_ropa.jpg        |
  | Zapatos de Cuero          | Zapatos de cuero elegantes y duraderos.              | imagen_calzado.jpg     |
  | Auriculares Inalámbricos  | Auriculares inalámbricos con cancelación de ruido.   | imagen_electronica.jpg |
  | Sartén Antiadherente      | Sartén antiadherente de alta resistencia.            | imagen_cocina.jpg      |
  | Muñeca de Peluche         | Muñeca de peluche suave y adorable.                  | imagen_juguetes.jpg    |
  | Piña                      | Piña de estilo moderno.                              | imagen_ropa.jpg        |
  | Botas de Montaña          | Botas de montaña resistentes al agua.                | imagen_calzado.jpg     |
  | Cámara Digital            | Cámara digital compacta de alta resolución.          | imagen_electronica.jpg |
  +---------------------------+------------------------------------------------------+------------------------+
  
  ```

  

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
    hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ```sql
    SELECT o.id_oficina
    
    FROM oficina AS o
    
    WHERE o.id_oficina NOT IN (
        SELECT e.id_oficina
        FROM empleado AS e
        INNER JOIN cliente AS c ON e.id_empleado = c.id_empleado_rep_ventas
        INNER JOIN pedido AS ped ON c.id_cliente = ped.id_cliente
        INNER JOIN detalle_pedido AS dp ON ped.id_pedido = dp.id_pedido
        INNER JOIN producto AS p ON dp.id_producto = p.id_producto
        INNER JOIN gama_producto AS g ON p.gama = g.gama
        WHERE g.gama = 'Frutales'
    );
    
    +------------+
    | id_oficina |
    +------------+
    | OF1        |
    | OF11       |
    | OF2        |
    | OF3        |
    | OF4        |
    | OF5        |
    | OF6        |
    | OF7        |
    | OF8        |
    | OF9        |
    | OF10       |
    +------------+
    
    ```
    
    
    
11. Devuelve un listado con los clientes que han realizado algún pedido pero no
    han realizado ningún pago.

    ```sql
    SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto
    
    FROM cliente AS c
    
    INNER JOIN pedido AS p ON c.id_cliente = p.id_cliente
    
    LEFT JOIN pago AS pag ON p.id_pago = pag.id_pago
    
    WHERE pag.id_pago IS NULL;
    
    +------------+----------------+-----------------+-------------------+
    | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto |
    +------------+----------------+-----------------+-------------------+
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          4 | Cliente D      | Ana             | López             |
    |          5 | Cliente E      | Carlos          | Martínez          |
    |          6 | Cliente F      | Laura           | Fernández         |
    +------------+----------------+-----------------+-------------------+
    ```
    
    
    
12. Devuelve un listado con los datos de los empleados que no tienen clientes
    asociados y el nombre de su jefe asociado.

    ```sql
    SELECT e.id_empleado, e.nombre, e.apellido1, e.id_jefe, j.nombre AS "nombre jefe", j.apellido1 AS "apellido jefe"
    
    FROM empleado AS e
    
    LEFT JOIN cliente AS c ON e.id_empleado = c.id_empleado_rep_ventas
    
    LEFT JOIN jefe AS j ON e.id_jefe = j.id_jefe
    
    WHERE c.id_cliente IS NULL;
    
    +-------------+--------+------------+---------+-------------+---------------+
    | id_empleado | nombre | apellido1  | id_jefe | nombre jefe | apellido jefe |
    +-------------+--------+------------+---------+-------------+---------------+
    |         106 | Diego  | Hernández  |       7 | Juan        | Patroclo      |
    |         108 | Elena  | Gómez      |       7 | Juan        | Patroclo      |
    |         109 | Luis   | Martín     |       8 | María       | López         |
    |         110 | Julia  | García     |       8 | María       | López         |
    |         111 | Marcos | Pérez      |       8 | María       | López         |
    |         112 | Lucía  | Martínez   |       8 | María       | López         |
    +-------------+--------+------------+---------+-------------+---------------+
    ```



# Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

   ```sql
   SELECT COUNT(id_empleado) AS Total_empleados
   
   FROM empleado
   
   +-----------------+
   | Total_empleados |
   +-----------------+
   |              12 |
   +-----------------+
   ```

   

2. ¿Cuántos clientes tiene cada país?

   ```sql
   SELECT p.nombre_pais, COUNT(c.id_cliente) AS totalClientes
   
   FROM cliente AS c
   
   INNER JOIN ciudad AS ci ON c.id_ciudad = ci.id_ciudad
   
   INNER JOIN pais AS p ON ci.id_pais = p.id_pais
   
   GROUP BY p.nombre_pais;
   
   +-------------+---------------+
   | nombre_pais | totalClientes |
   +-------------+---------------+
   | España      |             5 |
   | Francia     |             1 |
   | Italia      |             1 |
   +-------------+---------------+
   ```

   

3. ¿Cuál fue el pago medio en 2009?

   ```sql
   SELECT AVG(total) AS promedio_2009
   from pago
   WHERE YEAR(fecha_pago) = '2009'
   
   +---------------+
   | promedio_2009 |
   +---------------+
   |    275.000000 |
   +---------------+
   ```

   

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
    descendente por el número de pedidos.

  ```sql
  SELECT p.id_estado, ep.nombre_estado, COUNT(p.id_pedido) AS cantidad_pedidos
  
  FROM pedido AS p
  
  JOIN estado_pedido AS ep ON p.id_estado = ep.id_estado
  
  GROUP BY p.id_estado, ep.nombre_estado
  
  ORDER BY cantidad_pedidos DESC;
  
  +-----------+---------------+------------------+
  | id_estado | nombre_estado | cantidad_pedidos |
  +-----------+---------------+------------------+
  |         4 | Entregado     |                6 |
  |         1 | Pendiente     |                4 |
  |         5 | Cancelado     |                1 |
  +-----------+---------------+------------------+
  ```

  

5. Calcula el precio de venta del producto más caro y más barato en una
    misma consulta.

  ```sql
  SELECT MAX(dp.precio_unidad) AS "precio Maximo", MIN(dp.precio_unidad) AS "precio Minimo"
  
  FROM detalle_pedido AS dp;
  
  +---------------+---------------+
  | precio Maximo | precio Minimo |
  +---------------+---------------+
  |        100.00 |         30.00 |
  +---------------+---------------+
  ```

  

6. Calcula el número de clientes que tiene la empresa.

   ```sql
   SELECT COUNT(id_cliente) AS "Clientes de la Empresa"
   
   FROM cliente
   
   +------------------------+
   | Clientes de la Empresa |
   +------------------------+
   |                      7 |
   +------------------------+
   ```

   

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

   ```sql
   SELECT COUNT(c.id_cliente) AS "Clientes de la Empresa"
   
   FROM cliente AS c
   
   INNER JOIN ciudad AS ci ON c.id_ciudad = ci.id_ciudad
   
   WHERE ci.nombre_ciudad = "Madrid"
   
   +------------------------+
   | Clientes de la Empresa |
   +------------------------+
   |                      4 |
   +------------------------+
   ```

   

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
    por M?

  ```sql
  SELECT COUNT(c.id_cliente) AS "Clientes de la Empresa"
  
  FROM cliente AS c
  
  INNER JOIN ciudad AS ci ON c.id_ciudad = ci.id_ciudad
  
  WHERE ci.nombre_ciudad LIKE 'm%'
  
  +------------------------+
  | Clientes de la Empresa |
  +------------------------+
  |                      5 |
  +------------------------+
  ```

  

9. Devuelve el nombre de los representantes de ventas y el número de clientes
    al que atiende cada uno.

  ```sql
  SELECT e.nombre, e.apellido1, e.apellido2, COUNT(c.id_cliente) as "Clientes"
  
  FROM empleado as e
  
  INNER JOIN cliente as c ON c.id_empleado_rep_ventas = e.id_empleado
  
  GROUP BY e.id_empleado
  
  +--------+------------+------------+----------+
  | nombre | apellido1  | apellido2  | Clientes |
  +--------+------------+------------+----------+
  | Joseph | Roblox     | Gómez      |        1 |
  | James  | Locke      | Fernández  |        1 |
  | Marta  | Rodríguez  | Gómez      |        1 |
  | Carlos | Martín     | López      |        1 |
  | Laura  | Sánchez    | Fernández  |        1 |
  | Sofía  | López      | Martínez   |        2 |
  +--------+------------+------------+----------+
  ```

  

10. Calcula el número de clientes que no tiene asignado representante de
    ventas.

    ```sql
    SELECT COUNT(c.id_cliente) as "clientes sin Representante"
    
    FROM cliente as c
    
    LEFT JOIN empleado as e on c.id_empleado_rep_ventas = e.id_empleado
    
    WHERE c.id_empleado_rep_ventas IS NULL
    
    +----------------------------+
    | clientes sin Representante |
    +----------------------------+
    |                          3 |
    +----------------------------+
    ```
    
    
    
11. Calcula la fecha del primer y último pago realizado por cada uno de los
    clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```sql
    SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, MIN(p.fecha_pago) AS "Primer
    
    Pago", MAX(p.fecha_pago) AS "Ultimo Pago"
    
    FROM cliente AS c
    
    JOIN pago AS p ON c.id_cliente = p.id_cliente
    
    GROUP BY c.nombre_cliente, c.nombre_contacto, c.apellido_contacto;
    
    +----------------+-----------------+-------------------+-------------+-------------+
    | nombre_cliente | nombre_contacto | apellido_contacto | Primer Pago | Ultimo Pago |
    +----------------+-----------------+-------------------+-------------+-------------+
    | Cliente A      | Juan            | Pérez             | 2008-01-15  | 2010-09-18  |
    | Cliente B      | María           | Gómez             | 2008-05-20  | 2008-05-20  |
    | Cliente C      | Pedro           | Rodríguez         | 2008-07-10  | 2008-07-10  |
    | Cliente D      | Ana             | López             | 2009-01-05  | 2009-01-05  |
    | Cliente E      | Carlos          | Martínez          | 2009-11-30  | 2009-11-30  |
    | Cliente F      | Laura           | Fernández         | 2008-12-25  | 2008-12-25  |
    +----------------+-----------------+-------------------+-------------+-------------+
    ```
    
    
    
12. Calcula el número de productos diferentes que hay en cada uno de los
    pedidos.

    ```sql
    SELECT id_pedido, COUNT(DISTINCT id_producto) AS Productos
    
    FROM detalle_pedido
    
    GROUP BY id_pedido;
    
    +-----------+-----------+
    | id_pedido | Productos |
    +-----------+-----------+
    |         1 |         2 |
    |         2 |         1 |
    |         3 |         2 |
    |        13 |         2 |
    |        14 |         1 |
    |        15 |         1 |
    |        16 |         1 |
    |        17 |         1 |
    |        18 |         1 |
    |        19 |         1 |
    |        20 |         1 |
    |        21 |         1 |
    |        22 |         1 |
    |        23 |         1 |
    +-----------+-----------+
    ```
    
    
    
13. Calcula la suma de la cantidad total de todos los productos que aparecen en
    cada uno de los pedidos.

    ```sql
    SELECT id_pedido, SUM(cantidad) as "cantidad producto"
    
    FROM detalle_pedido
    
    GROUP BY id_pedido;
    
    +-----------+-------------------+
    | id_pedido | cantidad producto |
    +-----------+-------------------+
    |         1 |                 3 |
    |         2 |                 3 |
    |         3 |                 3 |
    |        13 |                 5 |
    |        14 |                 3 |
    |        15 |                 2 |
    |        16 |                 1 |
    |        17 |                 3 |
    |        18 |                 2 |
    |        19 |                 3 |
    |        20 |                 2 |
    |        21 |                 2 |
    |        22 |                 1 |
    |        23 |                 3 |
    +-----------+-------------------+
    ```
    
    
    
14. Devuelve un listado de los 20 productos más vendidos y el número total de
    unidades que se han vendido de cada uno. El listado deberá estar ordenado
    por el número total de unidades vendidas.

    ```sql
    SELECT p.id_producto, p.nombre AS "nombre Producto", SUM(dp.cantidad) AS "Total unidades 
    Vendidas"
    
    FROM detalle_pedido AS dp
    
    JOIN producto AS p ON dp.id_producto = p.id_producto
    
    GROUP BY p.id_producto, p.nombre
    
    ORDER BY "Total unidades Vendidas" DESC
    
    LIMIT 20;
    
    +-------------+-------------------------+-------------------------+
    | id_producto | nombre Producto         | Total unidades Vendidas |
    +-------------+-------------------------+-------------------------+
    | PROD1       | Lámpara de Mesa         |                       6 |
    | PROD2       | Figura Decorativa       |                       3 |
    | PROD3       | Reloj de Pared          |                       8 |
    | PROD4       | Jarrón de Porcelana     |                       2 |
    | PROD5       | Cuadro Moderno          |                       1 |
    | PROD6       | Lámpara de Pie          |                       3 |
    | PROD7       | Guitarra Acústica       |                       2 |
    | PROD8       | Mesa de Comedor         |                       3 |
    | PROD9       | Telescopio Astronómico  |                       2 |
    | PROD10      | Teléfono Inteligente    |                       2 |
    | PROD11      | Robot de Cocina         |                       1 |
    | PROD12      | Set de Construcción     |                       3 |
    +-------------+-------------------------+-------------------------+
    
    ```
    
    
    
15. La facturación que ha tenido la empresa en toda la historia, indicando la
    base imponible, el IVA y el total facturado. La base imponible se calcula
    sumando el coste del producto por el número de unidades vendidas de la
    tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
    suma de los dos campos anteriores.

    ```sql
    SELECT SUM(dp.cantidad * p.precio_venta) AS "base imponible", SUM(dp.cantidad * p.precio_venta) * 0.21 AS IVA, SUM(dp.cantidad * p.precio_venta) + (SUM(dp.cantidad * p.precio_venta) * 0.21) AS "total facturado"
    
    FROM detalle_pedido AS dp
    
    JOIN producto AS p ON dp.id_producto = p.id_producto;
    
    +----------------+-----------+-----------------+
    | base imponible | IVA       | total facturado |
    +----------------+-----------+-----------------+
    |        6970.00 | 1463.7000 |       8433.7000 |
    +----------------+-----------+-----------------+
    ```
    
    
    
16. La misma información que en la pregunta anterior, pero agrupada por
    código de producto.

    ```sql
    SELECT SUM(dp.cantidad * p.precio_venta) AS "base imponible", SUM(dp.cantidad * p.precio_venta) * 0.21 AS IVA, SUM(dp.cantidad * p.precio_venta) + (SUM(dp.cantidad * p.precio_venta) * 0.21) AS "total facturado"
    
    FROM detalle_pedido AS dp
    
    JOIN producto AS p ON dp.id_producto = p.id_producto
    
    GROUP BY p.id_producto;
    
    +----------------+----------+-----------------+
    | base imponible | IVA      | total facturado |
    +----------------+----------+-----------------+
    |         420.00 |  88.2000 |        508.2000 |
    |         270.00 |  56.7000 |        326.7000 |
    |         880.00 | 184.8000 |       1064.8000 |
    |         120.00 |  25.2000 |        145.2000 |
    |          80.00 |  16.8000 |         96.8000 |
    |         360.00 |  75.6000 |        435.6000 |
    |         800.00 | 168.0000 |        968.0000 |
    |        2100.00 | 441.0000 |       2541.0000 |
    |         600.00 | 126.0000 |        726.0000 |
    |        1000.00 | 210.0000 |       1210.0000 |
    |         250.00 |  52.5000 |        302.5000 |
    |          90.00 |  18.9000 |        108.9000 |
    +----------------+----------+-----------------+
    ```
    
    
    
17. La misma información que en la pregunta anterior, pero agrupada por
    código de producto filtrada por los códigos que empiecen por OR.

    ```sql
    SELECT SUM(dp.cantidad * p.precio_venta) AS "base imponible", SUM(dp.cantidad * p.precio_venta) * 0.21 AS IVA, SUM(dp.cantidad * p.precio_venta) + (SUM(dp.cantidad * p.precio_venta) * 0.21) AS "total facturado"
    
    FROM detalle_pedido AS dp
    
    JOIN producto AS p ON dp.id_producto = p.id_producto
    
    WHERE p.gama LIKE 'Or%'
    
    GROUP BY p.id_producto;
    
    +----------------+---------+-----------------+
    | base imponible | IVA     | total facturado |
    +----------------+---------+-----------------+
    |         120.00 | 25.2000 |        145.2000 |
    |          80.00 | 16.8000 |         96.8000 |
    |         360.00 | 75.6000 |        435.6000 |
    +----------------+---------+-----------------+
    ```
    
    
    
18. Lista las ventas totales de los productos que hayan facturado más de 3000
    euros. Se mostrará el nombre, unidades vendidas, total facturado y total
    facturado con impuestos (21% IVA).

    ```sql
    SELECT p.nombre AS "Nombre Producto", SUM(dp.cantidad) AS "Unidades Vendidas", SUM(dp.cantidad * p.precio_venta) AS "Total Facturado", SUM(dp.cantidad * p.precio_venta) * 1.21 AS "Total Facturado IVA"
    
    FROM detalle_pedido AS dp
    
    JOIN producto AS p ON dp.id_producto = p.id_producto
    
    GROUP BY p.nombre
    
    HAVING SUM(dp.cantidad * p.precio_venta) > 3000;
    
    +-------------------------+-------------------+-----------------+---------------------+
    | Nombre Producto         | Unidades Vendidas | Total Facturado | Total Facturado IVA |
    +-------------------------+-------------------+-----------------+---------------------+
    | Telescopio Astronómico  |                12 |         3600.00 |           4356.0000 |
    +-------------------------+-------------------+-----------------+---------------------+
    ```
    
    
    
19. Muestre la suma total de todos los pagos que se realizaron para cada uno
    de los años que aparecen en la tabla pagos.

    ```sql
    SELECT YEAR(fecha_pago) AS año, SUM(total) AS "Suma total"
    
    FROM pago
    
    GROUP BY YEAR(fecha_pago)
    
    ORDER BY año;
    
    +------+------------+
    | año  | Suma total |
    +------+------------+
    | 2008 |    3100.00 |
    | 2009 |    5950.00 |
    | 2010 |    2300.00 |
    +------+------------+
    ```
    
    

# Subconsultas

Con operadores básicos de comparación
1. Devuelve el nombre del cliente con mayor límite de crédito.

   ```sql
   SELECT nombre_cliente, nombre_contacto, apellido_contacto
   
   FROM cliente
   
   ORDER BY limite_credito DESC
   
   LIMIT 1;
   
   +----------------+-----------------+-------------------+
   | nombre_cliente | nombre_contacto | apellido_contacto |
   +----------------+-----------------+-------------------+
   | Cliente H      | Yunikua         | Falcon            |
   +----------------+-----------------+-------------------+
   
   
   ```

   

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```sql
   SELECT nombre
   
   FROM producto
   
   ORDER BY precio_venta DESC
   
   LIMIT 1;
   
   +-----------------+
   | nombre          |
   +-----------------+
   | Mesa de Comedor |
   +-----------------+
   ```

   

3. Devuelve el nombre del producto del que se han vendido más unidades.
    (Tenga en cuenta que tendrá que calcular cuál es el número total de
    unidades que se han vendido de cada producto a partir de los datos de la
    tabla detalle_pedido)

  ```sql
  SELECT p.nombre as "producto mas vendido"
  
  FROM detalle_pedido dp
  
  JOIN producto p ON dp.id_producto = p.id_producto
  
  GROUP BY dp.id_producto, p.nombre
  
  ORDER BY SUM(dp.cantidad) DESC
  
  LIMIT 1;
  
  +-------------------------+
  | producto mas vendido    |
  +-------------------------+
  | Telescopio Astronómico  |
  +-------------------------+
  ```

  

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
    realizado. (Sin utilizar INNER JOIN).

  ```sql
  SELECT id_cliente, nombre_cliente, limite_credito
  
  FROM cliente
  
  WHERE limite_credito > (
      SELECT SUM(total) 
      FROM pago 
      WHERE pago.id_cliente = cliente.id_cliente
  );
  
  +------------+----------------+----------------+
  | id_cliente | nombre_cliente | limite_credito |
  +------------+----------------+----------------+
  |          1 | Cliente A      |       10000.00 |
  |          2 | Cliente B      |       15000.00 |
  |          3 | Cliente C      |       20000.00 |
  |          4 | Cliente D      |       25000.00 |
  |          5 | Cliente E      |       30000.00 |
  |          6 | Cliente F      |       35000.00 |
  +------------+----------------+----------------+
  ```

  

5. Devuelve el producto que más unidades tiene en stock.

   ```sql
   SELECT id_producto, nombre, cantidad_en_stock
   
   FROM producto
   
   ORDER BY cantidad_en_stock DESC
   
   LIMIT 1;
   
   +-------------+----------------------+-------------------+
   | id_producto | nombre               | cantidad_en_stock |
   +-------------+----------------------+-------------------+
   | PROD12      | Set de Construcción  |               300 |
   +-------------+----------------------+-------------------+
   ```

   

6. Devuelve el producto que menos unidades tiene en stock.

   ```sql
   SELECT id_producto, nombre, cantidad_en_stock
   
   FROM producto
   
   ORDER BY cantidad_en_stock ASC
   
   LIMIT 1;
   
   +-------------+-------------------+-------------------+
   | id_producto | nombre            | cantidad_en_stock |
   +-------------+-------------------+-------------------+
   | PROD19      | Botas de Montaña  |                70 |
   +-------------+-------------------+-------------------+
   ```

   

7. Devuelve el nombre, los apellidos y el email de los empleados que están a
    cargo de Alberto Soria.

  ```sql
  SELECT e.nombre, e.apellido1, e.apellido2, e.email
  
  FROM empleado AS e
  
  INNER JOIN jefe AS j ON e.id_jefe = j.id_jefe
  
  WHERE j.nombre = 'Alberto' AND j.apellido1 = 'Soria';
  
  +--------+-----------+------------+--------------------------+
  | nombre | apellido1 | apellido2  | email                    |
  +--------+-----------+------------+--------------------------+
  | Luis   | Martín    | Sánchez    | luis.martin@example.com  |
  | Julia  | García    | Fernández  | julia.garcia@example.com |
  +--------+-----------+------------+--------------------------+
  
  ```

  

  # Subconsultas con ALL y ANY

8. Devuelve el nombre del cliente con mayor límite de crédito.

   ```sql
   SELECT nombre_cliente
   
   FROM cliente
   
   WHERE limite_credito >= ALL (
       SELECT limite_credito
       FROM cliente);
       
      
   +----------------+
   | nombre_cliente |
   +----------------+
   | Cliente H      |
   | Cliente I      |
   | Cliente J      |
   +----------------+
   ```

   

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```sql
   SELECT nombre
   
   FROM producto
   
   WHERE precio_venta >= ALL (
       SELECT precio_venta
       FROM producto);
       
   +-----------------+
   | nombre          |
   +-----------------+
   | Mesa de Comedor |
   +-----------------+
   
   ```

   

10. Devuelve el producto que menos unidades tiene en stock.

    ```sql
    SELECT nombre
    FROM producto
    WHERE cantidad_en_stock <= ALL (
        SELECT cantidad_en_stock
        FROM producto);
    
    +--------------------+
    | nombre             |
    +--------------------+
    | Botas de Montaña   |
    | Guitarra Acústica  |
    +--------------------+
    ```

    

    # Subconsultas con IN y NOT IN

11. Devuelve el nombre, apellido1 y cargo de los empleados que no
    representen a ningún cliente.

    ```sql
    SELECT e.nombre, e.apellido1, p.nombre_puesto
    
    FROM empleado as e
    
    INNER JOIN puesto as p ON e.id_puesto = p.id_puesto
    
    WHERE e.id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente WHERE id_empleado_rep_ventas IS NOT NULL);
    
    +--------+------------+-------------------------+
    | nombre | apellido1  | nombre_puesto           |
    +--------+------------+-------------------------+
    | Diego  | Hernández  | Representante de Ventas |
    | Luis   | Martín     | Representante de Ventas |
    | Marcos | Pérez      | Representante de Ventas |
    | Julia  | García     | Desarrollador           |
    | Lucía  | Martínez   | Desarrollador           |
    +--------+------------+-------------------------+
    ```

    

12. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```sql
    SELECT id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, fax, telefono
    
    FROM cliente
    
    WHERE id_cliente NOT IN (SELECT id_cliente FROM pago);
    
    +------------+----------------+-----------------+-------------------+--------------+--------------+
    | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax          | telefono     |
    +------------+----------------+-----------------+-------------------+--------------+--------------+
    |          8 | Cliente H      | Yunikua         | Falcon            | 563-474-5845 | 333-444-5555 |
    |          9 | Cliente I      | Chin            | Orozco            | 323-454-1255 | 300-404-5555 |
    |         10 | Cliente J      | Jezabel         | Nobu              | 533-234-5675 | 313-600-5345 |
    +------------+----------------+-----------------+-------------------+--------------+--------------+
    ```

    

13. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```sql
    SELECT c.id_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, c.fax, c.telefono
    FROM cliente AS c
    INNER JOIN pago AS p ON c.id_cliente = p.id_cliente;
    
    +------------+----------------+-----------------+-------------------+
    | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto |
    +------------+----------------+-----------------+-------------------+
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          1 | Cliente A      | Juan            | Pérez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          4 | Cliente D      | Ana             | López             |
    |          4 | Cliente D      | Ana             | López             |
    |          4 | Cliente D      | Ana             | López             |
    |          4 | Cliente D      | Ana             | López             |
    |          5 | Cliente E      | Carlos          | Martínez          |
    |          5 | Cliente E      | Carlos          | Martínez          |
    |          5 | Cliente E      | Carlos          | Martínez          |
    |          5 | Cliente E      | Carlos          | Martínez          |
    |          6 | Cliente F      | Laura           | Fernández         |
    |          6 | Cliente F      | Laura           | Fernández         |
    |          6 | Cliente F      | Laura           | Fernández         |
    |          6 | Cliente F      | Laura           | Fernández         |
    +------------+----------------+-----------------+-------------------+
    ```

    

14. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```sql
    SELECT p.id_producto, p.nombre, p.gama, p.precio_venta, p.precio_proveedor
    
    FROM producto AS p
    
    LEFT JOIN detalle_pedido AS dp ON p.id_producto = dp.id_producto
    
    WHERE dp.id_producto IS NULL;
    
    +-------------+---------------------------+--------------+--------------+------------------+
    | id_producto | nombre                    | gama         | precio_venta | precio_proveedor |
    +-------------+---------------------------+--------------+--------------+------------------+
    | PROD13      | Salpicon                  | Frutales     |        40.00 |            30.00 |
    | PROD14      | Zapatos de Cuero          | Calzado      |       120.00 |            90.00 |
    | PROD15      | Auriculares Inalámbricos  | Electrónica  |       150.00 |           120.00 |
    | PROD16      | Sartén Antiadherente      | Cocina       |        35.00 |            25.00 |
    | PROD17      | Muñeca de Peluche         | Juguetes     |        20.00 |            15.00 |
    | PROD18      | Piña                      | Frutales     |        60.00 |            45.00 |
    | PROD19      | Botas de Montaña          | Calzado      |        80.00 |            65.00 |
    | PROD20      | Cámara Digital            | Electrónica  |       300.00 |           250.00 |
    +-------------+---------------------------+--------------+--------------+------------------+
    ```

    

15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
    empleados que no sean representante de ventas de ningún cliente.

    ```sql
    SELECT e.nombre, e.apellido1, e.apellido2, p.nombre_puesto
    
    FROM empleado AS e
    
    INNER JOIN puesto AS p ON e.id_puesto = p.id_puesto
    
    WHERE e.id_empleado NOT IN (SELECT id_empleado_rep_ventas FROM cliente WHERE id_empleado_rep_ventas IS NOT NULL);
    
    +--------+------------+------------+-------------------------+-----------+
    | nombre | apellido1  | apellido2  | nombre_puesto           | extension |
    +--------+------------+------------+-------------------------+-----------+
    | Diego  | Hernández  | García     | Representante de Ventas | 106       |
    | Luis   | Martín     | Sánchez    | Representante de Ventas | 109       |
    | Marcos | Pérez      | Gómez      | Representante de Ventas | 111       |
    | Julia  | García     | Fernández  | Desarrollador           | 110       |
    | Lucía  | Martínez   | López      | Desarrollador           | 112       |
    +--------+------------+------------+-------------------------+-----------+
    ```

    

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
    hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ```sql
    SELECT o.id_oficina
    
    FROM oficina AS o
    
    WHERE o.id_oficina NOT IN (
        SELECT DISTINCT e.id_oficina
        FROM empleado AS e
        INNER JOIN cliente AS c ON e.id_empleado = c.id_empleado_rep_ventas
        INNER JOIN detalle_pedido AS dp ON c.id_cliente = dp.id_detalle_pedido
        INNER JOIN producto AS p ON dp.id_producto = p.id_producto
        WHERE p.gama = 'Frutales'
    );
    
    +------------+
    | id_oficina |
    +------------+
    | OF1        |
    | OF11       |
    | OF2        |
    | OF3        |
    | OF4        |
    | OF5        |
    | OF6        |
    | OF7        |
    | OF8        |
    | OF9        |
    | OF10       |
    +------------+
    ```

    

17. Devuelve un listado con los clientes que han realizado algún pedido pero no
    han realizado ningún pago.

    ```sql
    
    ```

    

# Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```sql
    SELECT id_cliente, nombre_cliente, nombre_contacto, apellido_contacto
    
    FROM cliente c
    
    WHERE NOT EXISTS ( SELECT 1 FROM pago p WHERE c.id_cliente = p.id_cliente);
    
    +------------+----------------+-----------------+-------------------+
    | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto |
    +------------+----------------+-----------------+-------------------+
    |          8 | Cliente H      | Yunikua         | Falcon            |
    |          9 | Cliente I      | Chin            | Orozco            |
    |         10 | Cliente J      | Jezabel         | Nobu              |
    +------------+----------------+-----------------+-------------------+
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```sql
    SELECT id_cliente, nombre_cliente, nombre_contacto, apellido_contacto
    
    FROM cliente c
    
    WHERE EXISTS ( SELECT 1 FROM pago p WHERE c.id_cliente = p.id_cliente);
    
    +------------+----------------+-----------------+-------------------+
    | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto |
    +------------+----------------+-----------------+-------------------+
    |          1 | Cliente A      | Juan            | Pérez             |
    |          2 | Cliente B      | María           | Gómez             |
    |          3 | Cliente C      | Pedro           | Rodríguez         |
    |          4 | Cliente D      | Ana             | López             |
    |          5 | Cliente E      | Carlos          | Martínez          |
    |          6 | Cliente F      | Laura           | Fernández         |
    +------------+----------------+-----------------+-------------------+
    ```

    

20. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```sql
    SELECT id_producto, nombre
    
    FROM producto p
    
    WHERE NOT EXISTS ( SELECT 1 FROM detalle_pedido dp WHERE p.id_producto = dp.id_producto);
    
    +-------------+---------------------------+
    | id_producto | nombre                    |
    +-------------+---------------------------+
    | PROD13      | Salpicon                  |
    | PROD14      | Zapatos de Cuero          |
    | PROD15      | Auriculares Inalámbricos  |
    | PROD16      | Sartén Antiadherente      |
    | PROD17      | Muñeca de Peluche         |
    | PROD18      | Piña                      |
    | PROD19      | Botas de Montaña          |
    | PROD20      | Cámara Digital            |
    +-------------+---------------------------+
    ```

    

21. Devuelve un listado de los productos que han aparecido en un pedido
    alguna vez.

    ```sql
    SELECT id_producto, nombre
    
    FROM producto p
    
    WHERE EXISTS (SELECT 1 FROM detalle_pedido dp WHERE p.id_producto = dp.id_producto);
    
    +-------------+-------------------------+
    | id_producto | nombre                  |
    +-------------+-------------------------+
    | PROD1       | Lámpara de Mesa         |
    | PROD10      | Teléfono Inteligente    |
    | PROD11      | Robot de Cocina         |
    | PROD12      | Set de Construcción     |
    | PROD2       | Figura Decorativa       |
    | PROD3       | Reloj de Pared          |
    | PROD4       | Jarrón de Porcelana     |
    | PROD5       | Cuadro Moderno          |
    | PROD6       | Lámpara de Pie          |
    | PROD7       | Guitarra Acústica       |
    | PROD8       | Mesa de Comedor         |
    | PROD9       | Telescopio Astronómico  |
    +-------------+-------------------------+
    ```

    

    ## Subconsultas correlacionadas

    # Consultas variadas

22. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
      pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
      han realizado ningún pedido.

   ```sql
   SELECT c.id_cliente, c.nombre_cliente, COUNT(p.id_pedido) AS total_pedidos
   
   FROM cliente c
   
   LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
   
   GROUP BY c.id_cliente, c.nombre_cliente;
   
   +------------+----------------+---------------+
   | id_cliente | nombre_cliente | total_pedidos |
   +------------+----------------+---------------+
   |          1 | Cliente A      |             6 |
   |          2 | Cliente B      |             6 |
   |          3 | Cliente C      |             6 |
   |          4 | Cliente D      |             2 |
   |          5 | Cliente E      |             2 |
   |          6 | Cliente F      |             1 |
   |          8 | Cliente H      |             0 |
   |          9 | Cliente I      |             0 |
   |         10 | Cliente J      |             0 |
   +------------+----------------+---------------+
   ```

   

23. Devuelve un listado con los nombres de los clientes y el total pagado por
      cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
      realizado ningún pago.

   ```sql
   SELECT c.id_cliente, c.nombre_cliente, SUM(pa.total) AS total_pagado
   
   FROM cliente c
   
   INNER JOIN pago pa ON c.id_cliente = pa.id_cliente
   
   GROUP BY c.id_cliente, c.nombre_cliente;
   
   +------------+----------------+--------------+
   | id_cliente | nombre_cliente | total_pagado |
   +------------+----------------+--------------+
   |          1 | Cliente A      |      1200.00 |
   |          2 | Cliente B      |      1000.00 |
   |          3 | Cliente C      |      1200.00 |
   |          4 | Cliente D      |      1400.00 |
   |          5 | Cliente E      |      4750.00 |
   |          6 | Cliente F      |      1800.00 |
   +------------+----------------+--------------+
   ```

   

24. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
      ordenados alfabéticamente de menor a mayor.

   ```sql
   SELECT DISTINCT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto
   
   FROM cliente c
   
   INNER JOIN pedido p ON c.id_cliente = p.id_cliente
   
   WHERE YEAR(p.fecha_pedido) = 2008
   
   ORDER BY c.nombre_cliente ASC;
   
   +----------------+-----------------+-------------------+
   | nombre_cliente | nombre_contacto | apellido_contacto |
   +----------------+-----------------+-------------------+
   | Cliente A      | Juan            | Pérez             |
   | Cliente D      | Ana             | López             |
   +----------------+-----------------+-------------------+
   
   ```

   

25. Devuelve el nombre del cliente, el nombre y primer apellido de su
      representante de ventas y el número de teléfono de la oficina del
      representante de ventas, de aquellos clientes que no hayan realizado ningún
      pago.

   ```sql
   
   ```

   

26. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
      nombre y primer apellido de su representante de ventas y la ciudad donde
      está su oficina.

   ```sql
   SELECT c.nombre_contacto, c.apellido_contacto, e.nombre AS "nombre Representante", e.apellido1 AS "apellido Representante", ci.nombre_ciudad AS "Oficina ciudad"
   
   FROM cliente c
   
   INNER JOIN empleado e ON c.id_empleado_rep_ventas = e.id_empleado
   
   INNER JOIN oficina o ON e.id_oficina = o.id_oficina
   
   INNER JOIN ciudad ci ON o.id_ciudad = ci.id_ciudad;
   
   +-----------------+-------------------+----------------------+------------------------+----------------+
   | nombre_contacto | apellido_contacto | nombre Representante | apellido Representante | Oficina ciudad |
   +-----------------+-------------------+----------------------+------------------------+----------------+
   | Juan            | Pérez             | Marta                | Rodríguez              | Fuenlabrada    |
   | María           | Gómez             | Carlos               | Martín                 | París          |
   | Pedro           | Rodríguez         | Laura                | Sánchez                | Roma           |
   | Ana             | López             | Sofía                | López                  | Milán          |
   | Carlos          | Martínez          | James                | Locke                  | Madrid         |
   | Laura           | Fernández         | Joseph               | Roblox                 | Madrid         |
   +-----------------+-------------------+----------------------+------------------------+----------------+
   ```

   

27. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
      empleados que no sean representante de ventas de ningún cliente.

   ```sql
   SELECT e.nombre, e.apellido1, e.apellido2, p.nombre_puesto, o.telefono
   
   FROM empleado e
   
   JOIN puesto p ON e.id_puesto = p.id_puesto
   
   JOIN oficina o ON e.id_oficina = o.id_oficina
   
   WHERE NOT EXISTS ( SELECT 1 FROM cliente c WHERE c.id_empleado_rep_ventas = e.id_empleado) AND NOT EXISTS (SELECT 1 FROM jefe j WHERE j.id_jefe = e.id_empleado);
   
   +--------+------------+------------+-------------------------+------------------+
   | nombre | apellido1  | apellido2  | nombre_puesto           | telefono         |
   +--------+------------+------------+-------------------------+------------------+
   | Diego  | Hernández  | García     | Representante de Ventas | +39 06 1234 5678 |
   | Luis   | Martín     | Sánchez    | Representante de Ventas | +44 20 1234 5678 |
   | Marcos | Pérez      | Gómez      | Representante de Ventas | +44 161 987 6543 |
   | Julia  | García     | Fernández  | Desarrollador           | +44 20 1234 5678 |
   +--------+------------+------------+-------------------------+------------------+
   
   ```

   

28. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
      número de empleados que tiene.

   ```sql
   SELECT c.nombre_ciudad, COUNT(e.id_empleado) AS "Cantidad empleados"
   
   FROM ciudad c
   
   LEFT JOIN oficina o ON c.id_ciudad = o.id_ciudad
   
   LEFT JOIN empleado e ON o.id_oficina = e.id_oficina
   
   GROUP BY c.nombre_ciudad;
   
   +---------------+--------------------+
   | nombre_ciudad | Cantidad empleados |
   +---------------+--------------------+
   | Madrid        |                  2 |
   | Fuenlabrada   |                  1 |
   | París         |                  1 |
   | Marsella      |                  0 |
   | Berlín        |                  0 |
   | Múnich        |                  0 |
   | Roma          |                  2 |
   | Milán         |                  2 |
   | Londres       |                  2 |
   | Manchester    |                  1 |
   +---------------+--------------------+
   
   
   ```

   # VISTAS

   1. Vista de las oficinas 

      ```sql
      CREATE VIEW vista_oficinas AS
      SELECT id_oficina, id_ciudad, nombre_pais, telefono, linea_direccion1, linea_direccion2
      FROM oficina;
      
      SELECT id_oficina, id_ciudad, nombre_pais, telefono FROM vista_oficinas;
      
      +------------+-----------+-------------+------------------+
      | id_oficina | id_ciudad | nombre_pais | telefono         |
      +------------+-----------+-------------+------------------+
      | OF1        |         1 | España      | +34 91 123 4567  |
      | OF10       |        10 | Reino Unido | +44 161 987 6543 |
      | OF11       |         1 | España      | +34 111 487 8543 |
      | OF2        |         2 | España      | +34 93 987 6543  |
      | OF3        |         3 | Francia     | +33 1 2345 6789  |
      | OF4        |         4 | Francia     | +33 4 5678 9012  |
      | OF5        |         5 | Alemania    | +49 30 3456 7890 |
      | OF6        |         6 | Alemania    | +49 89 6789 0123 |
      | OF7        |         7 | Italia      | +39 06 1234 5678 |
      | OF8        |         8 | Italia      | +39 02 9876 5432 |
      | OF9        |         9 | Reino Unido | +44 20 1234 5678 |
      +------------+-----------+-------------+------------------+
      ```

      2. Vista de los empleados

         ```sql
         CREATE VIEW vista_empleados AS
         SELECT id_empleado, nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, id_puesto
         FROM empleado;
         
         
         SELECT id_empleado, nombre, apellido1, apellido2, extension FROM vista_empleados;
         
         +-------------+--------+------------+------------+-----------+
         | id_empleado | nombre | apellido1  | apellido2  | extension |
         +-------------+--------+------------+------------+-----------+
         |          11 | Joseph | Roblox     | Gómez      | 171       |
         |          30 | James  | Locke      | Fernández  | 150       |
         |         103 | Marta  | Rodríguez  | Gómez      | 103       |
         |         104 | Carlos | Martín     | López      | 104       |
         |         105 | Laura  | Sánchez    | Fernández  | 105       |
         |         106 | Diego  | Hernández  | García     | 106       |
         |         107 | Sofía  | López      | Martínez   | 107       |
         |         108 | Elena  | Gómez      | Pérez      | 108       |
         |         109 | Luis   | Martín     | Sánchez    | 109       |
         |         110 | Julia  | García     | Fernández  | 110       |
         |         111 | Marcos | Pérez      | Gómez      | 111       |
         |         112 | Lucía  | Martínez   | López      | 112       |
         +-------------+--------+------------+------------+-----------+
         ```

 3. Vista de los clientes

    ```sql
    CREATE VIEW vista_clientes AS
    SELECT id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, fax, telefono, id_ciudad, id_direccion, id_empleado_rep_ventas, limite_credito
    FROM cliente;
    
    SELECT id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, fax FROM vista_clientes;
    
    +------------+----------------+-----------------+-------------------+--------------+
    | id_cliente | nombre_cliente | nombre_contacto | apellido_contacto | fax          |
    +------------+----------------+-----------------+-------------------+--------------+
    |          1 | Cliente A      | Juan            | Pérez             | 123-456-7890 |
    |          2 | Cliente B      | María           | Gómez             | 987-654-3210 |
    |          3 | Cliente C      | Pedro           | Rodríguez         | 111-222-3333 |
    |          4 | Cliente D      | Ana             | López             | 444-555-6666 |
    |          5 | Cliente E      | Carlos          | Martínez          | 777-888-9999 |
    |          6 | Cliente F      | Laura           | Fernández         | 000-111-2222 |
    |          8 | Cliente H      | Yunikua         | Falcon            | 563-474-5845 |
    |          9 | Cliente I      | Chin            | Orozco            | 323-454-1255 |
    |         10 | Cliente J      | Jezabel         | Nobu              | 533-234-5675 |
    +------------+----------------+-----------------+-------------------+--------------+
    ```

4. Vista de los productos

   ```sql
   CREATE VIEW vista_productos AS
   SELECT id_producto, nombre, gama, id_dimensiones, id_proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor
   FROM producto;
   
   SELECT id_producto, nombre, gama, id_dimensiones, id_proveedor, descripcion, precio_venta FROM vista_productos;
   
   +-------------+---------------------------+--------------+----------------+--------------+------------------------------------------------------+--------------+
   | id_producto | nombre                    | gama         | id_dimensiones | id_proveedor | descripcion                                          | precio_venta |
   +-------------+---------------------------+--------------+----------------+--------------+------------------------------------------------------+--------------+
   | PROD1       | Lámpara de Mesa           | Iluminación  |              1 | PROV1        | Lámpara de mesa con diseño moderno.                  |        70.00 |
   | PROD10      | Teléfono Inteligente      | Electrónica  |              7 | PROV7        | Teléfono inteligente de última generación.           |       500.00 |
   | PROD11      | Robot de Cocina           | Cocina       |              8 | PROV8        | Robot de cocina multifunción.                        |       250.00 |
   | PROD12      | Set de Construcción       | Juguetes     |              9 | PROV9        | Set de construcción para niños.                      |        30.00 |
   | PROD13      | Salpicon                  | Frutales     |             10 | PROV10       | Salpicon deportivo de alta calidad.                  |        40.00 |
   | PROD14      | Zapatos de Cuero          | Calzado      |             11 | PROV11       | Zapatos de cuero elegantes y duraderos.              |       120.00 |
   | PROD15      | Auriculares Inalámbricos  | Electrónica  |              7 | PROV7        | Auriculares inalámbricos con cancelación de ruido.   |       150.00 |
   | PROD16      | Sartén Antiadherente      | Cocina       |              8 | PROV8        | Sartén antiadherente de alta resistencia.            |        35.00 |
   | PROD17      | Muñeca de Peluche         | Juguetes     |              9 | PROV9        | Muñeca de peluche suave y adorable.                  |        20.00 |
   | PROD18      | Piña                      | Frutales     |             10 | PROV10       | Piña de estilo moderno.                              |        60.00 |
   | PROD19      | Botas de Montaña          | Calzado      |             11 | PROV11       | Botas de montaña resistentes al agua.                |        80.00 |
   | PROD2       | Figura Decorativa         | Decoración   |              2 | PROV2        | Figura decorativa para el hogar.                     |        90.00 |
   | PROD20      | Cámara Digital            | Electrónica  |              7 | PROV7        | Cámara digital compacta de alta resolución.          |       300.00 |
   | PROD3       | Reloj de Pared            | Relojes      |              3 | PROV3        | Reloj de pared con estilo clásico.                   |       110.00 |
   | PROD4       | Jarrón de Porcelana       | Ornamentales |              1 | PROV1        | Jarrón de Porcelana de diseño elegante.              |        60.00 |
   | PROD5       | Cuadro Moderno            | Ornamentales |              2 | PROV2        | Cuadro decorativo con estilo moderno.                |        80.00 |
   | PROD6       | Lámpara de Pie            | Ornamentales |              3 | PROV3        | Lámpara de Pie con diseño contemporáneo.             |       120.00 |
   | PROD7       | Guitarra Acústica         | Música       |              4 | PROV4        | Guitarra acústica para músicos profesionales.        |       400.00 |
   | PROD8       | Mesa de Comedor           | Muebles      |              5 | PROV5        | Mesa de comedor extensible en madera de roble.       |       700.00 |
   | PROD9       | Telescopio Astronómico    | Ciencia      |              6 | PROV6        | Telescopio para aficionados a la astronomía.         |       300.00 |
   +-------------+---------------------------+--------------+----------------+--------------+------------------------------------------------------+--------------+
   ```

   5. Vista de las gamas

      ```sql
      CREATE VIEW vista_gamas AS
      SELECT gama, descripcion_texto, descripcion_html, imagen
      FROM gama_producto;
      
      SELECT gama, imagen
      FROM vista_gamas;
      
      
      +--------------+-------------------------+
      | gama         | imagen                  |
      +--------------+-------------------------+
      | Calzado      | imagen_calzado.jpg      |
      | Ciencia      | imagen_ciencia.jpg      |
      | Cocina       | imagen_cocina.jpg       |
      | Decoración   | imagen_decoracion.jpg   |
      | Electrónica  | imagen_electronica.jpg  |
      | Frutales     | imagen_ropa.jpg         |
      | Iluminación  | imagen_iluminacion.jpg  |
      | Juguetes     | imagen_juguetes.jpg     |
      | Muebles      | imagen_muebles.jpg      |
      | Música       | imagen_musica.jpg       |
      | Ornamentales | imagen_ornamentales.jpg |
      | Relojes      | imagen_relojes.jpg      |
      +--------------+-------------------------+
      ```

      

   6. Vista de los paises

      ```sql
      CREATE VIEW vista_paises AS
      SELECT id_pais, nombre_pais
      FROM pais;
      
      SELECT id_pais, nombre_pais
      FROM vista_paises;
      
      +---------+-------------+
      | id_pais | nombre_pais |
      +---------+-------------+
      |       1 | España      |
      |       2 | Francia     |
      |       3 | Alemania    |
      |       4 | Italia      |
      |       5 | Reino Unido |
      +---------+-------------+
      ```

      

   7. Vista de las ciudades

      ```sql
      
      CREATE VIEW vista_ciudades AS
      SELECT id_ciudad, nombre_ciudad, codigo_postal, id_pais
      FROM ciudad;
      
      SELECT id_ciudad, nombre_ciudad, codigo_postal, id_pais
      FROM vista_ciudades;
      
      +-----------+---------------+---------------+---------+
      | id_ciudad | nombre_ciudad | codigo_postal | id_pais |
      +-----------+---------------+---------------+---------+
      |         1 | Madrid        | 28001         |       1 |
      |         2 | Fuenlabrada   | 08001         |       1 |
      |         3 | París         | 75001         |       2 |
      |         4 | Marsella      | 13001         |       2 |
      |         5 | Berlín        | 10115         |       3 |
      |         6 | Múnich        | 80331         |       3 |
      |         7 | Roma          | 00100         |       4 |
      |         8 | Milán         | 20121         |       4 |
      |         9 | Londres       | SW1A 1AA      |       5 |
      |        10 | Manchester    | M1 1AB        |       5 |
      +-----------+---------------+---------------+---------+
      ```

      

   8. Vista de los proveedores

      ```sql
      CREATE VIEW vista_proveedores AS
      SELECT id_proveedor, nombre, id_ciudad
      FROM proveedor;
      
      SELECT id_proveedor, nombre, id_ciudad
      FROM vista_proveedores;
      
      +--------------+------------------------+-----------+
      | id_proveedor | nombre                 | id_ciudad |
      +--------------+------------------------+-----------+
      | PROV1        | Proveedor Luminarias   |         1 |
      | PROV10       | Proveedor Frutales     |         2 |
      | PROV11       | Proveedor Calzado      |         1 |
      | PROV2        | Proveedor Decoraciones |         2 |
      | PROV3        | Proveedor Relojes      |         3 |
      | PROV4        | Proveedor Música       |         4 |
      | PROV5        | Proveedor Muebles      |         5 |
      | PROV6        | Proveedor Astronomía   |         6 |
      | PROV7        | Proveedor Electrónica  |         4 |
      | PROV8        | Proveedor Cocina       |         3 |
      | PROV9        | Proveedor Juguetes     |         1 |
      +--------------+------------------------+-----------+
      ```

      

   9. Vista de los jefes

      ```sql
      CREATE VIEW vista_jefes AS
      SELECT id_jefe, nombre, apellido1, apellido2, email, id_oficina, id_puesto
      FROM jefe;
      
      SELECT id_jefe, nombre, apellido1, apellido2, email, id_oficina, id_puesto
      FROM vista_jefes;
      
      +---------+---------+-----------+-----------+--------------------------+------------+-----------+
      | id_jefe | nombre  | apellido1 | apellido2 | email                    | id_oficina | id_puesto |
      +---------+---------+-----------+-----------+--------------------------+------------+-----------+
      |       7 | Juan    | Patroclo  | García    | juan.perez@example.com   | OF1        |         1 |
      |       8 | María   | López     | Martínez  | maria.lopez@example.com  | OF3        |         2 |
      |       9 | Alberto | Soria     | NULL      | albertosoria@example.com | OF4        |         3 |
      +---------+---------+-----------+-----------+--------------------------+------------+-----------+
      ```

      

   10. Vista de los pedidos

       ```sql
       CREATE VIEW vista_pedidos AS
       SELECT id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, id_cliente, metodo_pago, id_pago, id_estado
       FROM pedido;
       
       SELECT id_pedido, fecha_pedido, comentarios, id_cliente, metodo_pago, id_pago, id_estado
       FROM vista_pedidos;
       
       +-----------+--------------+---------------------------------------------+------------+------------------------+---------+-----------+
       | id_pedido | fecha_pedido | comentarios                                 | id_cliente | metodo_pago            | id_pago | id_estado |
       +-----------+--------------+---------------------------------------------+------------+------------------------+---------+-----------+
       |         1 | 2008-01-08   | Pedido entregado                            |          1 | Transferencia bancaria |    NULL |         4 |
       |         2 | 2010-05-07   | Pedido entregado                            |          2 | PayPal                 |    NULL |         4 |
       |         3 | 2009-01-06   | Pedido procesado                            |          3 | Tarjeta de Credito     |    NULL |         1 |
       |         4 | 2008-05-08   | Pedido en proceso de preparación            |          1 | PayPal                 |    NULL |         1 |
       |         5 | 2010-05-07   | Pedido en tránsito                          |          2 | Cheque                 |    NULL |         1 |
       |         6 | 2009-05-06   | Pedido procesado                            |          3 | PayPal                 |    NULL |         1 |
       |         8 | 2008-05-10   | Pedido entregado antes de la fecha esperada |          1 | Transferencia bancaria |       1 |         4 |
       |         9 | 2009-05-11   | Pedido entregado antes de la fecha esperada |          2 | PayPal                 |       2 |         4 |
       |        10 | 2010-05-12   | Pedido entregado antes de la fecha esperada |          3 | Tarjeta de Credito     |       3 |         4 |
       |        11 | 2008-05-12   | Pedido entregado en la fecha esperada       |          4 | Transferencia bancaria |       4 |         4 |
       |        12 | 2009-05-12   | Pedido Cancelado                            |          5 | PayPal                 |       5 |         5 |
       |        13 | 2008-03-15   | Pedido entregado                            |          1 | Transferencia bancaria |    NULL |         4 |
       |        14 | 2009-08-20   | Pedido entregado                            |          2 | PayPal                 |    NULL |         4 |
       |        15 | 2010-01-10   | Pedido procesado                            |          3 | Tarjeta de Credito     |    NULL |         1 |
       |        16 | 2008-08-05   | Pedido en proceso de preparación            |          1 | PayPal                 |    NULL |         1 |
       |        17 | 2009-05-14   | Pedido en tránsito                          |          2 | Cheque                 |    NULL |         1 |
       |        18 | 2010-02-17   | Pedido procesado                            |          3 | PayPal                 |    NULL |         1 |
       |        19 | 2008-07-10   | Pedido entregado antes de la fecha esperada |          1 | Transferencia bancaria |    NULL |         4 |
       |        20 | 2009-12-08   | Pedido entregado antes de la fecha esperada |          2 | PayPal                 |    NULL |         4 |
       |        21 | 2010-05-02   | Pedido entregado antes de la fecha esperada |          3 | Tarjeta de Credito     |    NULL |         4 |
       |        22 | 2008-09-20   | Pedido entregado en la fecha esperada       |          4 | Transferencia bancaria |    NULL |         4 |
       |        23 | 2009-04-14   | Pedido Cancelado                            |          5 | PayPal                 |    NULL |         5 |
       |        24 | 2010-03-18   | Pedido en proceso                           |          6 | Transferencia bancaria |    NULL |         1 |
       +-----------+--------------+---------------------------------------------+------------+------------------------+---------+-----------+
       ```

       
