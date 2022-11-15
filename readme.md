###Pelis API

Endpoint de la API: http://localhost/web2/tpe2/api/pelis

###Endpoints:

##Servicios GET

#GET/pelis: Accede al listado completo de peliculas que existen en la base de datos 'db_tpe' dentro de la tabla 'pelis'.
    ```
    *GET/pelis?sort=id&orderBy=desc
    ```

    Al agregar ```?sort=id&orderBy=desc``` permite ordenar de manera ascendente o descendente el campo especificado en el sort. Es posible ordenar solo por los campos que componen la tabla de la base de datos.

    *Paginación:
    ```
    *GET/pelis?inicio=value&porPagina=value
    ```
    Utilizando los Query Params es posible establecer la pagina que queremos mostrar con la variable INICIO y la cantidad de elementos a desarrollar en cada página con la variable PORPAGINA.

     {
        "id": 1,
        "nombre": "Alicia en el pais de las Maravillas",
        "estreno": "1951",
        "puntuacion": 7.1,
        "director": "Wilfred Jackson, Hamilton Luske y Clyde Geronimi.",
        "fk_estudio": 1,
        "nombre_estudio": "Walt Disney "
    },
    {
        "id": 2,
        "nombre": "Dumbo",
        "estreno": "1941",
        "puntuacion": 6.9,
        "director": "Ben Sharpteen, Norma Ferguson y Wilfred Jackson.",
        "fk_estudio": 1,
        "nombre_estudio": "Walt Disney "
    }
    ```
    *GET/pelis/:ID: Utilizando éste endpoint accedemos a la pelicula especificada en el parametro, si el ID es incorrecto la respuesta sera un 404.
    ```
    Ejemplo: GET/pelis/3

    {
    "id": 3,
    "nombre": "El libro de la Selva",
    "estreno": "1967",
    "puntuacion": 7.2,
    "director": "Larry Clemonds, Ralph Wright y Ken Anderson.",
    "fk_estudio": 1,
    "nombre_estudio": "Walt Disney "
    }

##Servicios POST

    *POST /pelis: Con éste endpoint agregamos una nueva pelicula a la base de datos a traves del body del postman.

    Ejemplo: POST/pelis

     {
        "id": 71,
        "nombre": "Black Panter",
        "estreno": "2023",
        "puntuacion": 9.1,
        "director": "Ryan Kyle Coogler",
        "fk_estudio": 1,
        "nombre_estudio": "Walt Disney "
    }

##Servicios PUT

    *PUT /pelis/:ID : Con éste endpoint accedemos a poder modificar una pelicula especifica a traves del parametro ID. La modificación se realiza a traves del body del postman.

##Servicio DELETE

    *DELETE/pelis/:ID : Éste endpoint elimina la pelicula indicada a traves del parametro ID. La respuesta de ser posible la eliminación será que el numero especifico de pelicula ha sido eliminado.