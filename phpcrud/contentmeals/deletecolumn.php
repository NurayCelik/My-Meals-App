<?php 
/* Kolon Ekleme:
ALTER TABLE tablo_adi ADD kolon_adi alan_turu

Kolon Silme:
ALTER TABLE
tablo_adi DROP COLUMN kolon_adi */
include_once('Database.php');
$db = new Database();

     $isFavorite =(int)$_POST['isFavorite'];
     function validation($data){
        $data1 = trim($data);
        $data2 = stripcslashes($data1);
        $data3 = htmlspecialchars($data2);
        return $data3; // here i return this $data variable so we can use this.
        }
       function sqlonlemeforSerch($data)
        {
        $bad = array("content-type","'","bcc:","to:","cc:","href","* from","* FROM","*from","*FROM","SET","set","update","UPDATE","updateset","UPDATESET","UPDATE SET","DELETE","delete","*","SELECT*FROM","s3","S3","%7C","%2B");
        $islem = str_replace($bad,"",$data);
        
        return $islem;
        }
      
        if (!isset($isFavorite)  || $isFavorite == NULL ) {
         exit();

        }
        else 
        {
        $clName = $db->link->real_escape_string($isFavorite);
        $clearFavorite = sqlonlemeforSerch(validation($clName));
        $deleted= $db->select("ALTER TABLE meals DROP COLUMN isFavorite");
        if($deleted)
        {
            echo 'Delete Success';
            
        }
        $db ->link->close();
        return;
    }

	?>