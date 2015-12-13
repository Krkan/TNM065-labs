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


<form class="loginFormMobile"  action="edit_ad.php?post_id={ads/ad/post_id}" method="post" enctype="multipart/form-data">

<h2>Title</h2><input class="loginBar" type="text" value="{ads/ad/title}" name="title"/><br/>

<h2>Description</h2><input class="loginBar" type="text" value="{ads/ad/description}" name="description"/><br/>

<h2> Price</h2> <input class="loginBar" type="number" value="{ads/ad/price}" name="price"/><br/>

 
<h2>Location</h2><input class="loginBar" type="text" value="{ads/ad/item_location}" name="item_location"/><br/>



<select name="category">

<xsl:if test="ads/ad/@category='Clothing'">
  <option value="Furniture">Furniture</option>
  <option value="Car">Car</option>
  <option selected="selected" value="Clothing">Clothing</option>
  </xsl:if>
  
  <xsl:if test="ads/ad/@category='Furniture'">
  <option selected="selected" value="Furniture">Furniture</option>
  <option value="Car">Car</option>
  <option  value="Clothing">Clothing</option>
  </xsl:if>
  
  
  <xsl:if test="ads/ad/@category='Car'">
  <option value="Furniture">Furniture</option>
  <option selected="selected" value="Car">Car</option>
  <option value="Clothing">Clothing</option>
  </xsl:if>
  
  
</select><br/>
<div class="currentPicDiv"><h2>Current picture</h2> <img class="itemThumbnail" src="{ads/ad/pic}" alt="img"/></div>

<div class="getPic">
Picture :<input class="inputsP" type="file" name="picture" accept=".jpg,.png"/>
</div>
<input type="submit" value="Submit"/>


</form>



</body>

</html> 


</xsl:template>
</xsl:stylesheet>