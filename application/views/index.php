<style>
.dislocate_table{
	border-style: outset;
	border-width: 1px;
}
</style>
<head>
	<title>Disloques Vias Bolivia Cbba</title>
</head>

<h1>DISLOQUES</h1>
<h1>Asignacion de Recaudadores a Retenes Vias Bolivia Cbba</h1>

<table border="1">
	<tr>
		<th colspan="5"><?php echo $maximo_disloque_numero+1; ?></th>		
	<tr>
		<th>#</th>
		<th>Retenes</th>
		<th>Recaudadores</th>
		<th>Del</th>
		<th>Al</th>
	</tr>
	<?php
	$j=0;
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
					for(;$j<count($lista_recaudadores); $j++){
					?>
						<tr>
							<td><?php echo $lista_recaudadores[$j]["recaudador_nombres"]." ".$lista_recaudadores[$j]["recaudador_apellidos"]?></td>
						</tr>
						<?php
						$k++;
						if($k==$lista_retenes[$i]["reten_recaudadores_requeridos"]){
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