var tablaProductoPtoVA = document.getElementById("resultadoBusquedaProductoPtoVA");
var tablaVentaPaq = document.getElementById("tablaVenta");
document.getElementById("CancelarVentaABtn").addEventListener("click",  cancelarVA);
document.getElementById("ConfirmarVentaABtn").addEventListener("click", confirmarVA);

//document.getElementById("ConfirmarVentaABtn").addEventListener("click", Hacer);
var idP,datosProd, totalF, stotal;
stotal=0;
totalF=0;
document.getElementById("campoEntradaProductoPtoVA").addEventListener("keyup", ejecutaConsultaProductoPtoVA);
//$(document).ready(conboletos);


function muestraProductoPtoVA (){
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
        tablaProductoPtoVA.innerHTML = "";
        tablaProductoPtoVA.innerHTML = http_request.responseText;
      }
    }

    http_request.open("POST","php/buscarProductoPtoVA.php",true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("valorProdPtoVA="+valor+"&campoProdPtoVA=");
}

function ejecutaConsultaProductoPtoVA(){
    var comodin = document.getElementById("campoEntradaProductoPtoVA").value;

    //se obtienen los valores de entrada para la busqueda
    var parametros = "";
    parametros += "&campoProdPtoVA=" + document.getElementById("campoEntradaProductoPtoVA").value;
    parametros += "&valorProdPtoVA=0";
    var http_request = false;
    if(window.XMLHttpRequest){
      http_request = new XMLHttpRequest();
    }
    else{
      if(window.ActiveOXbject){
        http_request = new ActiveXObjective("Microsoft.XMLHTTP");
      }
    }

    if(document.getElementById("campoEntradaProductoPtoVA").value == ""){
      tablaProductoPtoVA.innerHTML = "";
      muestraProductoPtoVA();
    }
    else{
      //se define la funcion que procesara la información que sé recibe del servidor
      http_request.onreadystatechange = function(){
        //se checa el estado de la petición
        if((http_request.readyState == 4)&&(http_request.status == 200)){
          tablaProductoPtoVA.innerHTML = "";
          tablaProductoPtoVA.innerHTML = http_request.responseText;
        }
      }

      http_request.open("POST","php/buscarProductoPtoVA.php",true);
      http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      http_request.send(parametros);
    }

}

function agregaProductoIDPtoVA ( idP ){
      var i = 0;
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
          //  datosProd=http_request.responseText;
          datosProd=http_request.responseText;
          var posicion = datosProd.lastIndexOf('%');
          var nom=datosProd.substring(posicion, 0);
          var prec=datosProd.substring(posicion+1);
          var tr, td;
          tr = tablaVentaPaq.insertRow(tablaVentaPaq.rows.length);
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = idP;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = nom;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = prec;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = "<input type='number' name=Pro"+idP+" id=Pro"+idP+" min='1' max='20' step='1' value='1' onkeyup='total()' onclick='total()'>";
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = "<button  class='btn btn-default' type='button' onclick='deleteRow(this)'>Borrar</button>";
          td = tr.insertCell(tr.cells.length);
          total();
        }
      }

      http_request.open("POST", "php/buscarProductoPtoVAgregar.php", true);
      http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.send("IDProdPtoVA="+idP);
}


function deleteRow(r){
  var j = r.parentNode.parentNode.rowIndex;
      document.getElementById("tablaVenta").deleteRow(j);

      var tam=tablaVenta.rows.length;
        if(tam==1 || tam==0){
          document.getElementById('Total').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=red></FONT>";
          document.getElementById('STotal').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=blue></FONT>";
        }
        else{
         total();
        }

  }

function total() {
   totalF=0;
  var tam=tablaVenta.rows.length;
//  alert("TAM:"+tam);
  var tablon, precF, cantF, pos1,pos2, posID, tipo;
  for(var i=1;i<=tam;i++){
      tablon = document.getElementById("tablaVenta").rows[i].cells;
      precF=tablon[2].innerHTML;
      cantF=tablon[3].innerHTML;

//      alert("Precio: "+precF+"  Cantidad:"+cantF);


      pos1 = cantF.search("id");
      pos2 = cantF.search("min");
      posID = cantF.substring(pos1+4,pos2-2);
  //    alert("ID:"+posID);
      var b = document.getElementById(posID);
      cantF=b.value;
      if(cantF==""){
        document.getElementById('Total').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=red></FONT>";
        document.getElementById('STotal').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=blue></FONT>";
      }
      else{
    //  cantF = document.getElementById(posID).value;
    //  alert("Cantidad: "+cantF);
  //    alert("Precio: "+precF+"  Cantidad:"+cantF);
  //    alert("Precio: "+parseFloat(precF)+"  Cantidad:"+parseFloat(cantF));
      totalF=totalF+(parseFloat(precF) * parseFloat(cantF));


    if(Desc!=0){
      stotal= totalF*((100-parseFloat(Desc)) / 100);
      document.getElementById('Total').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=red>"+stotal+"</FONT>";
        document.getElementById('STotal').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=blue>"+totalF+"</FONT>";

    }
    else{
      stotal=totalF;
      document.getElementById('Total').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=red>"+totalF+"</FONT>";
        document.getElementById('STotal').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=blue>"+totalF+"</FONT>";
    }
    }
}
}
function cancelarVA(){
  totalF=0;
  tablaVenta.innerHTML = "<thead><tr><th>ID</th><th>Elemento</th><th>Precio</th><th>Cantidad</th><th>Eliminar</th></tr></thead><tbody></tbody>";
    document.getElementById('Total').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=red></FONT>";
    document.getElementById('STotal').innerHTML = "<FONT FACE='calibri' SIZE=5 COLOR=blue></FONT>";
  }


