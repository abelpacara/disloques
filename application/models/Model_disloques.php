<?php
class Model_Disloques extends Model_Template
{ 
   function __construct(){
       parent::__construct();       
       $this->db->query("SET SESSION time_zone='-4:00'");
   }

   function get_lista_recaudadores(){
      $query = $this->db->query("SELECT * FROM recaudadores");
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
  
   function add_post($data){
   	$this->db->set("post_register_date","NOW()",FALSE);
   	
      $this->db->insert("posts",$data);
      return $this->db->insert_id();
   }

   function get_list_comments(){
      $query = $this->db->query("SELECT * FROM
            (
            (SELECT posts.*, 
                projects.post_content AS project_content,
                forums.post_content AS forum_content  
         FROM posts 
               JOIN posts AS projects ON projects.id_post=posts.project_id
               JOIN posts AS forums ON forums.id_post=posts.forum_id   
               WHERE posts.post_type='comment' OR  posts.post_type='forum'      
               ORDER BY posts.post_date DESC, posts.post_register_date DESC)
         UNION
         (
             SELECT posts.*,                    
                   projects.post_content AS project_content,
                   NULL AS forum_content  
                                 FROM posts 
      JOIN posts AS projects ON projects.id_post=posts.project_id      
      WHERE posts.post_type='forum'
      ORDER BY posts.post_date DESC, posts.post_register_date DESC)) AS tablex
      ORDER BY tablex.id_post DESC");         
      return $query->result_array();
   }

   function get_list_projects(){
      $query = $this->db->query("SELECT * FROM posts 
      WHERE post_type='project' 
      ORDER BY post_date DESC, post_register_date DESC;");         
      return $query->result_array();
   }

   function get_list_forums(){
      $query = $this->db->query("SELECT forums.id_post AS id_forum, projects.id_post AS id_project, forums.post_title AS forum_title, projects.post_title AS project_title 
      FROM posts forums
      JOIN  posts projects ON forums.parent_id = projects.id_post
      WHERE forums.post_type='forum'      
      ORDER BY forums.parent_id");         
      return $query->result_array();
   }

   function get_list_posts(){
      $query = $this->db->query("SELECT * FROM posts       
      ORDER BY post_date DESC, post_register_date DESC;");         
      return $query->result_array();
   }
}