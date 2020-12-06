function EnableDisable(fname) {
        //Reference the Button.
        var btnSubmit = document.getElementById("btnSubmit");
 
        //Verify the TextBox value.
        if (fname.value.trim() != "") {
            //Enable the TextBox when TextBox has value.
            btnSubmit.disabled = false;
        } else {
            //Disable the TextBox when TextBox is empty.
            btnSubmit.disabled = true;
        }
};
 function validateForm()
{
     
  var x = document.forms["newad"]["name"];
  var y=document.forms["newad"]["no"];
   var z=document.forms["newad"]["sector"];
   var e=document.forms["newad"]["ep"];
   var c=document.forms["newad"]["cvv"];
  if (x.value == "") {
    window.alert("Name field is mandatory"); // confirm // prompt
    x.focus();
    return false;
  }
  
  if (y.value == "" ) {
    window.alert("card number field is mandatory"); // confirm // prompt
    y.focus();
    return false;
  }
  if (z.value == "" ) {
    window.alert(" mandatory feild"); // confirm // prompt
    z.focus();
    return false;
  }
  if (sector.value == "" ) {
    window.alert(" mandatory feild"); // confirm // prompt
    sector.focus();
    return false;
  }
  if (ep.value == "" ) {
    window.alert(" mandatory feild"); // confirm // prompt
    ep.focus();
    return false;
  }
  if (cvv.value == "" ) {
    window.alert(" mandatory feild"); // confirm // prompt
    z.focus();
    return false;
  }
   alert("Thanks For Donating"); 
}




