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
<div class="PersonalWrapper"><h2>Edit ad</h2>


<div>

<form class="cform" action="edit_ad.php?post_id={ads/ad/post_id}" method="post" enctype="multipart/form-data">
<h4>Title</h4> 
<input class="cform_input" type="text" value="{ads/ad/title}" name="title"/><br/>
<h4>Description</h4>
 <textarea class="cform_input2" type="text" name="description"><xsl:value-of select="ads/ad/description"/></textarea><br/>
<h4>Price</h4>
 <input class="cform_input" type="number" value="{ads/ad/price}" name="price"/><br/>
<h4>Location</h4>
 
<input class="cform_input" type="text" value="{ads/ad/item_location}" name="item_location"/><br/>


<h4>Category</h4>
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
<div class="currentPicDiv"><h4>Current picture</h4><img class="itemThumbnail" src="{ads/ad/pic}" alt="img"/></div>

<div class="getPic">
Picture :<input type="file" name="picture" accept=".jpg,.png"/>
</div>
<input type="submit" value="Submit"/>


</form>
</div>

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