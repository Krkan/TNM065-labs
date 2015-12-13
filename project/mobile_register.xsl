<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" /> 
 
 

<xsl:template match="ad_service"> 

<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<title>Sell it!</title>
<link rel="stylesheet" type="text/css" href="mobile_style.css"/>
<link rel="icon" type="image/png" href="images/favicon.png"/>
</head>

<body>
<div class="header"><a href="index.php"><img class="logo" src="recourse-images/logo.png" alt="theLogo"/></a>
</div>
<div class="searchContainer"></div>


<form class="loginFormMobile" action="registration.php" method="post" >
<div>
<div >
Username <br/><input class="loginBar" type="text" name="user_name"/>
</div>
<div>Name <br/><input class="loginBar" type="text" name="name"/></div>

<div>Last name <br/><input class="loginBar" type="text" name="lname"/></div>

<div>Email <br/><input class="loginBar" type="text" name="email"/></div>

<div>Password <br/><input class="loginBar" type="password" name="password"/></div>





<input type="submit" value="Register"/>

</div>
</form>



</body>

</html> 


</xsl:template>
</xsl:stylesheet>