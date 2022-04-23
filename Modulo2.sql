insert into operario (idoperario, opernombre, operapellido, operedad, opercorreo) values
(1, 'erin', 'robles', 23, 'erinrobles@gmail.com'),
(2, 'pedro', 'zapata', 31, 'pedrozapata@gmail.com'),
(3, 'nicolas', 'quijada', 34, 'nicolasquijada@gmail.com'),
(4, 'francisca', 'carjaval', 22, 'franciscacarv@gmail.com'),
(5, 'fabian', 'fuentes', 29, 'fabianfuentes@gmail.com');


insert into categoria (idcategoria, catnombre, catdescripcion) values(1,'servidor','Problemas de comunicacion'),
(2,'software','sap'),(3,'Hardware','teclado'),(4,'Otros','Varios');

insert into soporte (idsoporte, operario_idoperario, usuario_idusuario, fecha_soporte, evaluacion, categoria_idcategoria) 
values(5,2,1, '2016-03-14', 4, 2),
      (6,8,2, '2022-11-06', 1, 1),
      (7,4,3, '2019-01-01', 5, 4),
      (8,3,2, '2016-01-11', 10, 1);

#1-. Seleccione las 3 operaciones con mejor evaluación.

SELECT * FROM soporte
ORDER BY evaluacion DESC
LIMIT 3;

#2-. Seleccione las 3 operaciones con menos evaluación.

SELECT * FROM soporte
ORDER BY evaluacion ASC
LIMIT 3;

#3-.Seleccione al operario que más soportes ha realizado.

select operario_idoperario, count(*) from soporte 
group by operario_idoperario;

select operario_idoperario,count(idsoporte) from soporte group by  operario_idoperario order by count(idsoporte) desc
limit 1;

select max(operario.opernombre) from (
select count(s.idsoporte),o.opernombre from operario as o inner join soporte as s
on o.idoperario=s.operario_idoperario
group by o.opernombre) as operario;



#4-. Seleccione al cliente que menos veces ha utilizado la aplicación.

select usuario_idusuario, count(idsoporte) from soporte group by usuario_idusuario order by count(idsoporte) asc
limit 2;
 
select min(usu.nombre) from (
select count(s.id),u.nombre from usuario as u inner join soporte as s
on u.id=s.id_usu
group by u.nombre) as usu;

#5-. Agregue 10 años a los tres primeros usuarios registrados.

update usuario set useredad = useredad + 10 where idusuario in( select idusuario from usuario order by idusuario limit 3);

update usuario set useredad=useredad+10 where idusuario in (select idusuario from (select idusuario from usuario  limit 3) as usu);

#6-. Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.

ALTER TABLE usuario
rename COLUMN usercorreo to email;

#7-. Seleccione solo los operarios mayores de 20 años.

select * from operario where operedad > 20;

select * from soporte;





