
# oneconnectiong2

/*
selection de tout les champs de la table article
*/
SELECT * FROM article;
/*
selection de tout les champs de la table article lorsque le champs ar-published vaut 1
*/
SELECT * FROM article WHERE ar_is_published = 1;
/*
selection de tout les champs de la table category
*/
SELECT * FROM category;
/*
selection de tout les champs de la table category lorsque cg_visibility vaut 1
*/
SELECT * FROM category WHERE cg_visibility = 1;
/*
selection de tout les champs de la table user SAUF le us_pwd et le us_unique_id
*/
SELECT us_id,us_login,us_email,us_active FROM `user`;
/*
selection de tout les champs de la table user SAUF le us_pwd et le us_unique_id
*/
SELECT us_id,us_login,us_email,us_active FROM `user` WHERE us_active = 1;
/*
selection des champs ar_id, ar_titel de la table article quand ar_is_published vaut 1 et que user_us_id n'est pas null
*/
 SELECT ar_id,ar_title FROM article WHERE ar_is_published = 1 AND user_us_id is not NULL;
/*
on selection les champs ar_id,ar_title de la table article avec le us_id et us_login de la table user avec une jointure interne
*/
SELECT ar_id,ar_title,us_id,us_login FROM article inner join `user` on `user`.us_id = article.user_us_id;
/*
On sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une
jointure externe affichant tous les articles, même si ils n'ont pas de user
LEFT JOIN => prend tous les éléments de la table de "gauche",
après le FROM, et ce qu'il trouve dans la table user (facultatif)
*/
SELECT ar_id, ar_title,
        us_id, us_login
    FROM article
    LEFT JOIN `user`
        ON `user`.us_id = article.user_us_id;
/*
On sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une
jointure externe affichant les articles, mais surtout les de user, même si ils n'ont pas écrit d'articles
RIGHT JOIN => prend les éléments de la table de "gauche",
après le FROM, mais surtout tous ceux de la table de "droite" et ce qu'il trouve dans la table user, donc même les utilisateurs qui n'ont pas écrits d'article
*/
SELECT ar_id, ar_title,
        us_id, us_login
    FROM article
    RIGHT JOIN `user`
        ON `user`.us_id = article.user_us_id;
/*
on selection les champs ar_id,ar_title de la table article avec le us_id et us_login de la table user avec une jointure interne et les cg_id et cg_name si il existent

on va utuliser les alias de tables (internes) en general une a trois lettre ecrit azpres l appel de la table (le AS n est pas obliger) pour pouvoir raccourcir les requetes mais surtout pour pouvoir
*/
SELECT article.ar_id as id,article.ar_title as title,user.us_id as user,user.us_login as login,
GROUP_CONCAT(cg_id) as cg_id,
GROUP_CONCAT(cg_name SEPARATOR '|||') as cg_name
 FROM article inner join `user` on `user`.us_id = article.user_us_id
 left join  category_has_article has
 on has.article_ar_id = article.ar_id
 left JOIN category 
 on has.category_cg_id = category.cg_id
 group by article.ar_id
 ;
