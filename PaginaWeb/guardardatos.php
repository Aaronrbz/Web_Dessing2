<?php 

include ("conexion.php");


$Username= $_POST["Username"];
$Contrasenia= $_POST["Contrasenia"];
$Tipo= $_POST["Tipo"]



$insertar = "INSERT INTO usuarios(Username,Contrasenia,Tipo) VALUES ('$Username', '$Contrasenia', '$Tipo')";

$resultado = mysqli_query($conexion, $insertar);


if($resultado){
alert"<script>
alert('se ha registrado el usuario con exito'); window.location='index.html'</script>";
}
else{
alert"<script>alert('ha ocurrido un error'); </script>";
}

?>
