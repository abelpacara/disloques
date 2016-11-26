<?php
class Model_rotaciones extends Model_Template
{ 
   #####################################################
   function __construct(){
       parent::__construct();
       $this->db->query("SET SESSION time_zone='-4:00'");
   }
   #####################################################
   function get_lista_rotacion_recaudadores($rotacion_numero=0, $rotacion_id=0, $reten_id=0, $plan=0){
     
      /*$sql="SELECT recaudadores.* 
      FROM recaudadores 
      JOIN rotacion_recaudadores ON id_recaudador =  recaudador_id
      JOIN rotaciones ON rotacion_id = id_rotacion     
      WHERE rotacion_numero = ".$rotacion_numero."  AND reten_id = '".$reten_id."' AND rotacion_recaudador_plan='".$plan."'";*/


      $sql="SELECT rotacion_recaudadores.*, retenes.*, recaudadores.*
      FROM rotacion_recaudadores 
      JOIN retenes ON id_reten =  reten_id            
      JOIN recaudadores ON id_recaudador =  recaudador_id
      ORDER BY rotacion_numero DESC, reten_nombre ASC, rotacion_recaudador_plan ASC     
      ";

      //echo "<br>".$sql;

      $query = $this->db->query($sql.";");
            
      return $query->result_array();
   }



   #####################################################
   function get_rotacion($rotacion_numero=null){
      $sql = "SELECT * FROM rotaciones ";
      if(isset($id_rotacion)){
        $sql .= " WHERE rotacion_numero = ".$rotacion_numero;  
      }
      else{
        $sql .= " ORDER BY id_rotacion DESC LIMIT 1 ";   
      }

      $query = $this->db->query($sql);  
      
      return $query->row_array();
   }
   #####################################################
   function guardar_rotacion($data){

      $maximo_rotacion_numero = $this->get_maximo_rotacion_numero();

      $data['rotacion_numero'] = $maximo_rotacion_numero + 1 ;

      $this->db->trans_start();
      $this->db->insert("rotaciones",$data);
      $id_rotacion = $this->db->insert_id();
      $this->db->trans_complete();

      //return $id_rotacion;
      return $maximo_rotacion_numero;
   }
   #####################################################
   function guardar_rotacion_recaudador($data, $rotacion_numero=1){

      $this->db->trans_start();
      $this->db->insert("rotacion_recaudadores",$data);
      $id_rotacion_recaudador = $this->db->insert_id();
      $this->db->trans_complete();


      $this->db->trans_start();
      $this->db->set('recaudador_ultimo_rotacion_numero', $rotacion_numero);
      $this->db->where('id_recaudador', $data['recaudador_id']);
      $this->db->update('recaudadores'); 
      $this->db->trans_complete();
      

      return $id_rotacion_recaudador;
   }
   #####################################################
   function get_lista_rotaciones($fecha_del="", $fecha_al=""){

      $sql ="SELECT * FROM rotaciones ";

      if(strcasecmp($fecha_del,"")!=0 AND strcasecmp($fecha_del,"")!=0){
        $sql .= " WHERE 
                                                          (rotacion_fecha_del BETWEEN '".$fecha_del."' AND '".$fecha_al."')
                                                           OR
                
                                                          (rotacion_fecha_al BETWEEN '".$fecha_del."' AND '".$fecha_al."')";
        
      }
      $query = $this->db->query($sql." ORDER BY id_rotacion DESC;");      
      return $query->result_array();
   }
  
   #####################################################
   function get_lista_recaudadores_designados($rotacion_numero, $reten_id=0, $plan=1){
     
      /*$sql="SELECT recaudadores.* 
      FROM recaudadores 
      JOIN rotacion_recaudadores ON id_recaudador =  recaudador_id
      JOIN rotaciones ON rotacion_id = id_rotacion     
      WHERE rotacion_numero = ".$rotacion_numero."  AND reten_id = '".$reten_id."' AND rotacion_recaudador_plan='".$plan."'";*/


      $sql="SELECT recaudadores.* 
      FROM recaudadores 
      JOIN rotacion_recaudadores ON id_recaudador =  recaudador_id            

      WHERE rotacion_numero = ".$rotacion_numero." AND  reten_id = '".$reten_id."' AND rotacion_recaudador_plan='".$plan."'";


      //echo "<br>".$sql;

      $query = $this->db->query($sql.";");
            
      return $query->result_array();
   }
   #####################################################
   function get_lista_recaudadores_nuevos(){
      $sql="SELECT recaudadores.*
      FROM recaudadores
      WHERE recaudadores.recaudador_ultimo_rotacion_numero=0; ";


      $query = $this->db->query($sql);
            
      return $query->result_array();
   }

   #####################################################
   function get_lista_recaudadores_no_asignados(){
      $query = $this->db->query("SELECT * FROM recaudadores WHERE id_recaudador
                                 NOT IN (SELECT recaudador_id 
                                         FROM rotacion_recaudadores 
                                         WHERE NOW() BETWEEN rotacion_recaudador_fecha_del 
                                                         AND rotacion_recaudador_fecha_al);");
      return $query->result_array();
   }
   #####################################################
   function get_maximo_rotacion_numero(){
      $query = $this->db->query("SELECT MAX(rotacion_numero) AS maximo_rotacion_numero FROM rotaciones");
      $row = $query->row();

      $max = 0;

      if(isset($row->maximo_rotacion_numero) ){
        $max = $row->maximo_rotacion_numero;
      }
      return $max;
   }
   #####################################################
   function get_lista_retenes(){
      $query = $this->db->query("SELECT * FROM retenes WHERE reten_estado='activo'");
      return $query->result_array();   
   }
   #####################################################
   function agregar_rotacion_recaudadores($data){
      //$this->db->set("post_register_date","NOW()",FALSE);
      $this->db->insert("rotacion_recaudadores",$data);
      return $this->db->insert_id();
   }
  
}