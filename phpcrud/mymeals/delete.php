<?php
include_once('Database.php');

        $db = new Database();
        $id =  @$_POST['id'];
        
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
      
        if (!isset($id)  || $id == NULL) 
        {
         exit();

        }
        else 
        {
            $clId = $db->link->real_escape_string($id);
            $clearId = sqlonlemeforSerch(validation($clId));
           
            $query = "DELETE FROM userms WHERE id = '$clearId' ";
                $deleted = $db->delete($query);
                if($deleted)
                {
                    echo 'Delete Success';
                   
                }
                 $db ->link->close();
                 return;
        }
        
      
              
         
   
?>
