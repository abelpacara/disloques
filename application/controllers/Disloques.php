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
      $this->load->library('session');
      $this->load->model('model_disloques');
	}
	public function index()
	{		
		$view_data["lista_retenes"] = $this->model_disloques->get_lista_retenes();
		$view_data["lista_recaudadores"] = $this->model_disloques->get_lista_recaudadores();
		$view_data["maximo_disloque_numero"] = $this->model_disloques->get_maximo_disloque_numero();		

		$this->load->view('index.php', $view_data);
	}
}