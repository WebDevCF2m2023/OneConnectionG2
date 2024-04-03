<?php

function getArticles(PDO $connect) : array|string
{
    $sql = "
    SELECT
        GROUP_CONCAT(cha.category_cg_id) AS cg_id,
        GROUP_CONCAT(category.cg_name SEPARATOR '|||') AS cg_name,
        article.ar_id,
        article.ar_title,
        LEFT(article.ar_text, 260) AS ar_text,
        article.ar_datetime,
        user.us_login,
        user.us_id
    FROM article
    INNER JOIN `user` on user.us_id=article.user_us_id
    LEFT JOIN `category_has_article` cha ON article.ar_id=cha.article_ar_id
    LEFT JOIN `category` ON cha.category_cg_id=category.cg_id
    WHERE article.ar_is_published=1
    GROUP BY article.ar_id
    ORDER BY article.ar_datetime DESC";
    try{
        $query = $connect->query($sql);

        if($query->rowCount()==0) return "Pas d'articles";

        $result = $query->fetchAll();

        $query->closeCursor();

        return $result;

    }catch(Exception $e){
        return $e->getMessage();
    }
}