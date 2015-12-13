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
<xsl:if test="count(//user) = 0">
<a href="mobile_login.php"><span class="topBtn2">Login</span></a>
<a href="derp.php"><span class="topBtn">Register</span></a>
</xsl:if>

<xsl:if test="count(//user) = 1">

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




<xsl:for-each select="ads/ad">
<span class="adContainer2">
<img class="imageAD2" src="{pic}" alt="{pic}"/>


<span class="title"><xsl:value-of select="title"/></span>
<span class="description2"><xsl:value-of select="description"/></span>
<span class="price">Price = <xsl:value-of select="price"/></span>
<span class="price">Added by user: <xsl:value-of select="user_name"/></span>
<span class="price">Location = <xsl:value-of select="item_location"/></span>
</span>
</xsl:for-each>

</body>

</html> 


</xsl:template>
</xsl:stylesheet>