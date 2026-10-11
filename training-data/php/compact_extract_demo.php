<?php

function buildUser(): array
{
    $name = 'Lena';
    $age = 29;
    $active = true;
    return compact('name', 'age', 'active');
}

$user = buildUser();
print_r($user);

extract(['title' => 'Dr', 'surname' => 'Kim']);
echo "$title $surname\n";

extract(['title' => 'Prof'], EXTR_SKIP);
echo "$title\n";
