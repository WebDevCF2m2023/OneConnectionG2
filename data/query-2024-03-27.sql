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