<?php 

include_once('Database.php');
$db = new Database();

     $id =  @$_POST['id'];
    // $isFavorite =(int)$_POST['isFavorite'];
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
      
        if (!isset($id)  || $id == NULL) {
         exit();

        }
        else 
        {
        $clId = $db->link->real_escape_string($id);
        $clearId = sqlonlemeforSerch(validation($clId));
       // $clName = $db->link->real_escape_string($isFavorite);
        //$clearFavorite = sqlonlemeforSerch(validation($clName));
        
        $deleted= $db->select( "UPDATE meals SET
        isFavorite = null WHERE id='$id' ");
	    if($deleted)
         {
            echo 'Delete Success';
            
         }
        $db ->link->close();
        return;
        /*
        //bir sutundaki tüm verileri silme 
        UPDATE table_name
        SET column_name = NULL
        WHERE column_name is not null;
        */
           /*
        //bir sutundaki tüm verilere belir bir değer verme 
        UPDATE table_name
        SET column_name = yenideger
        WHERE column_name=eskideger;
        */
        /*
        //belirli colonları silme
        $res = "UPDATE house_details SET
            rental_annual_rent = NULL,
            rental_block = NULL,
            rental_street = NULL,
            rental_area = NULL,
            rental_town = NULL,
            rental_state = NULL,
            rental_pincode = NULL
        WHERE house_details_id='$id'";
        */

    ?>