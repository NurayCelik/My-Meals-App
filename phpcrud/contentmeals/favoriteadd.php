<?php
include_once('Database.php');

        $db = new Database();

        $user_id =  (int)@$_POST['user_id'];
        $meal_id = (int)@$_POST['meal_id'];
          

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
      
        if (!isset($user_id)  || $user_id== NULL ||
         !isset($meal_id)  || $meal_id== NULL ) {
         exit();

        }
        else 
        {
          $cluser_id = $db->link->real_escape_string($user_id);
          $clearUser_id = sqlonlemeforSerch(validation($cluser_id));
          $clMeal_id = $db->link->real_escape_string($meal_id);
          $clearMeal_id = sqlonlemeforSerch(validation($clMeal_id));
          
          //aynı veriyi insert etmeyi önlemek için içiçe sorgu.
          $inserted = $db->insert("INSERT INTO user_favorites ( user_id, meal_id) 
          SELECT user_id, meal_id FROM 
          (SELECT '$clearUser_id' as user_id, '$clearMeal_id' as meal_id) t 
          WHERE NOT EXISTS (SELECT 1 FROM user_favorites u 
          WHERE u.user_id=t.user_id and u.meal_id=t.meal_id)"); 
                if($inserted)
                {
                    echo 'Add Success';
                    $db ->link->close();
                }
          
          
          return;
    
        }
        
  
?>