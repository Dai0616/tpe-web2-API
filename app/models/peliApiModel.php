<?php

class PeliApiModel {
    private $db;

    public function  __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tpe;charset=utf8', 'root', '');
      
    }

    function getAll() {
        $query = $this->db->prepare("SELECT pelis.id, pelis.nombre, pelis.estreno, pelis.puntuacion, pelis.director, pelis.fk_estudio, estudio.nombre_estudio FROM pelis INNER JOIN estudio ON pelis.fk_estudio = estudio.id_nombre_fk ORDER BY id ASC");
        $query->execute();
        $pelis = $query->fetchAll(PDO::FETCH_OBJ);
        
        return $pelis;
    }

    public function get($id){
        $query = $this->db->prepare("SELECT pelis.id, pelis.nombre, pelis.estreno, pelis.puntuacion, pelis.director, pelis.fk_estudio, estudio.nombre_estudio FROM pelis INNER JOIN estudio ON pelis.fk_estudio = estudio.id_nombre_fk WHERE `id`=?");
        $query->execute([$id]);
        $peli = $query->fetch(PDO::FETCH_OBJ);
        return $peli;
    }

    public function order($sort, $orderBy){
          $query = $this->db->prepare("SELECT pelis.id, pelis.nombre, pelis.estreno, pelis.puntuacion, pelis.director, pelis.fk_estudio, estudio.nombre_estudio FROM pelis INNER JOIN estudio ON pelis.fk_estudio = estudio.id_nombre_fk ORDER BY $sort $orderBy" );
          $query->execute();
          $pelisOrder = $query->fetchAll(PDO::FETCH_OBJ);
          return $pelisOrder;
    }

    public function getPaginacion($desde, $porPagina){
        $query = $this->db->prepare("SELECT pelis.id, pelis.nombre, pelis.estreno, pelis.puntuacion, pelis.director, pelis.fk_estudio, estudio.nombre_estudio FROM pelis INNER JOIN estudio ON pelis.fk_estudio = estudio.id_nombre_fk ORDER BY id ASC LIMIT $desde,$porPagina");
        $query->execute();
        $pelis= $query->fetchAll(PDO::FETCH_OBJ);
        return $pelis;
    }
    
    public function add($pelicula, $estreno, $puntuacion, $director, $fk_estudio) {
        $query = $this->db->prepare("INSERT INTO pelis (nombre, estreno, puntuacion, director, fk_estudio) VALUES ( ?, ?, ?, ?, ?)");
        $query->execute([$pelicula, $estreno, $puntuacion, $director, $fk_estudio]);

        return $this->db->lastInsertId();
    }

     function update($id, $pelicula, $estreno, $puntuacion, $director, $fk_estudio) {
         $query = $this->db->prepare("UPDATE `pelis` SET nombre=?, estreno=?, puntuacion=?, director=?, fk_estudio=? WHERE id=?");
         $query->execute([$pelicula, $estreno, $puntuacion, $director, $fk_estudio,$id]);
    
     }

    function delete($id) {
        $query = $this->db->prepare('DELETE FROM pelis WHERE id = ?');
        $query->execute([$id]);
    
    }

}
