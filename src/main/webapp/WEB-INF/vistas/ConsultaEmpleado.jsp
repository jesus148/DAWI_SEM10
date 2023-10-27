<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Ejemplos de CIBERTEC - Jorge Jacinto</title>
</head></head>

<body>

  <!-- 
  <div class="container">
  
  
  
  
  
  
  
  
   <h3>CONSULTA EMPLEADO</h3>
   
   <div class="row">
   <div class="col-md-6">
      <div class="control-label" for="id_nombres">NOMBRES Y APELLIDOS </div>
      <input class="form-control" id="id_nombres" name="nombres"
					placeholder="Ingrese el nombre" type="text" maxlength="20" />
   </div>
      <div class="col-md-6">
      <div class="control-label" for="id_estado"> ESTADO </div>
      <input type="checkbox" class="form-check-input" id="check1" name="option1" value="something" checked>  <strong> ESTADO</strong>
   </div>
   </div>
   
   	
   
   
   
   
   
      <div class="row">
   <div class="col-md-6">
     <label class="col-lg-6 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>

	<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha" type="date" />
   </div>
      <div class="col-md-6">
      <label class="col-lg-6 control-label" for="id_reg_pais">País</label>
	
		 recordar q cuando es modal se pone asi los name de los combos
		 <select id="id_reg_pais" name="pais" class='form-control'>
	<option value=" ">[Seleccione]</option>    
    </select>
   
   </div>
   </div>
   
   
   
   
   
      <div class="row">
      <div class="col-lg-9 col-lg-offset-3">
		<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
	    </div>

   </div>
   
	  
   
   
  
  </div> -->









<div class="container">
	<h3>Consulta de Empleado</h3>
	<div class="row" style="margin-top: 4%">  
		<div class="col-md-6" >
			<label class="control-label" for="id_nombres">Nombres y Apellidos</label>
			<input class="form-control" id="id_nombres" name="nombres" type="text" maxlength="20"/>
		</div>	
		<div class="col-md-6" >
			<label class="control-label" for="id_estado"></label>
			 <input type="checkbox" class="form-check-input" id="id_estado" name="estado" value="1" checked>  <strong> ESTADO</strong> 
		</div>	  
	</div>
	<div class="row" style="margin-top: 1%">
		<div class="col-md-6" >
			<label class="control-label" for="id_fecha">Fecha Nacimiento</label>
			<input class="form-control" id="id_fecha" name="fechaNacimiento" type="date"/>
		</div>	
		<div class="col-md-6" >
			<label class="control-label" for="id_pais">País</label>
			<select id="id_pais" name="pais" class='form-control'>
		           <option value=" ">[Seleccione]</option>    
			</select>
		</div>
	</div>
	<div class="row" style="margin-top: 4%">  
		<div class="col-md-12" align="center">
			<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
		</div>	
	</div>
	
	
    <div class="row" style="margin-top: 4%"> 
    		<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >ID</th>
												<th style="width: 22%">Nombre</th>
												<th style="width: 23%">Apellidos</th>
												<th style="width: 15%">Fecha Nacimiento</th>
												<th style="width: 15%">País</th>
												<th style="width: 15%">Estado</th>
								
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>	
						</div>
    
    
     

	</div>
	
	
	
</div>











<script type="text/javascript">


$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		
	});
});








$("#id_btn_filtra").click(function(){
	var esActivo=$("#id_estado").is(":checked");
	
	var valEstado=esActivo ? '1' : 	'0';
	console.log(">>>>>es activo>>>>>>>>>" + valEstado );
	
	
	$.getJSON("consultaEmpleado",{"valEstado":valEstado}, function (lista){
		agregarGrilla(lista);
	});
});







function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idEmpleado"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "fechaNacimiento"},
				{data: "pais.nombre"},
				{data: function(row, type, val, meta){
					var salida=(row.estado == 1)? 	'Activo':'Inactivo';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}





</script>


</body>



</html>