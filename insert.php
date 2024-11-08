<?php
require_once "cn.php";

$data = file_get_contents("php://input");

$a_data = json_decode($data, true);

$stmt = $conn->prepare("INSERT INTO producto (codigo, nombre, bodega, sucursal, moneda, precio, material, descripcion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssssss", $a_data['codigo'], $a_data['nombre'], $a_data['bodega'], $a_data['sucursal'], $a_data['moneda'], $a_data['precio'], $a_data['material'], $a_data['descripcion']);

if ($stmt->execute()) {
    echo "1";
} else {
    echo "0";
}

$stmt->close();
$conn->close();

?>