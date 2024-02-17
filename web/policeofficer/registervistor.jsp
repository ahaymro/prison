
<style>
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #c0c0c0;
  min-width: 210px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: teal;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
</body>
</html>
<script>
    function confirmation()
    {
        var x =confirm("do you want to register prisoner ");
        if (x==true)
        {
            return true;
            
        }
       else
           return false;
    }
</script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../decoration/css/bootstrap.min.css">

        <script src="../decoration/js/jquery.min.js"></script>
        <script src="../decoration/js/bootstrap.min.js"></script>
        <style type="text/css">

body{
	font-family: Times News Roman;
}

ul li a{
	font-size: 25px;


}

 </style>
     
	<title>prisoner managment system</title>
</head>
<body>

	<div class="container" style="background-color: LightSteelBlue; border-radius: 10px; box-shadow: 0px 0px 10px blue;">
	<img src="../logo2.png" style="width: 100%; height: 150px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
	<nav>

	<div class="navbar navbar-inverse" style="margin-top: 7px;">
		
		<ul class="nav navbar-nav" >
			<li><a href="index.jsp">Home</a></li>
<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Inbox message<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
      <li><a href="inbox1.jsp"><span style="color: black; font-size: 20px;">new message</span></a></li>
      <li><a href="inbox.jsp"><span style="color: black; font-size: 20px;">old message</span></a></li>  
    </div>
</ul>
		<li><a href="sendmessage.jsp">send message</a></li>
            <li><a href="registervistor.jsp">register visitor</a></li>    
           <li><a href="updatecafteria.jsp">Edit cafe schedule</a></li>  
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">More<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
                      
                            <li><a href="giveforgive.jsp"><span style="color: black; font-size: 20px;">request</span></a></li>
                            <li><a href="feedback.jsp"><span style="color: black; font-size: 20px;">feedback</span></a></li>
                            <li> <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin-right: 15px;">change password</button></a>
                             </li>
  </div>     
                
</ul>
        </li>
                </ul>                           

</ul>
<ul class="nav navbar-nav navbar-right">
 <li>
                           <!-- login modal form-->
                           <a href="logout.jsp"> <button type="button" class="btn btn-success" style=" margin-top: -5px; width: 80px;">logout</button></a>
                       <!-- Modal -->
                                

                    </li>


                </ul>
	</div>

</nav>
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
    <form action="" method="post">
    <td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to policeofficer page</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" >Register visitor</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;"></td></tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz , also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="../assosa 1.jpg" width="100%"></td> 
            <td style="width: 300px;" class="text-justify" rowspan="3">


              <form action="" method="post" enctype="multipart/form-data">
              <table class="table table-bordered">
                <tr><td>Fname<span style="color: red;">*</span></td><td><input type="text" name="fname" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray; " required=""></td></tr>
                 <tr><td>Mname<span style="color: red;">*</span></td><td><input type="text" name="mname" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
                 <tr><td>Lname<span style="color: red;">*</span></td><td><input type="text" name="lname" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
                  <tr><td>age<span style="color: red;">*</span></td><td><input  name="age" min="18"  step="1"  class="form-control" style="border:1px solid gray;" pattern=\d{2} required=""></td></tr>
                 <tr><td>sex<span style="color: red;">*</span></td><td><select name="sex" class="form-control" style="border:1px solid gray;" required="">
  <option value="male">Male</option>
  <option value="female">FeMale</option>
                 <tr><td>prisonername<span style="color: red;">*</span></td><td><input type="text" name="prisoner" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
                <tr><td>relation<span style="color: red;">*</span></td><td><input type="text" name="relation" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
            
                 
                <tr><td>region<span style="color: red;">*</span></td><td><select name="region" class="form-control" style="border:1px solid gray;" required="">
  <option value="tigray">Tigray</option>
 <option value="amhara">Amhara</option>
  <option value="oromia">Oromia</option>
   <option value="snnr">SNNR</option>
    <option value="harar">Harar</option>
     <option value="bgrs">BGRS</option>
      <option value="somali">somali</option>
       <option value="afar">afar</option>
        <option value="gambela">gambela</option>
