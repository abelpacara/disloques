<style>
body table *{
	font-size: 10px;
}
.dislocate_table{
	border-style: outset;
	border-width: 1px;
}
.table_container{
	float: left;
}

</style>
<head>
	<title>Rotaciones Vias Bolivia Cbba</title>
</head>

<?php
$index_recaudadores_asign = 0;

?>


<div class="table_container">
<?php
echo form_open_multipart("rotaciones/guardar_rotacion");
?>
<!-- <h1>rotaciones</h1>
<h1>Asignacion de Recaudadores a Retenes Vias Bolivia Cbba</h1> -->
<?php
$index_recaudadores=0;
$rotaciones_counter = 0;

echo $str_part_view;

	?>
	<br/>
	<input type="submit" value="Guardar Rotacion" name="guardar_rotacion"/>

<?php
echo form_close();
?>
<br/>
</div>
