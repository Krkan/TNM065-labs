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

<div class="personalContainer">

<h2>User information</h2>
<div>
<div class="userinfo1" >Name: <xsl:value-of select="//user/name"/></div><br/>
<div class="userinfo1">Last name: <xsl:value-of select="//user/last_name"/></div><br/>
<div class="userinfo1">Email: <xsl:value-of select="//user/email"/></div><br/>
<div class="userinfo1">Joined: <xsl:value-of select="//user/date_of_reg"/></div><br/>
</div>

<h2>Place ad</h2>
<div class="theForm">Title: <br/> Description: <br/> Price: <br/> City: <br/>Category: <br/></div>
<div>

<form action="place_ad.php" method="post" enctype="multipart/form-data">

<input class="inputsP" type="text" name="title"/><br/>

 <input class="inputsP" type="text" name="description"/><br/>

 <input class="inputsP" type="number" name="price"/><br/>

 
<input class="inputsP" type="text" name="item_location"/><br/>



<select name="category">
  <option value="Furniture">Furniture</option>
  <option value="Car">Car</option>
  <option value="Clothing">Clothing</option>
</select><br/>
<div class="getPic">
Picture :<input class="inputsP" type="file" name="picture" accept=".jpg,.png"/>
</div>
<input type="submit" value="Submit"/>


</form>
</div>
<xsl:if test="count(//ad) &gt; 0">
<h2>My listed ads</h2>
<xsl:for-each select="ads/ad">
<div class="myAdWrap">
<div class="adMobileWrapP">
<span>
<span class="adImageSpan"><img class="imageAD" src="{pic}" alt="{pic}"/>

</span>
<span class="title"><xsl:value-of select="title"/></span>
<span class="description"><xsl:value-of select="description"/></span>
<span class="price">Price = <xsl:value-of select="price"/></span>
</span>


</div>
<a href="deleteAd.php?post_id={post_id}" class="adModifier">Delete</a>    <a href="changeAd.php?post_id={post_id}" class="adModifier">Change</a>
</div>
</xsl:for-each>
</xsl:if>

<xsl:if test="//user/user_name/@is_admin='yes'">
<a class="linkAdmin" href="admin.php"><span>Administrative controls</span></a>

</xsl:if>

</div>
</body>

</html> 


</xsl:template>
</xsl:stylesheet>