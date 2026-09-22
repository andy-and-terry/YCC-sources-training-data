<?php

$text = "  The Quick Brown Fox  ";

echo trim($text) . "\n";
echo str_pad("42", 6, "0", STR_PAD_LEFT) . "\n";
echo str_contains($text, "Quick") ? "contains Quick\n" : "no match\n";
echo str_replace("Fox", "Dog", trim($text)) . "\n";
echo strrev(trim($text)) . "\n";
echo wordwrap(trim($text), 10, "\n", true) . "\n";
echo substr_count(strtolower($text), "o") . "\n";
echo ucwords(strtolower(trim($text))) . "\n";
