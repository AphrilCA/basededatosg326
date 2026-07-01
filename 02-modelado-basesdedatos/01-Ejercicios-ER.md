# Ejercicios del modelo Entidad Relacion

## Ejercicio 1.
Un hospital registra informacion de sus pacientes, de cada paciente se almacnea lo sig:
> De cada paciente
- Un valor ue lo identifiue
- Un nombre
- Fecha de nacimiento
> De cada expediente medico:
- Numero de expediente
- Fecha de apertura
- Tipo de sangre
> Reglas del negocio
1. Cada paciente debe tener exactamente un expediente medico
2. Cada paciente medico pertenece a algun unico paciente
3. No puede existir un expediente sin paciente
4. No puede existir un paciente sin expediente
![Solucion Ej1](../img/Ejercicio.1.drawio.png)


## Ejercicio 2.
Una universidad administra profesores y cursos
>De cada profesor se almacena:
- Numero de profesor
- Nombre
- Especialidad
>De cada curso se almacena:
- Numero de curso
- Nombre del curso
- Creditos

>Reglas del negocio:
1. Un profesor puede impratir varios cursos 
2. Un curso solamente puede ser impartido por un profesor
3. Puede existir un profesor ue actualmente no imparta cursos
4. Todo curso debe estar asignado un profesor
>Lo ue debe realizar
- Identificar y dibujar las entidades
-Identificar y dibujar la relacion
**Imparte**
- Determinar la razon de cardinalidad
- Determinar la participacion

![Solucion Ej2](../img/Ejercicio.2.drawio.png)

## Ejercicio 3.
Una escuela administra alumnos y materias
>Cada aumno se almacena:
- Mtaricula
- Nombre
- Semestre
>De cada materia se almacena:
- Clave de la materia
- Nombre de la materia
- Creditos
>Reglas del negocio:
1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos
3. Puede existir una materia sin alumnos inscritos
4. Todo alumno debe estar inscrito en al menos una materia 
5. De cada inscripcion se desea almacenar:  
    - Fecha de inscripcion
    - Calificacion final

    Nota: La relacion se debe llamar **Inscribe**

    ![Solucion Ej3](../img/Ejercicio.3.drawio.png)


    ## Ejercicio 4
    Una empresa se dedica a la venta de productos al por mayor, y necesita registrar lo siguiente:
    > Necesita almacenar:
    - Identificador del cliente
    - Nombre dek cliente, el cual es una persona moral
    > De los pedidos de venta:
    - Numero de pedido
    -Fecha de pedido
    > De los productos:
    - Numero de producto
    - Nombre del producto
    - Precio del producto
    > Reglas del producto
    1. Un cliente piede realizar muchos pedidos
    2. Cada cliente pertenece a un solo cliente
    3. Un pedido contiene varios productos
    4. Un producto puede aparecer en muchos pedidos
    5. Un pedido debe contener al menos un producto
    6. Un producto puede no haber sido vendido
    7. El detalle del pedido no existe sin pedido
    8. El detalle del pedido no existe sin producto 
    9. El detalle del pedido almacena cantidad vendida y precio de venta 

    ![Solucion Ej4](../img/Ejercicio.4.drawio.png) 

    ## Ejercicio 5

    1. The company is organized into departments. Each department has a unique name, a 
    unique number, and a particular employee who manages the department.We keep track 
    of the start date when that employee began managing the department. A department 
    may have several locations. 
    2. A department controls a number of projects, each of which has a unique name, a unique 
    number, and a single location. 
    3. We store each employee's name, Social Security number, address, salary, sex (gender), 
    and birth date. An employee is assigned to one department, but may work on several 
    projects, which are not necessarily controlled by the same department. We keep track of 
    the current number of hours per week that an employee works on each project. We also 
    keep track of the direct supervisor of each employee (who is another employee). 
    4. We want to keep track of the dependents of each employee for insurance purposes.We 
    keep each dependent's first name, sex, birth date, and relationship to the employee. 

     ![Solucion Ej5](../img/Diagrama%205.drawio.png)
