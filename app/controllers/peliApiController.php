<?php
require_once './app/models/peliApiModel.php';
require_once './app/views/api.view.php';

class PeliApiController {

    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new PeliApiModel();
        $this->view = new PeliApiView();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function  getAll() {
        $sortWL= ['id','nombre', 'estreno', 'puntuacion', 'director', 'nombre_estudio'];
        $orderByWL= ['asc', 'desc'];
        if(isset($_GET['sort']) || isset($_GET['orderBy'])){
            if (isset($_GET['sort'])&&isset($_GET['orderBy']) && in_array($_GET['orderBy'], $orderByWL) && in_array($_GET['sort'], $sortWL)){
                $sort=$_GET['sort'];
                $orderBy=$_GET['orderBy'];
                $pelisOrder = $this->model->order($sort, $orderBy);
                $this->view->response($pelisOrder, 200);
            }
            else if(!isset($_GET['orderBy']) && isset($_GET['sort']) && in_array($_GET['sort'], $sortWL)){
                $sort=$_GET['sort'];
                $orderBy="ASC";
                $pelisOrder = $this->model->order($sort, $orderBy);
                $this->view->response($pelisOrder, 200);
             }
        }
        
        else if((isset($_GET['porPagina']) && isset($_GET['inicio'])) && (is_numeric($_GET['porPagina']) && is_numeric($_GET['inicio']))){
            if (isset($_GET['inicio'])){
                $inicio = $_GET['inicio'];
            }else{
                $inicio=0;
            }
            if(isset($_GET['porPagina'])) {
                $porPagina = $_GET['porPagina'];
            }
            else {
                $porPagina = 3;
            }
            $desde = ((int)$inicio-1)*(int)$porPagina;
            $pelis = $this->model->getPaginacion($desde, $porPagina);
            $this->view->response($pelis, 200);
        }
        else if(!isset($_GET['porPagina']) && isset($_GET['inicio'])){            
            if (is_numeric($_GET['inicio'])){              
                $inicio = $_GET['inicio'];
            }            
            else {
                $inicio = 0;
            }
            $porPagina = 3;
            $desde = ((int)$inicio-1)*(int)$porPagina;
            $pelis = $this->model->getPaginacion($desde, $porPagina);
            $this->view->response($pelis, 200);    
        }       
        else{
            $pelis = $this->model->getAll();
            $this->view->response($pelis, 200); 
        }  
    
        
    }    

    public function getPeli($params = null) {
        $id = $params[':ID']; 
        $peli = $this->model->get($id);
        if ($peli){
            $this->view->response($peli, 200);
        }
        else{
            $this->view->response("La pelicula con el id=$id no existe", 404);
        }
    } 
    
    public function addPeli($params = null) {
        $peli = $this->getData();

        if (empty($peli->nombre) || empty($peli->estreno) || empty($peli->puntuacion) || empty($peli->director) || empty($peli->fk_estudio) ) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->add($peli->nombre, $peli->estreno, $peli->puntuacion, $peli->director, $peli->fk_estudio);
            $peli = $this->model->get($id);
            $this->view->response($peli, 201);
        }
    }

     public function editarPeli($params = null) {
         $id = $params[':ID'];
         $data = $this->getData();
         $peli = $this->model->get($id);
         if ($peli) {
             $this->model->update($id, $data->nombre, $data->estreno, $data->puntuacion, $data->director, $data->fk_estudio);
             $peliupd = $this->model->get($id);
             $this->view->response($peliupd, 200);
         } else
             $this->view->response("La pelicula con el id=$id no existe", 404);
     }

    public function borrarPeli($params = null) {
        $id = $params[':ID'];
        $peli = $this->model->get($id);
        if ($peli) {
            $this->model->delete($id);
            $this->view->response("La pelicula fue borrada con exito.", 200);
        } else {
            $this->view->response("La pelicula con el id=$id no existe", 404);
        }
    }
}