<?php
class Model_Disloques extends Model_Template
{ 
   function __construct(){
       parent::__construct();       
       $this->db->query("SET SESSION time_zone='-4:00'");
   }

   function get_lista_recaudadores($numero_disloque_limite=0){
      $query = $this->db->query("SELECT * FROM recaudadores WHERE recaudador_ultimo_disloque_numero<='".$numero_disloque_limite."'");
      return $query->result_array();   
   }

   function get_lista_disloques(){
      $query = $this->db->query("SELECT * FROM disloques");
      return $query->result_array();   
   }

   function get_maximo_disloque_numero(){
      $query = $this->db->query("SELECT MAX(disloque_numero) AS maximo_disloque_numero FROM disloques");
      $row = $query->row();

      $max = 0;

      if(isset($row->maximo_disloque_numero) ){
        $max = $row->maximo_disloque_numero;
      }
      return $max;
   }

   function get_lista_retenes(){
      $query = $this->db->query("SELECT * FROM retenes WHERE reten_estado='activo'");
      return $query->result_array();   
   }
  
   function add_dislocate($data){
      //$this->db->set("post_register_date","NOW()",FALSE);
      $this->db->insert("disloques",$data);
      return $this->db->insert_id();
   }
}