<?php
class Model_Template extends CI_Model
{ 
   function __construct()
   {
       parent::__construct();       
       $this->db->query("SET SESSION time_zone='-4:00'");
   }
   #############################################################################
   function add_time_default_to_user($user_id)
   {
      $ts_before_20_years = strtotime("1987-07-07");
      
      $data=array(
         "user_id"=>$user_id,
         "time_in"=>date("Y-m-d H:i:s", $ts_before_20_years),
         "time_out"=>date("Y-m-d H:i:s", $ts_before_20_years+1),
         "status_in"=>"Valid",
         "status_out"=>"Valid",
         );
      
      $this->db->insert("times",$data);            
   }
   #############################################################################
   function get_row_time_last_by_user($user_id)
   {
      $sql_last="SELECT ti.*
                 FROM times ti, users us
                 WHERE us.id='".$user_id."'
                   AND ti.user_id=us.id
                 ORDER BY ti.time_in DESC, 
                          ti.time_out ASC
                 LIMIT 1;";      
      $query = $this->db->query($sql_last); 
      
      return $query->row_array();
   }
   #############################################################################
   function get_id_selectable_by($table_name, $var_name, $value, $sub_group=null)
   {
      /*
      $trace_exception = new Exception();
      $trace = $trace_exception->getTrace();
      $last_call = $trace[ 1 ];
      echo "<br><pre>";
      print_r( $last_call );
      echo "</pre><BR>";
      */
      
      $this->db->select(" 
                 id,
                 value_select,
                 table_name,
                 var_name,
                 order_by");
      
      $this->db->from("selectables");
      $this->db->where("LOWER(table_name)",strtolower($table_name));      
      $this->db->where("LOWER(var_name)", strtolower($var_name));            
      $this->db->where("LOWER(value_select)",strtolower($value));      
      
      if(isset($sub_group) AND strcasecmp( $sub_group,"")!=0)
      {
         $this->db->where("LOWER(sub_group)", strtolower($sub_group));      
      }      
      $this->db->limit(1);      
      $query = $this->db->get();            
      $row = $query->row_array();      
      
      return $row['id'];
   }
   #############################################################################
   function get_selectable_by($id)
   {
      $this->db->select(" 
                 *");
      
      $this->db->from("selectables");
      $this->db->where("id", $id);      
            
      $this->db->limit(1);      
      $query = $this->db->get();            
      $row = $query->row_array();      
      
      return $row;
   }
   #############################################################################
   function get_list_selectable_by($table_name, 
                                   $var_name, 
                                   $value_select=null, 
                                   $sub_group=null, 
                                   $minus_array_values=array())
   {
      $this->db->select(" 
                 id,
                 value_select,
                 table_name,
                 var_name,
                 order_by");
      
      $this->db->from("selectables");
      $this->db->where("LOWER(table_name)", strtolower($table_name));      
      $this->db->where("LOWER(var_name)", strtolower($var_name));      
      
      if(isset($value_select))
      {
         $this->db->where("LOWER(value_select)", strtolower( $value_select) );      
      }      
      
      if(isset($sub_group))
      {
         $this->db->where("LOWER(sub_group)", strtolower($sub_group));      
      }
      
      if(!empty($minus_array_values))
      {
         for($i=0; $i<count($minus_array_values);$i++)
         {
            $this->db->where("LOWER(value_select)!=", "'".strtolower($minus_array_values[$i])."'", FALSE);
         }
      }
      
      $this->db->order_by("order_by");      
      
      $query = $this->db->get();      
      return $query->result_array();
   }

}