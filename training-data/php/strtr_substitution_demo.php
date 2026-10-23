<?php
// strtr has two forms: character-for-character and array-based replacement.

// Character mapping: each char in $from becomes the char at the same position in $to.
echo strtr("Hello World", "lo", "01"), "\n";   // He001 W1r0d

// Array form replaces the longest matching key first and never rescans replaced text.
$pairs = ["cat" => "dog", "dog" => "mouse", "mouse" => "cat"];
echo strtr("cat chases dog chases mouse", $pairs), "\n";

// str_replace is sequential, so replacements chain and give a different result.
echo str_replace(array_keys($pairs), array_values($pairs), "cat chases dog chases mouse"), "\n";

// Longest-key-first matters with overlapping keys.
echo strtr("hi all", ["hi" => "hello", "hi all" => "greetings"]), "\n";

// Handy for template placeholders.
$tpl = "Dear {name}, your order {id} has shipped.";
echo strtr($tpl, ["{name}" => "Ada", "{id}" => "#1042"]), "\n";

// Transliteration of accented characters.
echo strtr("café crème", ["é" => "e", "è" => "e"]), "\n";
