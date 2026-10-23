<?php

declare(strict_types=1);

[$year, $month, $day] = sscanf('2024-03-15', '%d-%d-%d');
echo "$year/$month/$day\n";

$parsed = sscanf('temp: 21.5 C', 'temp: %f %s');
var_dump($parsed);

$packed = pack('nvN', 258, 258, 16909060);
echo bin2hex($packed), "\n";

$fields = unpack('nbig/vlittle/Nlong', $packed);
print_r($fields);

echo strlen(pack('A5', 'hi')), "\n";
echo bin2hex(pack('C*', 72, 105)), "\n";
