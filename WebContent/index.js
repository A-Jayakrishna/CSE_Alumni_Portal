var cor_u = "ajk";
var cor_pass = "pass";
var alu_u = ["jai","jas","asritha","satya","shaw","koushik"];
var alu_pass = ["jai","jas","asritha","satya","shaw","koushik"];
function logval(){
    logdata = document.forms["logform"];
    if(logdata["user"].value === "cor"){
        if((logdata["loguser"].value==cor_u)&(logdata["logpass"].value==cor_pass)){
            document.getElementById("logform").action = "./faculty_nav.html";
        }
        else{
            alert("wrong credentials");
        }
    }else{
        l = alu_u.length;
        var c = 0
        for(i=0;i<l;i++){
            if((logdata["loguser"].value==alu_u[i])&(logdata["logpass"].value==alu_pass[i])){
                //top.frames['nav'].location.href = './nav-using-frames.html';
                document.getElementById("logform").action = "./nav-using-frames.html";
                //parent.location = new location;
                c=1
            }
        }
        if(c==0){
            alert("wrong credentials");
        }
    }
    
}
function registersel(){
    const typ = confirm("Press ok if you are a Faculty");
    if(typ){
        //location.href='./reg.html';
        location.href='./fac_reg_profile.jsp';
    }
    else{
        //location.href='./register.html'
        location.href='./reg.jsp'
    }
}
var fn = ["adusumalli"]
var ln = ["jayakrishna"]
var r = ["CB.EN.U4CSE17202"]
var dob = ["12-07-1999"]
var pn = [9898989898]
var e = ["j@gmail.com"]
var l = ["link1"]
var wpass = ["hello"]
var wuser = ["ajkc"]
function loadval(){
    var table = document.getElementById("alumnitable");
    var row = table.insertRow(-1);
    var fir = row.insertCell(0);
    var las = row.insertCell(1);
    var reg = row.insertCell(2);
    var dat = row.insertCell(3);
    var phno = row.insertCell(4);
    var email = row.insertCell(5);
    fir.innerHTML = fn;
    las.innerHTML = ln;
    reg.innerHTML = r;
    dat.innerHTML = dob;
    phno.innerHTML = pn;
    email.innerHTML = e;
}
function addalumni(){
    regdata = document.forms["regform"];
    fn.push(regdata["inp_fname"].value);
    ln.push(regdata["inp_lname"].value);
    r.push(regdata["inp_reg"].value);
    wuser.push(regdata["inp_username"].value);
    wpass.push(regdata["inp_pass"].value);
    dob.push(regdata["inp_date"].value);
    pn.push(regdata["inp_num"].value);
    e.push(regdata["inp_email"].value);
    l.push(regdata["inp_link"].value);
    alert("you will be redirected to login page your details will be send for verification by the coordinator");
}