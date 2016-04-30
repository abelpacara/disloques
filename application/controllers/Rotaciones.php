<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rotaciones extends CI_Controller {

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
      $this->load->model('model_rotaciones');
	}

	###########################################################
	public function test_rotacion(){
		ob_start();
		?>
		<table border="1">
			<tr>
				<td>
					ABC1
				</td>
				<td>
					ABC2
				</td>
			</tr>
		</table>
		<?php
		$str_plain_html = ob_get_clean();
		echo $str_plain_html;
	}
	###########################################################
	public function guardar_rotacion()
	{
		$view_data["maximo_rotacion_numero"] = $maximo_rotacion_numero = $this->model_rotaciones->get_maximo_rotacion_numero();

		if(isset($_REQUEST['guardar_rotacion'])){

			/*$dislocate_data['rotacion_fecha_del'] = $_REQUEST['rotacion_fecha_del'];
			$dislocate_data['rotacion_fecha_al'] = $_REQUEST['rotacion_fecha_al'];
*/
			$dislocate_data['rotacion_numero'] = $maximo_rotacion_numero+1;

			$rotacion_id = $this->model_rotaciones->add_dislocate($dislocate_data);


			$maximo_recaudadores = $_REQUEST['maximo_recaudadores'];
			
			

			for($i=1;$i<=$maximo_recaudadores;$i++){

				list($id_rotacion, $id_reten, $id_recaudador, $plan) = explode("|", $_REQUEST['rotacion_reten_recaudador_plan_'.$i]);

				$data['rotacion_id'] = $id_rotacion;
				$data['reten_id'] = $id_reten;
				$data['recaudador_id'] = $id_recaudador;
				$data['rotacion_recaudador_plan'] = $plan;

				$this->model_rotaciones->add_collector_dislocate($data);
			}

		}



		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	


		$view_data["lista_retenes"] = $lista_retenes = $this->model_rotaciones->get_lista_retenes();
		$view_data["lista_rotaciones"] = $lista_rotaciones = $this->model_rotaciones->get_lista_rotaciones("2016-04-01", "2016-04-30");

		$planes = array("plan1"," plan2", "descanso");

		ob_start();
		?>
		<table border="1">
		<tr>
			<th># Rotacion</th>
			<?php
			for($i=0; $i<count($lista_retenes); $i++){
				?>
					<th>
					<?php
					echo $lista_retenes[$i]["reten_nombre"];
					?>
					</th>
				<?php
			}
			?>
		</tr>
		<?php

		$maximo_recaudadores = 0;

		for($i=0;$i<count($lista_rotaciones);$i++){
			for($p=0;$p<count($planes);$p++){
				?>
				<tr>
					<td><?php echo $lista_rotaciones[$i]['rotacion_numero']." ".$planes[$p]?></td>
					<?php
					for($j=0;$j<count($lista_retenes);$j++){
						?>
						<td>
							<?php
								//$lista_rotaciones_recaudadores[$i][$lista_retenes[$i]['reten_nombre']] = $this->model_rotaciones->get_lista_recaudadores($lista_rotaciones[$i]['id_rotacion'], $lista_retenes[$j]['id_reten']);
							$lista_recaudadores = $this->model_rotaciones->get_lista_recaudadores($lista_rotaciones[$i]['id_rotacion'], $lista_retenes[$j]['id_reten'], $planes[$p]);
							
							?>
							<table border="1">
							<?php
							for($k=0;$k<count($lista_recaudadores);$k++){
								$maximo_recaudadores++;
								?>
								<tr>
									<td>
										<input type="checkbox" name="rotacion_reten_recaudador_plan_<?php echo $maximo_recaudadores?>" 
										value="
										<?php echo $lista_rotaciones[$i]['id_rotacion'].'|'.$lista_retenes[$j]['id_reten'].'|'.$lista_recaudadores[$k]['id_recaudador'].'|'.$planes[$p];?>"/>
										<?php echo $lista_recaudadores[$k]["recaudador_nombres"]." ".$lista_recaudadores[$k]["recaudador_apellidos"]?>
										<select>
											<option>Cambiar a ...</option>
											<?php
											for($l=0;$l<count($lista_retenes); $l++){
												?>
												<option>
												<?php
													echo $lista_retenes[$l]["reten_nombre"];
												?>
												</option>
												<?php
											}
											?>
										</select>
									</td>
								</tr>
							<?php
							}
							?>
							</table>
						</td>
						<?php
					}
					?>
				</tr>
				<?php
			}
		}
		?>
		<input type="hidden" name="maximo_recaudadores" value="<?php echo $maximo_recaudadores?>"/>
		<?php
		$view_data["str_part_view"] = $str_part_view = ob_get_clean();


		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	


		$this->load->view('guardar_rotacion', $view_data);
	}
	#####################################################
	public function gestion_rotaciones(){

		$view_data["lista_retenes"] = $lista_retenes = $this->model_rotaciones->get_lista_retenes();
		$view_data["lista_rotaciones"] = $lista_rotaciones = $this->model_rotaciones->get_lista_rotaciones("2016-04-01", "2016-04-30");

		$planes = array("plan1"," plan2", "descanso");

		ob_start();
		?>
		<table border="1">
		<tr>
			<th># Rotacion</th>
			<?php
			for($i=0; $i<count($lista_retenes); $i++){
				?>
					<th>
					<?php
					echo $lista_retenes[$i]["reten_nombre"];
					?>
					</th>
				<?php
			}
			?>
		</tr>
		<?php
		for($i=0;$i<count($lista_rotaciones);$i++){
			for($p=0;$p<count($planes);$p++){
				?>
				<tr>
					<td><?php echo $lista_rotaciones[$i]['rotacion_numero']." ".$planes[$p]?></td>
					<?php
					for($j=0;$j<count($lista_retenes);$j++){
						?>
						<td>
							<?php
								//$lista_rotaciones_recaudadores[$i][$lista_retenes[$i]['reten_nombre']] = $this->model_rotaciones->get_lista_recaudadores($lista_rotaciones[$i]['id_rotacion'], $lista_retenes[$j]['id_reten']);
							$lista_recaudadores = $this->model_rotaciones->get_lista_recaudadores($lista_rotaciones[$i]['id_rotacion'], $lista_retenes[$j]['id_reten'], $planes[$p]);
							
							?>
							<table>
							<?php
							for($k=0;$k<count($lista_recaudadores);$k++){
								
								?>
								<tr>
									<td>
										<?php echo $lista_recaudadores[$k]["recaudador_nombres"]." ".$lista_recaudadores[$k]["recaudador_apellidos"]?>
									</td>
								</tr>
								<?php
							}?>
							</table>
						</td>
						<?php
					}
					?>
				</tr>
				<?php
			}
		}

		$str_view = ob_get_clean();

		echo $str_view;

		//$this->load->view('gestion_rotaciones', $view_data);
	}
	#####################################################
	public function index(){
		$view_data["lista_retenes"] = $this->model_rotaciones->get_lista_retenes();
		$view_data["lista_recaudadores"] = $this->model_rotaciones->get_lista_recaudadores();
		$view_data["maximo_rotacion_numero"] = $this->model_rotaciones->get_maximo_rotacion_numero();

		$this->load->view('index.php', $view_data);
	}
}