function confirmarVA() {
	//conboletos();
  var tablon, idF, cantF,tipoF, pos1,pos2, posID;
    var prod;
  var tam=tablaVenta.rows.length;
//  window.alert(tam);
  var listaProductos = [];


  for(var i=1;i<tam;i++){
  tablon = document.getElementById("tablaVenta").rows[i].cells;
  idF=tablon[0].innerHTML;
  cantF=tablon[3].innerHTML;
  // alert("idf:"+idF);
      pos1 = cantF.search("id");
      pos2 = cantF.search("min");
      posID = cantF.substring(pos1+4,pos2-2);
      tipoF=cantF.substring(pos1+4,pos1+7);
  //   alert("Tipo:  "+tipoF + "POSID "+posID);
     if(tipoF=="Pro"){
       tipoF="producto";
	   //alert ("producto");
     }else if(tipoF=="Dlc"){
       tipoF="dulce";
	   //alert ("dulce");
     }else{
       tipoF="paquete";
	   //alert ("paquete");
     }
      var b = document.getElementById(posID);
      cantF=b.value;
    //  alert("Tipo:  "+tipoF + " ID: "+idF + "cantidad: "+cantF );
      prod = new Elemento(idF,cantF,tipoF);
    listaProductos.push(prod);
    //  window.alert( "Veo elemento   " + verElem(prod));
     /* IDS.push(idF);
      windows.alert(IDS.toString());
      IDS.push(cantF);

      IDS.push(tipoF);
      windows.alert("CONFIRMA LA VENTA --- $"+document.getElementById('Total').innerHTML);
    console.log(listaProductos);
    */

  }
//windows.alert("CONFIRMA LA VENTA --- $"+ document.getElementById('Total').innerHTML);
if(stotal==0 && totalF==0){
    window.alert("Realiza primero la venta");
}else{
	window.alert("CONFIRMA LA VENTA --- $"+ stotal);
	crearboleto(totalF);
	//window.alert("Elemento 1: "+ verElem(listaProductos[0]));
	//window.alert(listaProductos);
	//alert("Entra a HACER")
	//alert(listaProductos.toString())
	var productosJSON = JSON.stringify(listaProductos);
	var i = 0;
	var http_request = false;
	if(window.XMLHttpRequest){
		http_request = new XMLHttpRequest();
	}else{
		if(window.ActiveOXbject){
			http_request = new ActiveXObjective("Microsoft.XMLHTTP");
		}
	}
	//se prepara la funcion para la respuesta
	http_request.onreadystatechange = function (){
		if((http_request.readyState == 4) && (http_request.status == 200)){
			window.alert(http_request.responseText);
			muestraProductoPtoVA ();
			mostrarTicket1();
			cancelarVA();
			total();
			//muestraProductoPtoVA ();
		}
	}
	//noTicket = document.getElementById("auxtiketInput").value;
	//alert("" + noTicket);
http_request.open("POST", "php/servidor.php", true);
	http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	http_request.send("productos="+productosJSON);

}

}

// Esta será la estructura que tendrá el objeto
function Elemento(idE, cantidadE, tipoE)
{
    this.idE = idE;
    this.cantE = cantidadE;
    this.tipoE = tipoE;
}

function verElem( e) {
  var resultado = e.idE + " " + e.cantE+" "+ e.tipoE;
  return(resultado);
}

function crearboleto(vtotal){
	//alert("Creando boleto");
	var parametrosTicket = "";
	parametrosTicket += "total="+vtotal;
	parametrosTicket += "&idUsuario="+document.getElementById("campoEntradaClientePtoVA").value;
	parametrosTicket += "&idEmpleado=1";
	//alert(parametrosTicket);
	var http_request = false;
	if(window.XMLHttpRequest){
		http_request = new XMLHttpRequest();
	}
	else{
		if(window.ActiveXObject){
			http_request = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	//se define la función que procesara la información que sé recibe del servidor
	http_request.onreadystatechange = function (){
		//se checael estado de la petición
		if((http_request.readyState == 4) && (http_request.status == 200)){
			window.alert(http_request.responseText);
			//noTicket = http_request.responseText.toString();
			//alert("" + noTicket);
			//auxtiket.innerHTML = "";
			//auxtiket.innerHTML = http_request.responseText;
		}
	}

	http_request.open("POST", "php/crearboleto.php", true);
  	http_request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http_request.send(parametrosTicket);
}

function conboletos(){
	var http_request = false;
	if(window.XMLHttpRequest){
		http_request = new XMLHttpRequest();
	}
	else{
		if(window.ActiveXObject){
			http_request = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	http_request.onreadystatechange = function (){
		if((http_request.readyState == 4) && (http_request.status == 200)){
			auxtiket.innerHTML = "";
			auxtiket.innerHTML = http_request.responseText;
		}
	}
	http_request.open("POST", "php/conboleto.php", true);
  	http_request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http_request.send();
}

var tablaTiket = document.getElementById("resultadoBusquedaTiket");
//funcion de mostrarTicket

function mostrarTicket1(){
	//alert("hola");
	//noTicket = document.getElementById("auxtiketInput").value;
	var http_request = false;
	if(window.XMLHttpRequest){
		http_request = new XMLHttpRequest();
	}
	else{
		if(window.ActiveXObject){
			http_request = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	http_request.onreadystatechange = function(){
      //se checa el estado de la petición
      if((http_request.readyState == 4)&&(http_request.status == 200)){
        tablaTiket.innerHTML = "";
        tablaTiket.innerHTML = http_request.responseText;
      }
    }

	http_request.open("POST", "php/buscaTiket.php", true);
  	http_request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	//http_request.send("noTicket="+noTicket);
	http_request.send();
}