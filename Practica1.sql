/*  Práctica 1: Repaso de programación de consultas en BD Relacionales 

Instrucciones: Considerando la BD escuela, programe las siguientes consultas y rutinas. Puede utilizar vistas si la solución lo requiere.
Objetivo: Ejercitar la instrucción SELECT con sus diversas clausulas (INNER JOIN, LEFT JOIN, IN, EXIST, GROUP BY, entre otras)
          aplicando el menor número de operaciones posible para resolver las consultas.  
Fecha de entrega: viernes 18 de febrero a más tardar 11:30 pm
Modalidad: individual
*/

/* Consultas a resolver 
-- insertar 5 tuplas adicionales en curso_has_estudiante
-- 1: Listar los alumnos con estatus de regular (considere que un alumno regular puede tener no aprobada como máximo una materia)
-- 2: Listar el porcentaje de no aprobados por materia en los semestres 20212 y 20221 
-- 3: Listar los profesores que aprobaron a todos sus alumnos en todas sus materias
-- 4: Listar los profesores con el mayor porcentaje de no aprobados en los semestres 20212 y 20221
-- 5: Determinar si en la materia T302 existe un porcentaje de no aprobados entre el 30% y 50% en cada uno de sus grupos.
-- 6: Listar los alumnos que han aprobado todas las asignaturas que imparte el profesor  10275287
*/

USE escuela;
-- 1: Listar los alumnos con estatus de regular (considere que un alumno regular puede tener no aprobada como máximo una materia)
select  (case  when tabla.NoRegulares >1 then 'NoRegular'
             ELSE 'Regular' end) as Estatus, ce.idEstudiante
from curso_has_estudiante as ce
INNER JOIN (select (select count(calificacion) from curso_has_estudiante where idEstudiante=ce.idEstudiante and calificacion >6) as Regulares, 
(select count(calificacion) from curso_has_estudiante where idEstudiante=ce.idEstudiante and calificacion <6) as NoRegulares,
ce.idestudiante,count(calificacion) as TotalMateria
from curso_has_estudiante as ce group by idEstudiante,Regulares,NoRegulares ) AS TABLA ON TABLA.idEstudiante =ce.idEstudiante
where tabla.NoRegulares <=1 
group by idEstudiante;


-- No Regulares
select  (case  when tabla.NoRegulares >1 then 'NoRegular'
             ELSE 'Regular' end) as Estatus, ce.idEstudiante
from curso_has_estudiante as ce
INNER JOIN (select (select count(calificacion) from curso_has_estudiante where idEstudiante=ce.idEstudiante and calificacion >6) as Regulares, 
(select count(calificacion) from curso_has_estudiante where idEstudiante=ce.idEstudiante and calificacion <6) as NoRegulares,
ce.idestudiante,count(calificacion) as TotalMateria
from curso_has_estudiante as ce group by idEstudiante,Regulares,NoRegulares ) AS TABLA ON TABLA.idEstudiante =ce.idEstudiante
where tabla.Regulares <1 
group by idEstudiante;




-- 2: Listar el porcentaje de no aprobados por materia en los semestres 20212 y 20221 

SELECT *FROM curso_has_estudiante




