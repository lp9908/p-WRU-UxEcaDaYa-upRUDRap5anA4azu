var tablaProductoDBAPaq = document.getElementById("resultadoBusquedaProductoDBAPaq");
var tablaDBAPaq = document.getElementById("tablaDBAPaq");
//document.getElementById("CancelarVentaABtn").addEventListener("click",  cancelarVA);
//document.getElementById("ConfirmarVentaABtn").addEventListener("click", confirmarVA);

//document.getElementById("ConfirmarVentaABtn").addEventListener("click", Hacer);
var idP,datosProd, totalF;
document.getElementById("campoEntradaProductoDBAPaq").addEventListener("keyup", ejecutaConsultaProductoDBAPaq);

function muestraProductoDBAPaq (){
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
        tablaProductoDBAPaq.innerHTML = "";
        tablaProductoDBAPaq.innerHTML = http_request.responseText;
      }
    }

    http_request.open("POST","php/buscarProductoDBAPaq.php",true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("valorProdDBAPaq="+valor+"&campoProdDBAPaq=");
}

function ejecutaConsultaProductoDBAPaq(){
    var comodin = document.getElementById("campoEntradaProductoDBAPaq").value;

    //se obtienen los valores de entrada para la busqueda
    var parametros = "";
    parametros += "&campoProdDBAPaq=" + document.getElementById("campoEntradaProductoDBAPaq").value;
    parametros += "&valorProdDBAPaq=0";
    var http_request = false;
    if(window.XMLHttpRequest){
      http_request = new XMLHttpRequest();
    }
    else{
      if(window.ActiveOXbject){
        http_request = new ActiveXObjective("Microsoft.XMLHTTP");
      }
    }

    if(document.getElementById("campoEntradaProductoDBAPaq").value == ""){
      tablaProductoDBAPaq.innerHTML = "";
      muestraProductoDBAPaq();
    }
    else{
      //se define la funcion que procesara la información que sé recibe del servidor
      http_request.onreadystatechange = function(){
        //se checa el estado de la petición
        if((http_request.readyState == 4)&&(http_request.status == 200)){
          tablaProductoDBAPaq.innerHTML = "";
          tablaProductoDBAPaq.innerHTML = http_request.responseText;
        }
      }

      http_request.open("POST","php/buscarProductoDBAPaq.php",true);
      http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      http_request.send(parametros);
    }

}

function agregaProductoIDDBAPaqA ( idP ){
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
          nomProd=http_request.responseText;
          var tr, td;
          tr = tablaDBAPaq.insertRow(tablaDBAPaq.rows.length);
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = idP;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = nomProd;
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = "<input type='number' name=Pro"+idP+" id=Pro"+idP+" min='1' max='20' step='1' value='1' onclick='total()'>";
          td = tr.insertCell(tr.cells.length);
          td.innerHTML = "<button  class='btn btn-default' type='button' onclick='deleteRow(this)'>Borrar</button>";
          td = tr.insertCell(tr.cells.length);
        }
      }

      http_request.open("POST", "php/buscarProductoDBAPaqAgr.php", true);
      http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.send("IDProdDBAPaq="+idP);
}


function deleteRow(r){
  var j = r.parentNode.parentNode.rowIndex;
      document.getElementById("tablaDBAPaq").deleteRow(j);

      var tam=tablaVenta.rows.length;

  }


/*function cancelarVA(){
  tablaVenta.innerHTML = "<thead><tr><th>ID</th><th>Elemento</th><th>Precio</th><th>Cantidad</th><th>Eliminar</th></tr></thead><tbody></tbody>";
  }
*/

function confirmarAgregar() {
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
     }
     else{
       tipoF="paquete"
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
window.alert("CONFIRMA LA VENTA --- $"+ totalF);
//window.alert("Elemento 1: "+ verElem(listaProductos[0]));
// window.alert(listaProductos);

//alert("Entra a HACER")
//alert(listaProductos.toString())
var productosJSON = JSON.stringify(listaProductos);
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
  if(http_request.responseText=="Existencias modificadas"){
    cancelarVA();
  }
  window.alert(http_request.responseText);


}
}
http_request.open("POST", "php/servidor.php", true);
http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http_request.send("productos="+productosJSON);
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
