
<head>
<tible>Iniciar rotacion</tible>
</head>

<div class="table_container">
<?php
echo form_open_multipart("rotaciones/iniciar_rotacion");
?>
<!-- <h1>rotaciones</h1>
<h1>Asignacion de Recaudadores a Retenes Vias Bolivia Cbba</h1> -->

<table>
	<tr>
		<td>
			Del
		</td>
		<td>
			<input type="text" name="fecha_del" value="2016-07-01"/>			
		</td>
		<td>
			Al
		</td>
		<td>
			<input type="text" name="fecha_al" value="2016-07-20"/>			
		</td>
	</tr>	
</table>

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
