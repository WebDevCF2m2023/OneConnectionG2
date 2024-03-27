# oneconnectiong2

/*
Sélection de tous les champs de la table article
*/
SELECT * FROM article;

/*
Sélection de tous les champs de la table article
lorsque le champs ar_is_published vaut 1
*/
SELECT * FROM article WHERE ar_is_published = 1;

/*
Sélection de tous les champs de la table category
*/
SELECT * FROM category;

/*
Sélection de tous les champs de la table category
lorsque cg_visibility vaut 1
*/
SELECT * 
	FROM category 
    WHERE cg_visibility = 1;
    
/*
Sélection de tous les champs de la table user SAUF
le us_pwd et le us_uniq_id
*/
SELECT us_id, us_login, us_email, us_active
	FROM `user`;

/*
Sélection de tous les champs de la table user SAUF
le us_pwd et le us_uniq_id, lorsque us_active vaut 1
*/
SELECT us_id, us_login, us_email, us_active
	FROM `user`
    WHERE us_active = 1;
    
/*
Sélection des champs ar_id, ar_title de la table article
quand ar_is_published vaut 1 ET que user_us_id n'est pas null
*/
SELECT ar_id, ar_title
	FROM article
    WHERE ar_is_published = 1
		AND user_us_id IS NOT NULL;
        
/*
On sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une
jointure interne
INNER JOIN => JOIN 
*/
SELECT ar_id, ar_title,
		us_id, us_login
	FROM article
    INNER JOIN `user`
		ON `user`.us_id = article.user_us_id;
        
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
On sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une
jointure interne (obligation de jointure) et les cg_id et cg_name si ils existent (facultatif)
*/
SELECT article.ar_id, article.ar_title,
		user.us_id, user.us_login,
        category.cg_id, category.cg_name
	FROM article
    INNER JOIN `user`
		ON `user`.us_id = article.user_us_id
	LEFT JOIN category_has_article
		ON category_has_article.article_ar_id = article.ar_id
	LEFT JOIN category
		ON category_has_article.category_cg_id = category.cg_id
        ;
        
/*
On sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une
jointure interne (obligation de jointure) et les cg_id et cg_name si ils existent (facultatif)

On va utiliser les alias de tables (internes), en général une
à trois lettres, écrite après l'appel de la table (Personnellement je n'utilise pas la AS), pour pouvoir raccourcir les requêtes, mais surtout pour pouvoir faire des requêtes imbriquées.

Les alias de sortie sont les noms des résultats envoyés en dehors de la requête. J'utilise AS
*/
SELECT a.ar_id AS idarticle, a.ar_title,
		u.us_id AS iduser, u.us_login,
        c.cg_id AS idcategory, c.cg_name
	FROM article a
    INNER JOIN `user` u
		ON u.us_id = a.user_us_id
	LEFT JOIN category_has_article h
		ON h.article_ar_id = a.ar_id
	LEFT JOIN category c
		ON h.category_cg_id = c.cg_id
        ;
        
/*
On sélectionne les champs ar_id, ar_title de la table article
avec les us_id et us_login de la table user avec une
jointure interne (obligation de jointure) et les cg_id et cg_name si ils existent (facultatif)


Nous avons des duplications de lignes non désirées. Nous voulons obtenir 1 ligne par article.
Pour celà nous allons 

*/
SELECT a.ar_id, a.ar_title,
		u.us_id, u.us_login,
        GROUP_CONCAT(c.cg_id) AS cg_id, 
        GROUP_CONCAT(c.cg_name SEPARATOR '|||') AS cg_name
	FROM article a
    INNER JOIN `user` u
		ON u.us_id = a.user_us_id
	LEFT JOIN category_has_article h
		ON h.article_ar_id = a.ar_id
	LEFT JOIN category c
		ON h.category_cg_id = c.cg_id
	GROUP BY a.ar_id
        ;