<?php
/*
* Front Controller
*/
require_once "../config.php";

/*
Chargement des dépendances
*/
require_once "../model/articleModel.php";
require_once "../model/categoryModel.php";
require_once "../model/userModel.php";

/* Connexion à la BDD */
try{
    $db = new PDO(DB_DRIVER.":host=".DB_HOST.";port=".DB_PORT.";dbname=".DB_NAME.";charset=".DB_CHARSET,
    DB_LOGIN, DB_PWD, []);
    // activation du fetch vers PDO::FETCH_ASSOC
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
}catch(Exception $e){
    die($e->getMessage());
}

var_dump($db,$_POST);

// bonne pratique
$db = null;