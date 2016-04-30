<?php
class Model_rotaciones extends Model_Template
{ 
   #####################################################
   function __construct(){
       parent::__construct();
       $this->db->query("SET SESSION time_zone='-4:00'");
   }
   #####################################################
   function get_lista_rotaciones($fecha_del, $fecha_al){
      $query = $this->db->query("SELECT * FROM rotaciones WHERE 
                                                        (rotacion_fecha_del BETWEEN '".$fecha_del."' AND '".$fecha_al."')
                                                         OR
                                                        (rotacion_fecha_al BETWEEN '".$fecha_del."' AND '".$fecha_al."');");
      return $query->result_array();
   }
   #####################################################
   function get_lista_recaudadores($rotacion_id=0, $reten_id=0, $plan=1){
      $sql="SELECT recaudadores.* 
      FROM recaudadores 
      JOIN rotacion_recaudadores ON id_recaudador =  recaudador_id
      WHERE rotacion_id = '".$rotacion_id."' AND reten_id = '".$reten_id."' AND rotacion_recaudador_plan='".$plan."' ";

      $query = $this->db->query($sql.";");
            
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
   function add_collector_dislocate($data){
      //$this->db->set("post_register_date","NOW()",FALSE);
      $this->db->insert("rotacion_recaudadores",$data);
      return $this->db->insert_id();
   }
   #####################################################
   function add_dislocate($data){
      //$this->db->set("post_register_date","NOW()",FALSE);
      $this->db->insert("rotaciones",$data);
      return $this->db->insert_id();
   }
}