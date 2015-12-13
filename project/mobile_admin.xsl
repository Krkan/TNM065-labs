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


<xsl:if test="//user[1]/user_name/@is_admin = 'yes'">

<div class="logedInText">Logged in as <a href="personal.php"><xsl:value-of select="//user/user_name"/></a>


</div>
<div class="logedInText2">
<a href="logout.php">Log out</a>

</div>

</xsl:if>

</div>
<div class="searchContainer"><form action="index.php" class="searchForm" method="post">
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

</form></div>

<div class="personalContainer">

<h2>Administrative controls</h2><h4>Users</h4>

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
</body>

</html> 


</xsl:template>
</xsl:stylesheet>