</select>
    </td></tr>
                 <tr><td>woreda<span style="color: red;">*</span></td><td><input type="text" name="woreda" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
                 <tr><td>kebele<span style="color: red;">*</span></td><td><input type="text" name="kebele"  class="form-control" style="border:1px solid gray;" required=""></td></tr>
            
                 
              </table>
     <input type="submit" name="register" value="register" class="btn btn-success form-control" onclick="return confirmation ();">
              </form>
              <!--register new user-->
            </td> 
<td style="font-size: 25px; color: red; font-family: agency fb;"> you are login as policeofficer!
<table><tr>
        
 
</tr></table>



</td>
            </tr>
            <tr><td style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >what can i help you?</td>  <td style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;">calender</td></tr>
            <tr>
              
            <td class="text-justify" >
    <!--help-->
   <div style="width: 350px; height: 200px;">
    <script type="text/javascript">
      $(document).ready(function(){
    $("#btnt").click(function(){
        $("#demo").toggle(1000);
        $("#demo1").hide(1000);
         $("#demo2").hide(1000);
          $("#demo3").hide(1000);
    });
});
  $(document).ready(function(){
    $("#btn1").click(function(){
        $("#demo1").toggle(1000);
        $("#demo").hide(1000);
         $("#demo2").hide(1000);
          $("#demo3").hide(1000);
    });
});
  $(document).ready(function(){
    $("#btn2").click(function(){
        $("#demo2").toggle(1000);
        $("#demo").hide(1000);
         $("#demo1").hide(1000);
          $("#demo3").hide(1000);
    });
});
  $(document).ready(function(){
    $("#btn3").click(function(){
        $("#demo3").toggle(1000);
        $("#demo2").hide(1000);
         $("#demo1").hide(1000);
          $("#demo").hide(1000);
    });
});


    </script>
    
        <p id="btnt" class="glyphicon glyphicon-play" style="">
how to send message
</p>
<div id="demo" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;Enter the message</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;Press on send button</p>
  <br>
</div>

   <p id="btn1" class="glyphicon glyphicon-play" style="">
how to read message
</p>
<div id="demo1" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press inbox message</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;select new message or old message then click and see</p>
  <br>
</div>

  <p id="btn2" class="glyphicon glyphicon-play" style="">
how to register visitors
</p>
<div id="demo2" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press on register visitor</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;fill the form approprietly</p>
  <p class="glyphicon glyphicon-hand-right">&nbsp;then press register</p>

<br>
  
  
</div>
<p id="btn3" class="glyphicon glyphicon-play" style="">
how to how to edit cafeteria schedule
</p>
<div id="demo3" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;caftereyia on cafteria </p>
<p class="glyphicon glyphicon-hand-right">&nbsp;press on the date you want to </p>
<p class="glyphicon glyphicon-hand-right">&nbsp;Enter prisoner id and press search</p>
  <br>
</div>
<!--help-->

  </div>

</div>
</td> 

<td><script src="../decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>

</div>
</div>
</body>
</html>

    </div>
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-center" style="font-family: comic sans ms; color:red;">change password </h4>
        </div>
        <div class="modal-body">
       <form action="" method="post">  
            <table class="table table-bordered"><tr><td style="font-family: comic sans ms; font-size: 25px;">username</td> <td><input type="text" name="username" class="form-control" style="border:2px solid green"></td></tr>

<tr><td style="font-family: comic sans ms; font-size: 25px;">password</td> <td><input type="password" name="cpassword"  required="" id="Pass" class="form-control" style="border:2px solid green"></td></tr>
<tr><td style="font-family: comic sans ms; font-size: 25px;">new password</td> <td><input type="password" name="npassword"   required="" id="Pass" class="form-control" style="border:2px solid green"></td></tr>
<tr><td style="font-family: comic sans ms; font-size: 25px;">confirm password</td> <td><input type="password" name="copassword"   required="" id="Pass" class="form-control" style="border:2px solid green"></td></tr>

<tr><td colspan="2"><input type="submit" name="update" class="btn btn-info form-control"  value="change password" style="font-size: 20px; height: 45px;"></td></tr>

          </table>
      </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</nav>
<html>
<head>

    