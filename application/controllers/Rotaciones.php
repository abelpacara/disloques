<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rotaciones extends CI_Controller {

	public $planes; //= array("plan1", "plan2", "plan3", "plan4", "plan5", "descanso");

	public function __construct(){
		parent::__construct();

		$this->load->helper(array('form', 'url'));
      $this->load->library('session');
      $this->load->model('model_rotaciones');

      $this->planes = $this->model_rotaciones->get_list_table_enum_column_values("rotacion_recaudadores", "rotacion_recaudador_plan");

	}

	###########################################################
	public function rotacion_recaudadores(){
		$this->load->library('Pdf');


		$obj_pdf = new TCPDF('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
		$obj_pdf->SetCreator(PDF_CREATOR);
		$title = "PDF Report";
		$obj_pdf->SetTitle($title);
		$obj_pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, $title, PDF_HEADER_STRING);
		$obj_pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$obj_pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
		$obj_pdf->SetDefaultMonospacedFont('helvetica');
		$obj_pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$obj_pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
		$obj_pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$obj_pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
		$obj_pdf->SetFont('helvetica', '', 9);
		$obj_pdf->setFontSubsetting(false);
		$obj_pdf->AddPage();
		ob_start();


			$lista_rotacion_recaudadores = $this->model_rotaciones->get_lista_rotacion_recaudadores();


			?>
			<table style="border-width: 1px">
			
				<tr>
					<td>#</td>
					<td># rotacion</td>
					<td>Reten</td>
					<td>Recaudador</td>
					<td>Plan</td>
				</tr>
			
				<?php
				for($i=0;$i<count($lista_rotacion_recaudadores); $i++){
				?>
					<tr>
						<td  style="border-width: 1px"><?php echo $i+1?></td>
						<td  style="border-width: 1px"><?php echo $lista_rotacion_recaudadores[$i]['rotacion_numero']?></td>
						<td  style="border-width: 1px"><?php echo $lista_rotacion_recaudadores[$i]['reten_nombre']?></td>
						<td  style="border-width: 1px"><?php echo $lista_rotacion_recaudadores[$i]['recaudador_nombres']?></td>
						<td  style="border-width: 1px"><?php echo $lista_rotacion_recaudadores[$i]['rotacion_recaudador_plan']?></td>
					</tr>
				<?php
				}?>
			</table>

			<?php


		    // we can have any view part here like HTML, PHP etc
		    $content = ob_get_contents();
		ob_end_clean();


		$obj_pdf->writeHTML($content, true, false, true, false, '');
		$obj_pdf->Output('output.pdf', 'I');
	}
	###########################################################
	public function iniciar_rotacion(){

		$lista_recaudadores = $this->model_rotaciones->get_lista_recaudadores_nuevos();
		$cantidad_recaudadores = count($lista_recaudadores);

		
		if($cantidad_recaudadores>0){
			$lista_retenes = $this->model_rotaciones->get_lista_retenes();
			$cantidad_retenes = count($lista_retenes);	



			if(isset($_REQUEST['guardar_rotacion'])){

				$hay_asignacion_a_rotacion = FALSE;

				 $rotacion_numero = $this->model_rotaciones->guardar_rotacion(array("rotacion_fecha_del"=>$_REQUEST['fecha_del'], "rotacion_fecha_al"=>$_REQUEST['fecha_al']) );

				for($i=0;$i<$cantidad_recaudadores;$i++){
					for($j=0;$j<$cantidad_retenes;$j++){


						if(isset($_REQUEST["plan_".$i."_".$j]) AND strcasecmp($_REQUEST["plan_".$i."_".$j], "")!=0){
						/*	$data['rotacion_recaudador_fecha_del'] = $_REQUEST["fecha_del"];
							$data['rotacion_recaudador_fecha_al'] = $_REQUEST["fecha_al"];
						*/
						##############################
											
						$data['rotacion_recaudador_plan'] = $_REQUEST["plan_".$i."_".$j];

						$hay_asignacion_a_rotacion = TRUE;

						}
						else{
							$data['rotacion_recaudador_plan'] = $this->planes[count($this->planes)-1];
						}
						$data['rotacion_numero'] = 1;

						$data['recaudador_id'] = $lista_recaudadores[$i]["id_recaudador"];
						$data['reten_id'] = $lista_retenes[$j]['id_reten'];	
						$this->model_rotaciones->guardar_rotacion_recaudador($data);
					}


				}

				redirect("rotaciones/guardar_rotacion");

			}

			ob_start();

			?>
			<table border="1">
				<tr>
					<td></td>				
					<?php 
					for($i=0;$i<$cantidad_retenes;$i++){
						?>
						<td><?php echo $lista_retenes[$i]['reten_nombre']?></td>
						<?php
					}				
					?>				
				</tr>
				<?php
				for($i=0;$i<count($lista_recaudadores);$i++){
				?>
					<tr>
						<td>
						<?php 
						#####list($id_rotacion, $id_reten, $id_recaudador, $plan) = explode("|", $_REQUEST['rotacion_reten_recaudador_plan_'.$i]);
						echo ($i+1).". ".$lista_recaudadores[$i]['recaudador_nombres']." ".$lista_recaudadores[$i]['recaudador_apellidos']
						?>						
						</td>
						<?php
						for($j=0;$j<$cantidad_retenes;$j++){
							?>
							<td style="white-space: nowrap;">

								<select name="plan_<?php echo $i."_".$j?>">
									<option value="">Plan...</option>
								<?php
								for($k=0;$k<count($this->planes);$k++){
									?>
										<option value="<?php echo $this->planes[$k]?>"><?php echo $this->planes[$k]; ?></option>
									<?php
								}
								?>
								</select>
								<!--select>							
								<?php
								for($k=0;$k<$cantidad_retenes;$k++){
									if($j!=$k){
									?>
										<option><?php echo $lista_retenes[$k]['reten_nombre']?></option>
									<?php
									}
								}
								?>
								</select-->
							</td>
							<?php
						}
						?>
					</tr>
				<?php
				}?>

			</table>
			<?php

			$view_data['str_part_view']= $str_part_view = ob_get_clean();		
			$this->load->view('iniciar_rotacion', $view_data);

		}


	}






	##########################################################
	public function guardar_rotacion()
	{
		$view_data["maximo_rotacion_numero"] = $maximo_rotacion_numero = $this->model_rotaciones->get_maximo_rotacion_numero();

		if($maximo_rotacion_numero==0){
			redirect("rotaciones/iniciar_rotacion");
		}

		


		$view_data['lista_rotaciones'] = $lista_rotaciones = $this->model_rotaciones->get_lista_rotaciones();

		$rotacion_numero_seleccionado = NULL;
		if(isset($_REQUEST['fecha_del_al_rotacion_numero'])){
			list($fecha_del, $fecha_al, $rotacion_numero_seleccionado) = explode("|", $_REQUEST['fecha_del_al_rotacion_numero']);	
		}
		else{			
			$rotacion_numero_seleccionado = $lista_rotaciones[0]['rotacion_numero']+1;
		}

		$view_data['rotacion_numero_seleccionado'] = $rotacion_numero_seleccionado;


		if(isset($_REQUEST['guardar_rotacion'])){

			$get_rotacion_numero = $this->model_rotaciones->guardar_rotacion(array("rotacion_fecha_del"=>$fecha_del, "rotacion_fecha_al"=>$fecha_al) );
			$maximo_recaudadores = $_REQUEST['maximo_recaudadores'];

			for($i=1;$i<=$maximo_recaudadores;$i++){

				if(isset($_REQUEST['rotacion_reten_recaudador_plan_'.$i])){

					
					list($rotacion_numero, $id_reten, $id_recaudador, $plan) = explode("|", $_REQUEST['rotacion_reten_recaudador_plan_'.$i]);

					$data['rotacion_numero'] = $get_rotacion_numero;

					$data['reten_id'] = $id_reten;
					$data['recaudador_id'] = $id_recaudador;
					$data['rotacion_recaudador_plan'] = $plan;

					$this->model_rotaciones->agregar_rotacion_recaudadores($data);
				}
			}
		}
	



		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	
		#################################################################	


		$view_data["lista_retenes"] = $lista_retenes = $this->model_rotaciones->get_lista_retenes();

		//echo "ROTACIONES = ".count($lista_rotaciones);
		

		ob_start();
		?>
		<table border="1">
		<tr>
			<th># Rotacion / Plan</th>
			
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

		

		

		//############for($i=0;$i<count($lista_rotaciones);$i++){
			//for($p=count($this->planes)-1; $p>=0;$p--){
			for($p=0; $p<count($this->planes); $p++){
				?>
				<tr>
					<!-- <td><?php echo $lista_rotaciones[$i]['rotacion_numero'] ?></td> -->
					<td><?php echo $this->planes[$p]?></td>

					<?php
					for($j=0;$j<count($lista_retenes);$j++){
						?>
						<td>
							<?php
								//$lista_rotaciones_recaudadores[$i][$lista_retenes[$i]['reten_nombre']] = $this->model_rotaciones->get_lista_recaudadores($lista_rotaciones[$i]['id_rotacion'], $lista_retenes[$j]['id_reten']);
							$lista_recaudadores = $this->model_rotaciones->get_lista_recaudadores_designados($rotacion_numero_seleccionado, $lista_retenes[$j]['id_reten'], $this->planes[($p+count($this->planes)-1)%count($this->planes)]);
							
							echo "<br>RECAUDADORES=".count($lista_recaudadores);

							?>
							<table border="1">
							<?php
							for($k=0;$k<count($lista_recaudadores);$k++){
								$maximo_recaudadores++;
								?>
								<tr>
									<td style="white-space: nowrap;">
										<input type="checkbox" name="rotacion_reten_recaudador_plan_<?php echo $maximo_recaudadores?>" 
										value="
										<?php echo $rotacion_numero_seleccionado.'|'.$lista_retenes[$j]['id_reten'].'|'.$lista_recaudadores[$k]['id_recaudador'].'|'.$this->planes[$p];?>"

										<?php if($p!=0){ echo "checked='checked'"; }?>
										/>
										<?php echo $lista_recaudadores[$k]["recaudador_nombres"]." ".$lista_recaudadores[$k]["recaudador_apellidos"]?>
										<select>
											<option>Cambiar a ...</option>
											<?php
											for($l=0;$l<count($lista_retenes); $l++){

												if(strcasecmp($j, $l)!=0){													
													?>
													<option>
													<?php
														echo $lista_retenes[$l]["reten_nombre"];
													?>
													</option>
													<?php												
												}
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
		//###########3}
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


		//$this->load->view('header');
		$this->load->view('guardar_rotacion', $view_data);		
		//$this->load->view('footer');
	}
	


	#####################################################
	public function index(){
		$view_data["lista_retenes"] = $this->model_rotaciones->get_lista_retenes();
		$view_data["lista_recaudadores"] = $this->model_rotaciones->get_lista_recaudadores();
		$view_data["maximo_rotacion_numero"] = $this->model_rotaciones->get_maximo_rotacion_numero();

		$this->load->view('index.php', $view_data);
	}













	
}