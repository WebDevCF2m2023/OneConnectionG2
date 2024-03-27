
#oneconnectiong2

/*
sélection de tous les champs de la table article
*/
SELECT * FROM article;
/*sélection de tous les champs de la table article lorsqe le champ ar_is_published vaut 1
*/
SELECT * FROM article WHERE ar_is_published=1;
/*
selection de tous les champs de la table category
*/
SELECT * FROM category;
/*
selection des tous les champs de la table category lorsque cg_visibility vaut 1
*/
SELECT * FROM category WHERE cg_visibility=1;
/*
selection des tous les champs de la table user sauf le us_pwd et le us_uniq_id, lorsque us_active vaut 1
*/
SELECT us_id, us_login, us_login, us_email, us_active FROM `user`;
SELECT us_id, us_login, us_login, us_email, us_active FROM `user`WHERE us_active=1;

/*
sélection des champs ar_id,ar_title de la table article quand ar_is_published vaut 1 et que user_us_id n'est pas null
*/
SELECT ar_id, ar_title FROM article WHERE ar_is_published=1 AND user_us_id IS NOT NULL;
/*
on sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une jointure interne
*/
SELECT ar_id, ar_title, us_id, us_login FROM article INNER JOIN `user` on `user`.us_id=article.user_us_id;
/*
on sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une jointure externe afichant toutes les articles meme si ils n'ont pas de user
*/
SELECT ar_id, ar_title, us_id, us_login FROM article LEFT JOIN `user` on `user`.us_id=article.user_us_id;
/*
on sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une jointure externe afichant toutes les articles, mais sur tout les user, meme si ils n'ont pas d'article
*/
SELECT ar_id, ar_title, us_id, us_login FROM article RIGHT JOIN `user` on `user`.us_id=article.user_us_id;
/*
on sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une jointure interne et les cg_id, cg_name si ils existe
*/
SELECT article.ar_id, article.ar_title, user.us_id, user.us_login, category.cg_id, category.cg_name 
FROM article 
INNER JOIN `user` on `user`.us_id=article.user_us_id 
LEFT JOIN category_has_article ON category_has_article.article_ar_id = article.ar_id
LEFT JOIN category ON category_has_article.category_cg_id=category.cg_id;
/*
on vais utiliser les alias de table(internes)
*/
SELECT a.ar_id, a.ar_title, u.us_id, u.us_login, c.cg_id, c.cg_name 
FROM article  a
INNER JOIN `user` u on u.us_id=a.user_us_id 
LEFT JOIN category_has_article h ON h.article_ar_id = a.ar_id
LEFT JOIN category c ON h.category_cg_id=c.cg_id;
/*
nous avons des duplications de ligne  non desirées, nous voulons une ligne par article
*/
SELECT a.ar_id, a.ar_title, u.us_id, u.us_login,
GROUP_CONCAT(c.cg_id) AS cg_id,
GROUP_CONCAT(c.cg_name SEPARATOR'|||') AS cg_name
FROM article  a
INNER JOIN `user` u on u.us_id=a.user_us_id 
LEFT JOIN category_has_article h ON h.article_ar_id = a.ar_id
LEFT JOIN category c ON h.category_cg_id=c.cg_id
GROUP BY a.ar_id;