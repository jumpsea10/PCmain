<?php
function loadEnv($filePath)
{
    if (!file_exists($filePath)) {
        return;
    }
    $lines = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue; 
        }

        list($name, $value) = explode('=', $line, 2);

        $name = trim($name);
        $value = trim($value);

        putenv("$name=$value");   
        $_ENV[$name] = $value;    
    }
}

loadEnv(__DIR__ . '/../../.env');
$con = mysqli_connect($_ENV['DB_HOST_NAME'],$_ENV['DB_USER_NAME'],$_ENV['DB_PASSWORD']);
$db = mysqli_select_db($con,$_ENV['DB_NAME']);

function mysql_query($query){
    global $con;
    return mysqli_query($con,$query);
}

?>