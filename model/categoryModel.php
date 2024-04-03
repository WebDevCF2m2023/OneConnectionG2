<?php

/*
On va charger les champs `cg_id`, `cg_name` de la table category quand cg_visibility vaut 1
*/
function getAllVisibleCategory(PDO $connect) : array|string
{
    $sql = "SELECT cg_id, cg_name FROM category WHERE cg_visibility=1";
    try{
        $query = $connect->query($sql);

        if($query->rowCount()==0) return "Pas de rubriques";

        $result = $query->fetchAll();

        $query->closeCursor();

        return $result;

    }catch(Exception $e){
        return $e->getMessage();
    }
}