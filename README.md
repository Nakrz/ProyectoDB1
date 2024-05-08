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
   | OF2        | Barcelona     |
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
   | OF2        | Barcelona     | +34 93 987 6543  |
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

