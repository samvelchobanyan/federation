<?php

$response = '{"status":"error","message":"username or password does`t match"}';

sleep(1);
header("Content-Type: application/json");
//echo json_encode($result);
echo $response;
exit();
?>