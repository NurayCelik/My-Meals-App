<?php
include_once('Database.php');

        $db = new Database();

        $id =  (int)@$_POST['id'];
        $title = @$_POST['title'];
        $catId = (int)['catId'];
        $imageUrl = @$_POST['imageUrl'];
        $duration = @$_POST['durati'];
        $complexity = @$_POST['complexity'];
        $affordability = @$_POST['affordability'];
        $ingredients = @$_POST['ingredients'];
        $steps = @$_POST['steps'];
        $isGlutenFree = (int)@$_POST['isGlutenFree'];
        $isLactoseFree = (int)@$_POST['isLactoseFree'];
        $isVegan = (int)@$_POST['isVegan'];
        $isVegetarian = (int)@$_POST['isVegetarian'];
        $isFavorite = (int)@$_POST['isFavorite'];        

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
         !isset($catId)  || $catId== NULL || !isset($title)  || $title== NULL ||
         !isset($imageUrl )  || $imageUrl == NULL || !isset($duration )  || $duration == NULL 
         || !isset($complexity )  || $complexity == NULL || !isset($affordability )  || $affordability == NULL || !isset($ingredients )  || $ingredients == NULL 
         || !isset($steps )  || $steps == NULL ||  !isset($isGlutenFree )  || $isGlutenFree == NULL 
         || !isset($isLactoseFree )  || $isLactoseFree == NULL || !isset($isVegan )  || $isVegan == NULL || !isset($isVegetarian )  || $isVegetarian == NULL 
         || !isset($isFavorite )  || $isFavorite == NULL ) {
         exit();

        }
        else 
        {
          $clId = $db->link->real_escape_string($id);
          $clearId = sqlonlemeforSerch(validation($clId));
          $clcatId = $db->link->real_escape_string($catId);
          $clearCatId = sqlonlemeforSerch(validation($clcatId));
          $cltitle = $db->link->real_escape_string($title);
          $clearTitle = sqlonlemeforSerch(validation($cltitle));
          $clImageUrl = $db->link->real_escape_string($imageUrl);
          $clearImageUrl = sqlonlemeforSerch(validation($clImageUrl));
          $clDuration = $db->link->real_escape_string($duration);
          $clearDuration = sqlonlemeforSerch(validation($clDuration));
          $clComplexity = $db->link->real_escape_string($complexity);
          $clearComplexity = sqlonlemeforSerch(validation($clComplexity));
          $clAffordability = $db->link->real_escape_string($affordability);
          $clearAffordability = sqlonlemeforSerch(validation($clAffordability));
          $clIngredients = $db->link->real_escape_string($ingredients);
          $clearIngredients = sqlonlemeforSerch(validation($clIngredients));
          $clSteps = $db->link->real_escape_string($steps);
          $clearSteps = sqlonlemeforSerch(validation($clSteps));
          $clIsGlutenFree = $db->link->real_escape_string($isGlutenFree);
          $clearIsGlutenFree= sqlonlemeforSerch(validation($clIsGlutenFree));
          $clIsLactoseFree = $db->link->real_escape_string($isLactoseFree);
          $clearIsLactoseFree = sqlonlemeforSerch(validation($clIsLactoseFree));
          $clIsVegan = $db->link->real_escape_string($isVegan);
          $clearIsVegan = sqlonlemeforSerch(validation($clIsVegan));
          $clIsVegetarian = $db->link->real_escape_string($isVegetarian);
          $clearVegetarian = sqlonlemeforSerch(validation($clIsVegetarian));
          $clIsFavorite = $db->link->real_escape_string($isFavorite);
          $clearIsFavorite = sqlonlemeforSerch(validation($clIsFavorite));
          
                $inserted = $db->insert("INSERT INTO meals
                VALUES ('$clId','$clearCatId', '$clearTitle', '$clearImageUrl', '$clearDuration', '$clearComplexity', '$clearAffordability', '$clearIngredients', '$clearSteps', '$clearIsGlutenFree', '$clearIsLactoseFree', '$clearIsVegan', '$clearVegetarian', '$clearIsFavorite')"); 
                if($inserted)
                {
                    echo 'Add Success';
                    $db ->link->close();
                }
          
          
          return;
    
        }
        
  
?>