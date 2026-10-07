<?php
$csv = "a,b,c,d";
$parts = explode(",", $csv, 3);
print_r($parts);
echo implode("|", str_split("abcdef", 2)), "\n";
parse_str("name=Ann&age=30", $out);
echo $out['name'], $out['age'], "\n";
echo http_build_query(['q' => 'php 8', 'page' => 2]), "\n";
echo ucfirst(strtolower("HELLO")), "\n";
var_dump(str_contains("haystack", "st"), str_starts_with("haystack", "hay"));
