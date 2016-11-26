
<?php
$index_recaudadores_asign = 0;

?>


<div class="table_container">
<?php
echo form_open_multipart("rotaciones/guardar_rotacion");
?>
<!-- <h1>rotaciones</h1>
<h1>Asignacion de Recaudadores a Retenes Vias Bolivia Cbba</h1> -->


<select name="fecha_del_al_rotacion_numero" ONCHANGE="location = '<?php echo current_url(); ?>?fecha_del_al_rotacion_numero='+ this.options[this.selectedIndex].value;">

	<?php
	$fecha_del = date ("Y-m-d", strtotime($lista_rotaciones[0]['rotacion_fecha_al']." + 1 day") );

	$fecha_al = date ("Y-m-d", strtotime($fecha_del." + 10 day") );
	?>

	<option value="<?php echo $fecha_del.'|'.$fecha_al.'|'.($lista_rotaciones[0]['rotacion_numero']+1) ?>"

	<?php
	if(strcasecmp($rotacion_numero_seleccionado, ($lista_rotaciones[0]['rotacion_numero']+1) )==0){
		echo " SELECTED ";
	}
	?>

	>(<?php echo $lista_rotaciones[0]['rotacion_numero']+1?>) NUEVA ROTACION <?php echo " del ".$fecha_del."  al  ".$fecha_al?></option>

	<?php
	for($i=0; $i<count($lista_rotaciones); $i++){
		?>
		<option value="<?php echo $lista_rotaciones[$i]['rotacion_fecha_del'].'|'.$lista_rotaciones[$i]['rotacion_fecha_al'].'|'.$lista_rotaciones[$i]['rotacion_numero'] ?>" 
		<?php
		if(strcasecmp($rotacion_numero_seleccionado, $lista_rotaciones[$i]['rotacion_numero'])==0){
			echo " SELECTED ";
		}
		?>
		>

		<?php echo ($lista_rotaciones[$i]['rotacion_numero'])." ROTACIONES ANTERIORES del ".$lista_rotaciones[$i]['rotacion_fecha_del']."  al  ".$lista_rotaciones[$i]['rotacion_fecha_al']?>
			
		</option>
		<?php
	}
	?>

</select>


<?php
echo $str_part_view;
?>
	<br/>
	<input type="submit" value="Guardar Rotacion" name="guardar_rotacion"/>

<?php
echo form_close();
?>
<br/>
</div>
