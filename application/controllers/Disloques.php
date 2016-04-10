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
		$view_data["maximo_disloque_numero"] = $maximo_disloque_numero = $this->model_disloques->get_maximo_disloque_numero();

		if(isset($_REQUEST['guardar_disloque'])){

			$dislocate_data['disloque_fecha_del'] = $_REQUEST['disloque_fecha_del'];
			$dislocate_data['disloque_fecha_al'] = $_REQUEST['disloque_fecha_al'];

			$dislocate_data['disloque_numero'] = $maximo_disloque_numero+1;

			$disloque_id = $this->model_disloques->add_dislocate($dislocate_data);


			$cantidad_recaudadores_asignados = $_REQUEST['cantidad_recaudadores_asignados'];
			for($i=0;$i<$cantidad_recaudadores_asignados;$i++){
				echo "<br> ".$i." ASIGNACION=".$_REQUEST['reten_id_'.$i]." RECAUDADOR_ID=".$_REQUEST['recaudador_id_'.$i];


				$data['reten_id'] = $_REQUEST['reten_id_'.$i];
				$data['recaudador_id'] =$_REQUEST['recaudador_id_'.$i];

				$data['disloque_recaudador_fecha_del'] = $_REQUEST['disloque_fecha_del'];
				$data['disloque_recaudador_fecha_al'] = $_REQUEST['disloque_fecha_al'];

				$data['disloque_id'] = $disloque_id;
				

				$this->model_disloques->add_collector_dislocate($data);
			}

		}


		$view_data["lista_retenes"] = $this->model_disloques->get_lista_retenes();
		
		$view_data["lista_recaudadores_asignados"] = $this->model_disloques->get_lista_recaudadores_asignados();
		$view_data["lista_recaudadores_no_asignados"] = $this->model_disloques->get_lista_recaudadores_no_asignados();

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