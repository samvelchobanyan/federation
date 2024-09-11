<?php
$ofset = $_GET["ofset"];
$limit = $_GET["limit"];

$response = '{
    "news":[
        {
            "title":"news title1",
            "image":"image1",    
            "teaser":"teaser text",
            "body":"body text"
        },
        {
            "title":"news title2",
            "image":"image1",    
            "teaser":"teaser text",
            "body":"body text"
        },
        {
            "title":"news title4",
            "image":"image1",    
            "teaser":"teaser text",
            "body":"body text"
        },
        {
            "title":"news title4",
            "image":"image1",    
            "teaser":"teaser text",
            "body":"body text"
        }
    ]

}';



for($i=$ofset; $i<$limit+$ofset; $i++ ){
  $arr[] = array(
		"title"=>$i."-Քաղաքաբնակների համար ձևավորված ժամանցի նոր տարբերակ գյուղական համայնքներում - AGRI WORKOUT".$i,
		"teaser"=>$i."-Ծրագրի արդյունքում գյուղական համայնքների գետերի ու ջրատարներ վրա տեղադրվում են աղբորսիչներ".$i,
		"body"=>"body text".$i,
		"image"=>"https://demo.zoom.am/test/images/image-".$i.".jpg");
}

$final_array = Array("status"=>"ok","message"=>"ok","data"=>$arr);
$response =  json_encode($final_array);

  header("Content-Type: application/json");
//echo json_encode($result);
echo $response;
exit();
?>

