<?php
declare(strict_types=1);

function isIsogram(string $word): bool
{
    $letters = str_split(preg_replace('/[^a-z]/', '', strtolower($word)) ?: '');
    return count($letters) === count(array_unique($letters));
}

foreach (['lumberjacks', 'background', 'six-year-old', 'isograms'] as $w) {
    echo $w, ' ', isIsogram($w) ? 'yes' : 'no', PHP_EOL;
}
