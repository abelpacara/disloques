<style>
.dislocate_table{
	border-style: outset;
	border-width: 1px;
}
</style>
<head>
	<title>Disloques Vias Bolivia Cbba</title>
</head>

<?php
echo form_open_multipart("disloques/guardar_disloque");
?>
<!-- <h1>DISLOQUES</h1>
<h1>Asignacion de Recaudadores a Retenes Vias Bolivia Cbba</h1> -->
<?php
$index_recaudadores=0;
$disloques_counter = 0;
$disloques_limit = 2;

while($disloques_counter<$disloques_limit){
	$disloques_counter++;
	?>
	<table border="1">
		<tr>
			<th colspan="5"><?php echo $maximo_disloque_numero+$disloques_counter; ?></th>
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
						for(;$index_recaudadores<count($lista_recaudadores); $index_recaudadores++){
						?>
							<tr>
								<td>
									<?php echo $index_recaudadores." ".$lista_recaudadores[$index_recaudadores]["recaudador_nombres"]." ".$lista_recaudadores[$index_recaudadores]["recaudador_apellidos"]?>
									<input type="hidden" name="reten_id_<?php echo $index_recaudadores?>" value="<?php echo $lista_retenes[$i]['id_reten']?>"/>
									<input type="hidden" name="recaudador_id_<?php echo $index_recaudadores?>" value="<?php echo $lista_recaudadores[$index_recaudadores]['id_recaudador']?>"/>
								</td>
							</tr>
							<?php
							$k++;
							if($k==$lista_retenes[$i]["reten_recaudadores_requeridos"]){

								$index_recaudadores++;
								break;
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
	<br/>
<?php
}

echo "<br>INDEX_RECAUDADOR=".$index_recaudadores;

?>

<input type="hidden" name="cantidad_recaudadores_asignados" value="<?php echo $index_recaudadores?>"/>

<input name="guardar_disloque" type="submit" value="Guardar Disloque"/>

<?php
echo form_close();
?>