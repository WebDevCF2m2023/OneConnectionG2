# OneConnectionG2
Un mini site de News en MVC créé par le Groupe 2 WebDev 2024

## Projet en MVC

Ce projet sera réalisé en utilisant le modèle MVC (Modèle-Vue-Contrôleur) pour la gestion des pages et des données.

![MVC](https://raw.githubusercontent.com/WebDevCF2m2023/OneConnectionG2/main/public/img/MVC.png)

## Scripts disponibles

### `uniqid()`

https://onlinephp.io/c/56cfb

### `password_hash()` and `password_verify()`

https://onlinephp.io/c/43199

## Jointures SQL
![SQL JOIN](https://raw.githubusercontent.com/WebDevCF2m2023/BetterConnectionG1/main/public/img/sql-joins.jpg)

## Exemples d'articles

Merci au site https://sql.sh/ pour les exemples d'articles utilisés en développement pendant cet exercice de projet de groupe.

## Utilisateurs de test

### Administrateurs

- `Mikhawa` / `Mikhawa`
- `PierreSandron` / `PierreSandron`
- `Logan` / `Logan`

### Exercice 1
dans view\homepage.html.php, affichez le menu avec les catégories récupérés sur le contrôleur frontal, en faisant des liens de type 
    `<a href="?category=2">MySQL</a>`

### Exercice 2

On doit charger tous les articles (champs : ar_id, ar_title, ar_text(que les 260 premier caractères), ar_datetime) de la table article

AINSI que les champs (us_id, us_login) de la table user (obligatoires : jointure interne: JOIN INNER JOIN) 

        AINSI que les champs (cg_id, cd_name) 
        de la table category (Non obligatoire, 
        les articles sont prioritaires, 
        jointure externe de type LEFT JOIN)

si ils sont publiés (ar_is_published=1) 
        
        par ar_datetime DESC