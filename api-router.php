<?php

require_once './libs/Router.php';
require_once './app/controllers/peliApiController.php';

$router = new Router();

// define la tabla de ruteo
$router->addRoute('pelis', 'GET', 'PeliApiController', 'getAll');
$router->addRoute('pelis/:ID', 'GET', 'PeliApiController', 'getPeli');
$router->addRoute('pelis', 'POST', 'PeliApiController', 'addPeli');
$router->addRoute('pelis/:ID', 'PUT', 'PeliApiController', 'editarPeli');
$router->addRoute('pelis/:ID', 'DELETE', 'PeliApiController', 'borrarPeli');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);



