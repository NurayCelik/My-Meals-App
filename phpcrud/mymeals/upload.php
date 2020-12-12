<?php
include_once('Database.php');

        $db = new Database();
        
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
      
       $permited = array('jpg','png','jpeg','gif');
       $myImage   = @$_FILES['image']['name'];
       $file_size = @$_FILES['image']['size'];
       $file_temp = @$_FILES['image']['tmp_name'];
       $file_type = @$_FILES['image']['type'];
        
       $div = explode('.', $myImage);
       $file_ext = strtolower(end($div));
       $unique_image = substr(md5(time()), 0, 10).'.'.$file_ext;
       $image = "uploads/".$myImage;

       $clearName = @$_POST['name'];

       if (!isset($clearName)  || $clearName == NULL ) {
         exit();

        }
        else 
        {
            
        if($clearName){
            $clName = validation($clearName);

            $name1 = $db->link->real_escape_string($clName);
            
            $name =sqlonlemeforSerch($name1);
        
        }
        else
        {
            exit();
            
        }
     
        if(!empty($myImage)) {
       
            if($file_size > 1054589 ) {
                 echo "<span class='error'>Image Boyutu 1MB den fazla olmamalı!</span>";
                exit();
                }elseif (in_array($file_ext, $permited) === false) {
                 echo "<span class='error'> Sadece şu uzantılı dosyaları yükleyebilirsiniz: ".implode(',', $permited)."</span>";
                exit(); 
                } else
                 {
                    
                 move_uploaded_file($file_temp, $image);
                 $db->insert("INSERT INTO person(name, image)
                 VALUES ('$name','$image')"); 
                 
                 }
       
       
           }
        
        }
         $db ->link->close();
   
?>