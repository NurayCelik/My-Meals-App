<?php 
include_once('../databaseConfig/Database.php');
$db = new Database();

     $id =(int)$_POST['catId'];
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
      
        if (!isset($id)  || $id == NULL ) {
         exit();

        }
        else 
        {
            $clName = $db->link->real_escape_string($id);
            $clearId = sqlonlemeforSerch(validation($clName));
     
	$user = $db->select("SELECT * from meals
	where catId='$clearId' ORDER BY meals.id desc");
	$list = array();
	if($user->num_rows > 0){
	while($rowdata = $user->fetch_assoc()) {
			array_push($list,$rowdata);
			//$list[] = $rowdata;
		}
	}
	$db->link->close();
	header('Content-Type: application/json');
	echo json_encode($list);
	
 return;
        }

	?>