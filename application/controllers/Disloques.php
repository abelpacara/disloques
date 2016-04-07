<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Disloques extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();

		$this->load->helper(array('form', 'url'));
      $this->load->library('session');
      $this->load->model('model_disloques');
	}



	###########################################################
	public function guardar_disloque()
	{
		if(isset($_REQUEST['guardar_disloque'])){
			$cantidad_recaudadores_asignados = $_REQUEST['cantidad_recaudadores_asignados'];
			for($i=0;$i<$cantidad_recaudadores_asignados;$i++){
				echo "<br> ".$i." ASIGNACION=".$_REQUEST['reten_id_'.$i]." RECAUDADOR_ID=".$_REQUEST['recaudador_id_'.$i];
			}

		}


		$view_data["lista_retenes"] = $this->model_disloques->get_lista_retenes();
		$view_data["lista_recaudadores"] = $this->model_disloques->get_lista_recaudadores();
		$view_data["maximo_disloque_numero"] = $this->model_disloques->get_maximo_disloque_numero();		

		$this->load->view('guardar_disloque', $view_data);
	}

	public function index()
	{		
		$view_data["lista_retenes"] = $this->model_disloques->get_lista_retenes();
		$view_data["lista_recaudadores"] = $this->model_disloques->get_lista_recaudadores();
		$view_data["maximo_disloque_numero"] = $this->model_disloques->get_maximo_disloque_numero();		

		$this->load->view('index.php', $view_data);
	}
}