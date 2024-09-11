<?php
$ofset = $_GET["ofset"];
$limit = $_GET["limit"];

for($i=$ofset; $i<$limit+$ofset; $i++ ){
  $arr[] = array(
		"name"=>$i."Արմեն Տիգրանյան".$i,
		"place"=>$i."Սիսիան, Սյունիք".$i,
		"profile"=>"Անասնապահություն, Հողագործություն...".$i,
		"image"=>"https://demo.zoom.am/test/avatars/".$i.".jpg");
}

$final_array = Array("status"=>"ok","message"=>"ok","data"=>$arr);
$response =  json_encode($final_array);

  header("Content-Type: application/json");
//echo json_encode($result);
echo $response;
exit();
?>

