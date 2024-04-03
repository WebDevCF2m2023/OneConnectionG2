<?php
/*

On doit charger tous les articles (champs : ar_id, ar_title, ar_text(que les 260 premier caractères), ar_datetime) de la table article

AINSI que les champs (us_id, us_login) de la table user (obligatoires : jointure interne: JOIN INNER JOIN) 

AINSI que les champs (cg_id, cd_name) de la table category (Non obligatoire, les articles sont prioritaires, jointure externe de type LEFT JOIN)

si ils sont publiés (ar_is_published=1) par ar_datetime DESC

*/
function getHomepageArticle(PDO $cn) : string|array
{
    $sql = "SELECT 
                article.ar_id, 
                article.ar_title, 
                SUBSTRING(article.ar_text,1,260) AS ar_text, 
                article.ar_datetime,
                user.us_id,
                user.us_login
            FROM article

            INNER JOIN user
                ON user.us_id = article.user_us_id
            
            WHERE article.ar_is_published = 1
            ;";
    try{
        $query = $cn->query($sql);
        $result = $query->fetchAll();
        $query->closeCursor();
        return $result;
    }catch(Exception $e){
        return $e->getMessage();
    }
}