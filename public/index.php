<?php
/*
* Front Controller
*/


/*
Chargement des dépendances
*/
require_once "../config.php";
// modèles
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

/*
Pour la homepage
On va récupérer le menu (liste de catégories + retour à l'accueil)
On va récupérer tous les articles par ordre de ar_datetime DESC avec les auteurs (obligatoire) et les catégories (si elles existent), si ar_is_published vaut 1
*/

$menu = getAllVisibleCategory($db);

/*
On doit charger tous les articles (champs : ar_id, ar_title, ar_text(que les 260 premier caractères), ar_datetime) de la table article

AINSI que les champs (us_id, us_login) de la table user (obligatoires : jointure interne: JOIN INNER JOIN) 

        AINSI que les champs (cg_id, cd_name) 
        de la table category (Non obligatoire, 
        les articles sont prioritaires, 
        jointure externe de type LEFT JOIN)

si ils sont publiés (ar_is_published=1) 
        
        par ar_datetime DESC
*/
$homepageArticle = getHomepageArticle($db);

// var_dump($menu);
var_dump($homepageArticle);
/*
Appel de la vue homepage
*/
require "../view/homepage.html.php";

// bonne pratique
$db = null;