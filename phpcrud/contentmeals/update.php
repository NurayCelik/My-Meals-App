<?php
include_once('Database.php');

        $db = new Database();
        
        
        $id = @$_POST['id'];
        $isFavorite=  @$_POST['isFavorite'];
        
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
      
        if (!isset($id)  || $id== NULL ||
         !isset($isFavorite)  || $isFavorite== NULL ) {
         exit();

        }
        else 
        {
            $clName = $db->link->real_escape_string($id);
            $clearId = sqlonlemeforSerch(validation($clName));
            $favorite= $db->link->real_escape_string($isFavorite);
            $clearisFavorite = sqlonlemeforSerch(validation($favorite));
               
                $query = "UPDATE meals SET 
                isFavorite= '$clearisFavorite'
                WHERE id = '$clearId' ";
            
                $updated = $db->update($query); 
                if($updated)
                {
                    echo 'Update Success';
                    $db ->link->close();
                }
                return;
        }
    

        
?>