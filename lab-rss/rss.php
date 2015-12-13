 <?php header("Content-type:text/xml;charset=utf-8");?>  
 <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns="http://purl.org/rss/1.0/"
xmlns:dc="http://purl.org/dc/elements/1.1/">

	<channel rdf:about="http://www.itn.liu.se/">
		<title>Bokkatalog</title>
		<link>http://www.itn.liu.se/</link>
		<description>En bokkatalog.</description>
		<dc:language>en</dc:language>
		
<?php	
		$date = date(DATE_W3C);
		
		echo '<dc:date>'.$date.'</dc:date> 
		<dc:publisher>LiU/ITN</dc:publisher>
		<dc:creator>Izmir</dc:creator> 
		
		<items> 
		<rdf:Seq>';
		
		
 
 

    // koppla upp mot databasen med med användarnamn "rsslab", utan lösenord
    $link = mysql_connect("mysql.itn.liu.se", "rsslab")
        or die("Could not connect");
    // välj databasen rsslab
    mysql_select_db("rsslab")
        or die("Could not select database");
    $return ="";
    
    // en sql-fråga som väljer ut alla länkar och sorterar efter publish date
    $query = "SELECT link
            FROM bookcatalog ORDER BY publish_date DESC";

    // utför själva frågan. Om du har fel syntax får du felmeddelandet query failed
    $result = mysql_query($query)
        or die("Query failed");
        
    // loopa över alla resultatrader 
    while ($line = mysql_fetch_object($result)) {
		$link = $line->link;
		$link = preg_replace("/&/", "&amp;", $link);
				$link = preg_replace("/ /", "%20", $link);

		
		$return =  $return . "<rdf:li rdf:resource='" . $link . "' />
		";
      
    }
	
	$return =  $return . "</rdf:Seq>
	</items>
	</channel>
	";
	echo $return;
	
	$query = "SELECT * FROM bookcatalog ORDER BY publish_date DESC";
	
	$result = mysql_query($query)
        or die("Query failed");
		
		$out ="";
	
	while($rsl = mysql_fetch_object($result)){
		$link = $rsl->link;
		$title = $rsl->title;
		$desc = $rsl->description;
		$author = $rsl->author;
		$date = $rsl->publish_date;
		
		$link = preg_replace("/&/", "&amp;", $link);
		$link = preg_replace("/ /", "%20", $link);
		$desc = preg_replace("/&/", "&amp;", $desc);
		$title = preg_replace("/&/", "&amp;", $title);
		



$date = gmdate('Y-m-d\TH:i:s\Z', strtotime($date)+32400);






		
		$out = $out . "<item rdf:about='" . $link ."'><title>" . $title . "</title><link>" . $link . "</link><description>" . $desc . "</description><dc:creator>" . $author . "</dc:creator><dc:date>" . $date . "</dc:date></item>
		";
		
		
	}

	echo $out;
	
    
    
    ?>
	
	</rdf:RDF>