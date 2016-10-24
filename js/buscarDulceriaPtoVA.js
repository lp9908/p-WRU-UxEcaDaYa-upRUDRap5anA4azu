var tablaDulcePtoVA = document.getElementById("resultadoBusquedaDulceriaPtoVA");
var id,datosDulce;
document.getElementById("campoEntradaDulceriaPtoVA").addEventListener("keyup", ejecutaConsultaDulceriaPtoVA);



function muestraDulcePtoVA (){
  var http_request = false;
  var valor = 10;
    if(window.XMLHttpRequest){
      http_request = new XMLHttpRequest();
    }
    else{
      if(window.ActiveOXbject){
        http_request = new ActiveXObjective("Microsoft.XMLHTTP");
      }
    }

    //se define la funcion que procesara la información que sé recibe del servidor
    http_request.onreadystatechange = function(){
      //se checa el estado de la petición
      if((http_request.readyState == 4)&&(http_request.status == 200)){
        tablaDulcePtoVA.innerHTML = "";
        tablaDulcePtoVA.innerHTML = http_request.responseText;
      }
    }

    http_request.open("POST","php/buscarDulcePtoVA.php",true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("valorDulcePtoVA="+valor+"&campoDulcePtoVA=");
}

function ejecutaConsultaDulceriaPtoVA(){
    var comodin = document.getElementById("campoEntradaDulceriaPtoVA").value;

    //se obtienen los valores de entrada para la busqueda
    var parametros = "";
    parametros += "&campoDulcePtoVA=" + document.getElementById("campoEntradaDulceriaPtoVA").value;
    parametros += "&valorDulcePtoVA=0";
    var http_request = false;
    if(window.XMLHttpRequest){
      http_request = new XMLHttpRequest();
    }
    else{
      if(window.ActiveOXbject){
        http_request = new ActiveXObjective("Microsoft.XMLHTTP");
      }
    }

    if(document.getElementById("campoEntradaDulceriaPtoVA").value == ""){
      tablaDulcePtoVA.innerHTML = "";
      muestraDulcePtoVA();
    }
    else{
      //se define la funcion que procesara la información que sé recibe del servidor
      http_request.onreadystatechange = function(){
        //se checa el estado de la petición
        if((http_request.readyState == 4)&&(http_request.status == 200)){
          tablaDulcePtoVA.innerHTML = "";
          tablaDulcePtoVA.innerHTML = http_request.responseText;
        }
      }

      http_request.open("POST","php/buscarDulcePtoVA.php",true);
      http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      http_request.send(parametros);
    }

}


function agregaDulceIDPtoVA ( id ){
  var i = 0;
    //se asignada a cada boton de eliminar una función cada que se haga click en el
    //este crea el objeto para ajax el envío del idEmpleado y lo actualiza
    //cuando recibe la repsuta se vuelven a mostrar el emeplado actualizado

      //se envia el valro para elminar al empleado
      var http_request = false;
      if(window.XMLHttpRequest){
        http_request = new XMLHttpRequest();
      }
      else{
        if(window.ActiveOXbject){
          http_request = new ActiveXObjective("Microsoft.XMLHTTP");
        }
      }

      //se prepara la funcion para la respuesta
      http_request.onreadystatechange = function (){
        if((http_request.readyState == 4) && (http_request.status == 200)){
          //  datosPaq=http_request.responseText;
          datosDulce=http_request.responseText;
          var posicion = datosDulce.lastIndexOf('%');
          var nom=datosDulce.substring(posicion, 0);
          var prec=datosDulce.substring(posicion+1);
          var tr, td;
          tr = tablaVentaPaq.insertRow(tablaVentaPaq.rows.length);
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = id;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = nom;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = prec;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = "<input type='number' name=Dlc"+id+" id=Dlc"+id+" min='1' max='20' step='1' value='1' onkeyup='total()' onclick='total()'>";
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = "<button  class='btn btn-default' type='button' onclick='deleteRow(this)'>Borrar</button>";
          td = tr.insertCell(tr.cells.length);
          total();
        }
      }

      http_request.open("POST", "php/buscarDulcePtoVAgregar.php", true);
      http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.send("IDDulcePtoVA="+id);

}
