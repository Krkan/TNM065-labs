<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" /> 
 
 

<xsl:template match="ad_service"> 



<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<title>Sell it!</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
<link rel="icon" type="image/png" href="images/favicon.png"/>
</head>

<body>
<div class="header">


<div class="logoContainer"><a href="index.php"><img src="recourse-images/temp_logo.png" alt="theLogo" class="logoImg"/></a>




</div></div>
<div class="barContainer">



</div>

<div class="regContainer">
<h2>Registration</h2>

<form action="registration.php" method="post" >




<div>
<h4>Username</h4>
 <input class="regContainerIn" type="text" name="user_name"/>
 <h4>Name</h4>
<input class="regContainerIn" type="text" name="name"/>
<h4>Last name</h4>

<input class="regContainerIn" type="text" name="lname"/>
<h4>Email</h4>


<input class="regContainerIn" type="text" name="email"/>
<h4>Password</h4>

<input class="regContainerIn" type="password" name="password"/>
</div>




<div><input type="submit" value="Register"/></div>
</form>

</div>







<div class="validator">
<p>
    <a href="http://validator.w3.org/check?uri=referer"><img
      src="http://www.w3.org/Icons/valid-html401" alt="Valid HTML 4.01 Strict" height="31" width="88"/></a>
  </p>
  
  <p>
    <a href="http://jigsaw.w3.org/css-validator/check/referer">
        <img style="border:0;width:88px;height:31px"
            src="http://jigsaw.w3.org/css-validator/images/vcss"
            alt="Valid CSS!" />
    </a>
</p>
  </div>
</body>

</html> 



</xsl:template> 
</xsl:stylesheet>