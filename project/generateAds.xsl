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
<xsl:if test="count(//user) = 0">
<div class="loginForm">
<form action="login.php" method="post" >
<div>
<div class="loginBar">
Username <br/><input type="text" name="user_name"/>
</div>
<div>Password <br/><input type="password" name="password"/></div>


<input type="submit" value="Login"/>
<a href="register.php">Register</a>
</div>
</form>
</div>
</xsl:if>
<xsl:if test="count(//user) = 1">

<div class="loginText">Logged in as <a href="personal.php"><xsl:value-of select="//user/user_name"/></a><br/>
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
<xsl:for-each select="ads/ad">
<div class="adLinkWrapper"><a href="ad.php?post_id={post_id}">
<span class="adContainer">
<img src="{pic}" alt="{pic}" class="itemThumbnail"/>
<span class="textDesc"><span class="textTitle"><xsl:value-of select="title"/></span><xsl:value-of select="description"/><span class="thePrice">Price = <xsl:value-of select="price"/></span></span>
</span>
</a>
<xsl:if test="//user/user_name/@is_admin='yes'">
<a href = "admin_delete_ad.php?post_id={post_id}"><span>Delete</span></a>
</xsl:if>
</div>

</xsl:for-each>



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