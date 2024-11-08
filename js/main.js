var btn = document.getElementById('btnSave');
var tcodigo = document.getElementById('codigo');
var tnombre = document.getElementById('nombre');
var tbodega = document.getElementById('bodega');
var tsucursal = document.getElementById('sucursal');
var tmoneda = document.getElementById('moneda');
var tprecio = document.getElementById('precio');
var tmaterial = document.getElementsByClassName('material');
var tdescripcion = document.getElementById('descripcion');
var validate = true;


window.onload = (event) => {
	const url = 'select.php?type=1';
	fetchDataSelect(url, handleDataSelect);

	tsucursal.disabled = true;
};

async function fetchDataCodigo(url) {
	try {
		const response = await fetch(url);

		if (!response.ok) {
			throw new Error(`Error: ${response.status}`);
		}

		const data = await response.json();

		return data;

	} catch (error) {
		console.error("Error al obtener los datos:", error);
	}
}

function fetchDataSelect(url, callback) {
	fetch(url)
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok ' + response.statusText);
			}
			return response.json();
		})
		.then(data => {
			callback(data);
		})
		.catch(error => {
			console.error('There was a problem with the fetch operation:', error);
		});
}

function handleDataSelect(data) {
	
	let bodegas = data[0]["bodegas"];
	let monedas = data[0]["monedas"];
	let sucursales = data[0]["sucursales"];

	for (var i = 0; i < bodegas.length; i++) {
		const newOption = document.createElement("option");

		newOption.value = bodegas[i]['nombre'];
		newOption.textContent = bodegas[i]['nombre'];
		tbodega.appendChild(newOption);
	}

	for (var i = 0; i < monedas.length; i++) {
		const newOption = document.createElement("option");

		newOption.value = monedas[i]['nombre'];
		newOption.textContent = monedas[i]['nombre'];
		tmoneda.appendChild(newOption);
	}

	for (var i = 0; i < sucursales.length; i++) {
		const newOption = document.createElement("option");

		newOption.value = sucursales[i]['nombre'];
		newOption.textContent = sucursales[i]['nombre'];
		tsucursal.appendChild(newOption);
	}
}

tbodega.addEventListener("change", function() {
	var selectedValue = tbodega.value;

	if(selectedValue!="") {
		tsucursal.disabled = false;
	} else if (selectedValue == "") {
		tsucursal.disabled = true;
		tsucursal.value = "";
	}
	
});

btn.onclick = async (event) => {
	
	const url = 'select.php?type=2&codigo=' + tcodigo.value;
	const datos = await fetchDataCodigo(url);
	const validate = await validations();

	if (datos == 1) {
		alert("El código del producto ya está registrado.");
	}

	if (datos == 0 && validate == true) {
		var selected = new Array();

		for (var i = 0; i < tmaterial.length; i++) {
			if (tmaterial[i].checked) {
				selected.push(tmaterial[i].value);
			}
		}

		try {
			const response = await fetch("insert.php", {
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					codigo: tcodigo.value,
					nombre: tnombre.value,
					bodega: tbodega.value,
					sucursal: tsucursal.value,
					moneda: tmoneda.value,
					precio: tprecio.value,
					material: selected.join(","),
					descripcion: tdescripcion.value
				})
			});

			const jsonResponse = await response.json();

			if (response.ok) {
				alert("Se ingreso correctamente el registro");
				console.log("Datos enviados correctamente: " + JSON.stringify(jsonResponse));
			} else {
				console.log("Error: " + jsonResponse.message);
			}
		} catch (error) {
			console.log("Error de conexión: " + error.message);
		}
		
	}
}

function sizeString(min, max, cadena) {
	let regex = new RegExp(`^.{${min},${max}}$`);
	return regex.test(cadena);
}

function letterNumber(cadena) {
	let regex = /^(?=.*[a-zA-Z])(?=.*\d).+$/;
	return regex.test(cadena);
}

function validePrice(cadena) {
	let regex = /^\d+(\.\d{1,2})?$/;
	return regex.test(cadena);
}

function countChecked() {
	var x = 0;
	for (var i = 0; i < tmaterial.length; i++) {
		if (tmaterial[i].checked) {
			x++;
		}
	}
	return x;
}

function validations() {
	if (tcodigo.value === "") {
		alert("El código del producto no puede estar en blanco.");
		validate = false;
	}

	if(!letterNumber(tcodigo.value)){
		alert("El código del producto debe estar compuesta con letras y números.");
		validate = false;
	}

	if(!sizeString(5, 15, tcodigo.value)){
		alert("El código del producto debe tener entre 5 y 15 caracteres.");
		validate = false;
	}

	if (tnombre.value === "") {
		alert("El nombre del producto no puede estar en blanco.");
		validate = false;
	}
	
	if(!sizeString(2, 50, tnombre.value)){
		alert("El nombre del producto debe tener entre 2 y 50 caracteres.");
		validate = false;
	}

	if (tprecio.value === "") {
		alert("El precio del producto no puede estar en blanco.");
		validate = false;
	}

	if(!validePrice(tprecio.value)){
		alert("El precio del producto debe ser un número positivo con hasta dos decimales.");
		validate = false;
	}

	if(countChecked()<2) {
		alert("Debe seleccionar al menos dos materiales para el producto.");
		validate = false;
	}

	if (tbodega.value === "") {
		alert("Debe seleccionar una bodega.");
		validate = false;
	}

	if (tsucursal.value === "") {
		alert("Debe seleccionar una sucursal para la bodega seleccionada.");
		validate = false;
	}

	if (tmoneda.value === "") {
		alert("Debe seleccionar una moneda para el producto.");
		validate = false;
	}

	if (tdescripcion.value === "") {
		alert("Debe seleccionar una moneda para el producto.");
		validate = false;
	}

	if (!sizeString(10, 100, tdescripcion.value)){
		alert("La descripción del producto debe tener entre 10 y 100 caracteres.");
		validate = false;
	}

	return validate;
}