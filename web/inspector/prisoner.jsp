<html>
<head>
   <head>
  
    <link href="style1.css" rel="stylesheet" type="text/css"/>
    <script src="jquery-1.7.1.min.js"></script>
    <script src="registration_script.js"></script>
	  <link rel="stylesheet" media="screen" href="login.css" >
</head>
<body> 

<table align="center" border="0" bgcolor="white" width="400" cellpadding="9" cellspacing="0" >
          <tr>
            <td colspan="2" height="2"><img src="../logo2.png" width="860"></td>
          </tr>
          <tr>
            <td width="25%" bgcolor="#FFFFFF" >&nbsp;&nbsp;
            <td width="50%" align="center" bgcolor="white">
       
<div id="content" class="ctrdiv">
	<form id="frmReg" method="POST" action="../register">
       <h2 id="hdr_title">Register New Prisoner </h2>
            <div class="control_input">
            <label for="Nid" class="label">ID_NO</label><input type="text" name="id_no" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="" pattern="/^[A-Za-z'.\s]{1,40}$*$/" required="">
            </div>
            <div class="control_input">
                <label for="Fname" class="label">First Name</label><input type="text" id="Fname" name="fname" class="reg_fields" required placeholder=""/>
            </div>
       <div class="control_input">
                <label for="mname" class="label">middle Name</label><input type="text" id="Fname" name="mname" class="reg_fields" required placeholder=""/>
            </div>
       <div class="control_input">
                <label for="lname" class="label">last Name</label><input type="text" id="Fname" name="lname" class="reg_fields" required placeholder=""/>
            </div>
         
             <div class="control_input">
                <label for="age" class="label">age</label><input type="text" id="Fname" name="age" class="reg_fields" required placeholder=""/>
            </div>
    <div class="control_input">
                <label for="sex" class="label">sex</label><select name="sex" id="Fname" class="reg_fields" style="border:1px solid gray;">
                <option value="male"> Male</option>
                <option value="female"> FeMale</option>
            </select>
            </div>
       
             <div class="control_input">
                <label for="crime_type" class="label">crime_type</label><input type="text" name="crimetype" class="reg_fields" required/>
            </div>
        <div class="control_input">
         <label for="education" class="label"> education_level</label><input type="text" name="education" class="reg_fields" style="border:1px solid gray;" value="" required=""/>
             </div>
    <div class="control_input">
       <label for="zone" class="label">zone</label> <select name="zone" class="form-control" style="border:2px solid gray;" required="">
               <option value="assosa">Assosa</option>
<option value="kamatch">Kamatch</option>
<option value="metekel">Metekel</option>
             </select>
           </div>
        <div class="control_input">
  <label for="region" class="label">region</label>  <select name='region' class='form-control' style='border:1px solid gray;'>
  <option value='tigray'>Tigray</option>
 <option value='amhara'>Amhara</option>
  <option value='oromia'>Oromia</option>
   <option value='snnr'>SNNR</option>
    <option value='harar'>Harar</option>
     <option value='bgrs'>BGRS</option>
      <option value='somali'>somali</option>
       <option value='afar'>afar</option>
        <option value='gambela'>gambela</option>
</select>
   </div>
  <div class="control_input">
      <label for="hight" class="label">hight</label><input type="double" name="height" class="form-control" style="border:1px solid gray;" required="">
   </div> 
      <div class="control_input">
   <label for="face" class="label">face_color</label>   <select name="face" class="form-control" style="border:1px solid gray;" required="">
    <option value="black">Black</option>
    <option value="white">White</option>
    <option value="white-black">White-Black</option>
  </select>
      </div> 
          <div class="control_input">
              <label for="phone" class="label">parent_phone</label> <input name='parent_phone' class='form-control' style='border:1px solid gray;' value="+251" pattern="[+]{1}[2]{1}[5]{1}[1]{1}[0-9]{9}" required=''>
            </div>
        <div class="control_input">
      <label for="ed" class="label">entering date</label> <input type="date" name="tsp" class="form-control" style="border:2px solid gray;"  required>
          </div>
       <div class="control_input">
<label for="ed" class="label">leaving date</label>
     <input type="date" name="tcp" class="form-control" style="border:1px solid gray;"  required>
      </div>
       <div class="control_input">
<label for="file" class="label">photo</label><input type='file' name='photo' class='form-control' required=''>
     </div>
       <div class="control_input">
  <label for="file" class="label"></label> <input type="submit" name="register" id="Add" value="registr prisoner" class="btn btn-success form-control" >
 
            </div>
          
    </form>
    <tr>
            <td colspan="2" bgcolor="#FF0000" height="1" align="center">
	     	   <font size="4">   
           <a href="index.jsp">BACK TO HOME</a> 
          </font>
            </td>
          </tr>
</td>
</tr>
<tr>
  
</tr>
</table>
</body>
</html>