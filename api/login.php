<?php
$username = $_POST["username"];
$password = $_POST["password"];

if($username == 'admin' && $password == 'pass'){
  $response = '{"status":"ok","token":"123456789", "name":"Norair Gyuxacian"}';
}else{
  $response = '{"status":"error","message":"username or password does`t match"}';
}

sleep(1);
header("Content-Type: application/json");
//echo json_encode($result);
echo $response;
exit();
?>