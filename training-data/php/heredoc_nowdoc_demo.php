<?php

$name = 'Ada';
$items = ['apples' => 3, 'pears' => 5];

$report = <<<TEXT
Report for {$name}
Apples: {$items['apples']}
Pears:  {$items['pears']}
Total:  {$items['apples']}
TEXT;
echo $report, "\n\n";

$raw = <<<'RAW'
No $interpolation here, \n stays literal.
RAW;
echo $raw, "\n\n";

// closing marker indentation is stripped from every line
$html = <<<HTML
    <ul>
      <li>$name</li>
    </ul>
    HTML;
echo $html, "\n\n";

$fn = fn(int $n) => $n * 2;
echo <<<EOT
Double of 21 is {$fn(21)}
Name length: {$fn(strlen($name))}
EOT;
echo "\n";
