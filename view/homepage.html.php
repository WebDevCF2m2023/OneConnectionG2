<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneConnection</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>OneConnection</h1>
        <nav>
            <ul>
                <li><a href="./">Accueil</a></li>
                <?php
                foreach($menu as $item):
                ?>
                <li><a href="./?category=<?=$item['cg_id']?>"><?=$item['cg_name']?></a></li>
                <?php
                endforeach;
                ?>
                <li><a href="./?connect">Connexion</a></li>
            </ul>
        </nav>
    </header>
    
    <div id="content"></div>
    <footer></footer>
</body>
</html>