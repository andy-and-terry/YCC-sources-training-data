<?php

$name = 'World';
$items = ['a' => 1];

echo <<<TXT
Hello, {$name}!
Item a = {$items['a']}
    Indentation is kept relative to the closing marker.
TXT;
echo "\n";

echo <<<'RAW'
No $interpolation here, and \n stays literal.
RAW;
echo "\n";

$sql = <<<SQL
    SELECT *
      FROM users
     WHERE name = '$name'
    SQL;
echo $sql, "\n";
