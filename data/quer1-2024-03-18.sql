SELECT * FROM article;
SELECT * FROM category;
SELECT * FROM user;
# Je veux sélectionner tous les articles avec les champs
# ar_id, ar_title depuis article
# Lorsque ar_is_published vaut 1, en y joignant les
# user.us_login et user.us_email
SELECT a.ar_id, a.ar_title, u.us_login, u.us_email 
	FROM article a 
		INNER JOIN user u
			ON u.us_id = a.user_us_id
	WHERE a.ar_is_published = 1;
# Et les rubriques liées si elles existent 
# aux articles cg_name
SELECT a.ar_id, a.ar_title, u.us_login, u.us_email, 
	GROUP_CONCAT(c.cg_name separator "|||") AS cg_name
	FROM article a 
		INNER JOIN user u
			ON u.us_id = a.user_us_id
		LEFT JOIN category_has_article h
			ON a.ar_id = h.article_ar_id
		LEFT JOIN category c
			ON c.cg_id = h.category_cg_id
	WHERE a.ar_is_published = 1
    GROUP BY a.ar_id;