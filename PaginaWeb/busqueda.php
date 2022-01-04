<?php
//Conexion a la base de datos
$conexion=mysql_connect("localhost","root","contraseña");
mysql_select_db("mydb",$conexion);
?>
<?php
////Obteniendo registros de la base de datos a traves de una consulta SQL
$consulta="SELECT TipoPedido, Origen, Destino  FROM Pedido";
$resultado=mysql_query($consulta,$conexion);
try{
while($rows=mysql_fetch_array($resultado)){
echo "TipoPedido: ".$rows[1]." "<br>;
echo "Origen"."$rows[1]."<br>";
echo "Destino"."$rows[2]."";
}
}
catch{
	alert("Error en los datos reviselos cuidadosamente,ciego de mierda");
}
?> 