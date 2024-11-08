<?php

include "./cn.php";

if ($_GET['type'] == 1) {
	$bodega = [];
	$sqlBodega = "SELECT * FROM bodega";
	$result = $conn->query($sqlBodega);

	if ($result->num_rows > 0) {
	  while($row = $result->fetch_assoc()) {
		$bodega[] = $row;
	  }
	} else {
	  echo "0 results";
	}

	$moneda = [];
	$sqlMoneda = "SELECT * FROM moneda";
	$result = $conn->query($sqlMoneda);

	if ($result->num_rows > 0) {
	  while($row = $result->fetch_assoc()) {
		$moneda[] = $row;
	  }
	} else {
	  echo "0 results";
	}

	$sucursal = [];
	$sqlSucursal = "SELECT * FROM sucursal";
	$result = $conn->query($sqlSucursal);

	if ($result->num_rows > 0) {
	  while($row = $result->fetch_assoc()) {
		$sucursal[] = $row;
	  }
	} else {
	  echo "0 results";
	}

	echo '[{"bodegas":' .json_encode($bodega). ', "monedas":' .json_encode($moneda). ', "sucursales":' .json_encode($sucursal).'}]';

} else if ($_GET['type'] == 2) {
	$return = [];
	$sqlSucursal = "SELECT * FROM producto where codigo='" . $_GET['codigo'] . "';";
	$result = $conn->query($sqlSucursal);

	if ($result->num_rows > 0) {
	  echo "1";
	} else {
	  echo "0";
	}
}


$conn->close();


?>