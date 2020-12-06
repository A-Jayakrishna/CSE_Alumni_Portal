function EnableDisable(name) {
        //Reference the Button.
        var btnSubmit = document.getElementById("btnSubmit");
 
        //Verify the TextBox value.
        if (name.value.trim() != "") {
            //Enable the TextBox when TextBox has value.
            btnSubmit.disabled = false;
        } else {
            //Disable the TextBox when TextBox is empty.
            btnSubmit.disabled = true;
        }
};
function msg(){  
 alert("Successfully updated the profile");  
}  
