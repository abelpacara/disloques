<style>
.dislocate_table{
	border-style: outset;
	border-width: 1px;
}
.table_container{
	float: left;
}

</style>
<head>
	<title>Disloques Vias Bolivia Cbba</title>
</head>

<?php
$index_recaudadores_asign = 0;

?>



<div class="table_container">

<?php
echo "<br>RECAUDADORES ASIGNADOS = ".count($lista_recaudadores_asignados);
?>

<table border="1">
		<tr>
			<th colspan="5"><h2>Disloque programado</h2></th>
		</tr>
		<tr>
			<th colspan="5"><?php echo $maximo_disloque_numero; ?></th>
		</tr>
		<tr>
			<th>#</th>
			<th>Retenes</th>
			<th>Recaudadores</th>
			<th>Del</th>
			<th>Al</th>
		</tr>
		<?php
		for($i=0;$i<count($lista_retenes); $i++){
			?>
			<tr>
				<td>
				<?php
				echo ($i+1);
				?>
				</td>
				<td>
				<?php
				echo $lista_retenes[$i]["reten_nombre"];
				?>
				</td>
				<td colspan="3">
					<table border="1">
						<?php
						$k=0;
						for(;$index_recaudadores_asign<count($lista_recaudadores_asignados); $index_recaudadores_asign++){
							if($lista_recaudadores_asignados[$index_recaudadores_asign]['recaudador_ultimo_disloque_numero']<=$maximo_disloque_numero){
								?>
									<tr>
										<td>
											<?php echo $index_recaudadores_asign." ".$lista_recaudadores_asignados[$index_recaudadores_asign]["recaudador_nombres"]." ".$lista_recaudadores_asignados[$index_recaudadores_asign]["recaudador_apellidos"]?>											
										</td>
									</tr>
								<?php
								
								$k++;
								if($k==$lista_retenes[$i]["reten_recaudadores_requeridos"]){

									$index_recaudadores_asign++;
									break;
								}
							}
						}
						?>
					</table>
				</td>
			</tr>
		<?php
	}
	?>
	</table>
</table>
</div>


<div class="table_container">
<?php
echo form_open_multipart("disloques/guardar_disloque");
?>
<!-- <h1>DISLOQUES</h1>
<h1>Asignacion de Recaudadores a Retenes Vias Bolivia Cbba</h1> -->
<?php
$index_recaudadores=0;
$disloques_counter = 0;

	?>
	<table border="1">
		<tr>
			<th colspan="5"><h2>Disloque a programar</h2></th>
		</tr>
		<tr>
			<th colspan="5"><?php echo $maximo_disloque_numero+1; ?>
				<label>Fecha Del</label>
				<input type="text" name="disloque_fecha_del"/>

				<label>Fecha Al</label>
				<input type="text" name="disloque_fecha_al"/>
			</th>
		</tr>
		<tr>
			<th>#</th>
			<th>Retenes</th>
			<th>Recaudadores</th>
			<th>Del</th>
			<th>Al</th>
		</tr>
		<?php
		for($i=0;$i<count($lista_retenes); $i++){
			?>
			<tr>
				<td>
				<?php
				echo ($i+1);
				?>
				</td>
				<td>
				<?php
				echo $lista_retenes[$i]["reten_nombre"];
				?>
				</td>
				<td colspan="3">
					<table border="1">
						<?php
						$k=0;
						for(;$index_recaudadores<count($lista_recaudadores_no_asignados); $index_recaudadores++){
							if($lista_recaudadores_no_asignados[$index_recaudadores]['recaudador_ultimo_disloque_numero']<=$maximo_disloque_numero){
								?>
									<tr>
										<td>
											<?php echo $index_recaudadores." ".$lista_recaudadores_no_asignados[$index_recaudadores]["recaudador_nombres"]." ".$lista_recaudadores_no_asignados[$index_recaudadores]["recaudador_apellidos"]?>
											<input type="hidden" name="reten_id_<?php echo $index_recaudadores?>" value="<?php echo $lista_retenes[$i]['id_reten']?>"/>
											<input type="hidden" name="recaudador_id_<?php echo $index_recaudadores?>" value="<?php echo $lista_recaudadores_no_asignados[$index_recaudadores]['id_recaudador']?>"/>
										</td>
									</tr>
								<?php
								
								$k++;
								if($k==$lista_retenes[$i]["reten_recaudadores_requeridos"]){

									$index_recaudadores++;
									break;
								}
							}
						}
						?>
					</table>
				</td>
			</tr>
		<?php
	}
	?>
	</table>
</table>


<input type="hidden" name="cantidad_recaudadores_asignados" value="<?php echo $index_recaudadores?>"/>
<input name="guardar_disloque" type="submit" value="Guardar Disloque"/>

<?php
echo form_close();
?>
<br/>
</div>


<div class="table_container">

	<table border="1">
		<tr>
			<th colspan="5"><h2>Recaudadores en descanso</h2></th>
		</tr>
		<tr>
			<th>#</th>
			<th>Recaudador</th>
			<th>Estado</th>
		</tr>
		<?php
		$i=0;
		for(;$index_recaudadores<count($lista_recaudadores_no_asignados);$index_recaudadores++){
			$i++;
		?>
			<tr>
				<td><?php echo $i?></td>
				<td><?php echo $lista_recaudadores_no_asignados[$index_recaudadores]['recaudador_nombres']." ".$lista_recaudadores_no_asignados[$i]['recaudador_apellidos']?></td>
				<td><?php echo $lista_recaudadores_no_asignados[$index_recaudadores]['recaudador_ultimo_disloque_numero']?></td>
			</tr>
			<?php
		}
		?>
		<tr>
		</tr>
	</table>
</div>

