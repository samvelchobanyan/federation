<?php
$response = '{
  "anasnapahutyun":{
    "checked":false,
    "additional":{
      "name":"gom",
      "size":["0-10","11-20","21+"]
    },    
    "options":[
      {"xoz":["0-10","11-20","21+"]},
      {"kov":["0-5","5-10","11+"]}
    ]
  },
  "hoxagordzutyun":{
    "checked":false,
    "additional":{
      "name":"taracq",
      "size":["500","2000","4000+"]
    },
    "options":[
      {"hacahatik":["coren","gari"]},
      {"banjarexen":["kartofil","pomidor","bibar"]}
    ]
  }
}';

header("Content-Type: application/json");
//echo json_encode($result);
echo $response;
exit();
?>
