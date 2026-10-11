<?php

$items = ['apple', 'banana', 'cherry'];

if (count($items) > 2):
    echo "many items\n";
elseif (count($items) === 2):
    echo "two items\n";
else:
    echo "few items\n";
endif;

foreach ($items as $i => $item):
    echo ($i + 1) . ". $item\n";
endforeach;

$n = 0;
while ($n < 3):
    echo $n++;
endwhile;
echo "\n";

switch (count($items)):
    case 3:
        echo "three\n";
        break;
    default:
        echo "other\n";
endswitch;
