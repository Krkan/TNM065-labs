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

<xsl:if test="//user[1]/user_name/@is_admin = 'yes'">

<div class="loginText">Logged in as <a href="personal.php"><xsl:value-of select="//user[1]/user_name"/></a><br/>
<a href="logout.php">Log out</a>

</div>

</xsl:if>


</div></div>
<div class="barContainer">

<form action="index.php" class="searchForm" method="post">
<div>
<input type="text" name="search" class="searchBar"/>
<select name="category" class="categoryItem">
  <option value="All">All</option>
  <option value="Furniture">Furniture</option>
  <option value="Car">Car</option>
  <option value="Clothing">Clothing</option>
</select>
<input type="submit" value="Search" class="searchBtn"/>
</div>
</form>

</div>
<div class="PersonalWrapper"><h2>Administrative controls</h2><h4>Users</h4>

<xsl:for-each select="//users/user">

<xsl:if test="current()/user_name/@is_admin = 'no'">

<div class="userinfo">
<span class="tbspan">User: </span> <xsl:value-of select="current()/user_name"/><br/>
<span class="tbspan">Name: </span> <xsl:value-of select="current()/name"/><br/>
<span class="tbspan">Lname: </span> <xsl:value-of select="current()/last_name"/><br/>
<span class="tbspan">Date: </span> <xsl:value-of select="current()/date_of_reg"/><br/>
<span class="tbspan">Email: </span> <xsl:value-of select="current()/email"/><br/>
<a href="delete_user.php?user_name={user_name}"><span class="tbspan">Delete</span></a>

</div>




<div> 

 
</div>


</xsl:if>


</xsl:for-each>

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