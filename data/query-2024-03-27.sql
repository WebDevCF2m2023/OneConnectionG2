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



