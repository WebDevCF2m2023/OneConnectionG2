# oneconnectiong2

/*
Selection de tous les champs de la table article
*/

SELECT * FROM article;

/*
Selection de tous les champs de la  table article lorsque le champs ar_is_published vaut 1
*/

SELECT * FROM article WHERE ar_is_published = 1;

/*
Selection de tous les champs de la table category
*/

SELECT * FROM category;

/*
Selection de tous les champs de la table category lorsque cg_visibility vaut 1
*/

SELECT * 
	FROM category
    WHERE cg_visibility = 1;
    
/*
Selection de tous les champs de la table user SAUF le us_pwd et le us_uniq_id lorsque us_active vaut 1
*/

SELECT us_id, us_login, us_email, us_active
 from `user`
 WHERE us_active = 1;
 
 /*
 Selection des champs ar_id, ar_title de la table article quand qr_is_published vaut 1 que user_us_id n'est pas null
 */
 
SELECT ar_id, ar_title
	FROM `article`
	WHERE ar_is_published = 1
		AND user_us_id IS NOT NULL;


/*
 On Selection les champs ar_id, ar_title de la table article avec le us_id et us_login de la table user avec une jointure interne
 INNER JOIN => JOIN
 */

SELECT ar_id, ar_title, us_id, us_login
	FROM `article`
	JOIN `user`
		ON `user` .us_id = article.user_us_id;
    
/*
 On Selection les champs ar_id, ar_title de la table article avec le us_id et us_login de la table user 
 avec
 une jointure EXTERNE affichant tous les articles, meme si ils n'ont pas de user
 LEFT JOIN => prend tous les  elements des la table de "GAUCHE",
 apres le FROM, et ce qu'il trouve dans la table user (facaultatif)
 */
 
SELECT ar_id, ar_title, us_id, us_login
	FROM `article`
    LEFT JOIN `user`
      ON `USER` .us_id = article.user_us_id;
      
      
/*
 On Selection les champs ar_id, ar_title de la table article avec le us_id et us_login de la table user 
 avec
 une jointure EXTERNE affichant tous les articles, mais surtout les users, meme si ils n'ont pas ecrit d'articles
 RIGHT JOIN => Prend les elements de la table de "gauche", 
 apres le FROM, mais surtout tous ceux de la table de "droite"
 et ce qu'il trouve dans la table user 
*/

SELECT ar_id, ar_title, us_id, us_login
	FROM `article`
    RIGHT JOIN `user`
          ON `USER` .us_id = article.user_us_id;
          
/*
On selectionne les champs ar_id, ar_title de la  table article
avec les us_id et us_login de la table user avec une jointure interne et les cg_id et cg_name si ils existent (facultatif)

*/

SELECT article.ar_id, article.ar_title,
		user.us_id, user.us_login,
		category.cg_id, category.cg_name
	FROM `article`
    INNER JOIN `user`
		ON `user` .us_id = article.user_us_id
	LEFT JOIN category_has_article
		ON category_has_article.article_ar_id = article.ar_id
	LEFT JOIN category
		ON category_has_article.category_cg_id = category.cg_id
	;
    
    /*
On selectionne les champs ar_id, ar_title de la  table article
avec les us_id et us_login de la table user avec une jointure interne et les cg_id et cg_name si ils existent (facultatif)

On va utiliser les alias de tables (internes)
*/

SELECT a.ar_id, a.ar_title,
		u.us_id, u.us_login,
		GROUP_CONCAT(c.cg_id) AS cg_id,
        GROUP_CONCAT(C.cg_name SEPARATOR '|||') AS cg_name
	FROM article a
    INNER JOIN `user` u
		ON u.us_id = a.user_us_id
	LEFT JOIN category_has_article h
		ON h.article_ar_id = a.ar_id
	LEFT JOIN category c
		ON h.category_cg_id = c.cg_id
	GROUP BY a.ar_id
	;