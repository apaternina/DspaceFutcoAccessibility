/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*Fecha : 2041114
 *Autor : Antonio Jose Paternina  
 *Descripción : Muestra los mensajes de alertas las paginas de dspace
 *              Nota :Se quita este elemento porque los lectores de pantalla leen lo que esta dentro de la etiqueta noscript  
 */
function quitarNoScript(){
    try {
        $(function(){
            $("#li_popupAyuda a").attr('tabindex','');    
            $("#li_popupAyuda noscript").html('');
	});
    } catch (e) {
     //   alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
}

function mostraAlerta(){
        try {
         $(function(){
           if($('.alertMensaje').html()!=undefined){
                alert($('.alertMensaje').html());        
           }
	});
    } catch (e) {
        //alert('¡Ha ocurrido un error en la función quitarNoScript '+e.message);
    }
   
}




