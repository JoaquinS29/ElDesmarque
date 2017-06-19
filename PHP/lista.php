<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Lista PHP</title>
    </head>
    <body>
        <?php
            $lista = $_POST["lista"];
            $numeros = explode(",", $lista);
            
            echo "<ul>";
                for ($i = 0; $i < count($numeros); $i++) {
                    echo "<li>$numeros[$i]</li>";    
                }
            echo "</ul>";
        ?>
    </body>
</html>