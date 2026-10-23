<?php
// filter_var validates and sanitises values using built-in filters.

$inputs = ["42", "-7", "3.14", "abc", "0x1A"];
foreach ($inputs as $in) {
    $int = filter_var($in, FILTER_VALIDATE_INT);
    echo str_pad($in, 6), $int === false ? "not an int" : "int $int", "\n";
}

// Range check via options.
$age = filter_var("130", FILTER_VALIDATE_INT, ["options" => ["min_range" => 0, "max_range" => 120]]);
var_dump($age);

// Booleans understand yes/no/on/off; NULL_ON_FAILURE distinguishes "false" from invalid.
foreach (["yes", "off", "maybe"] as $v) {
    var_dump(filter_var($v, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE));
}

// Email, URL and IP validation.
var_dump(filter_var("ada@example.com", FILTER_VALIDATE_EMAIL));
var_dump(filter_var("not an email", FILTER_VALIDATE_EMAIL));
var_dump(filter_var("https://example.com/path", FILTER_VALIDATE_URL));
var_dump(filter_var("192.168.1.300", FILTER_VALIDATE_IP, FILTER_FLAG_IPV4));

// Default values on failure.
echo filter_var("oops", FILTER_VALIDATE_INT, ["options" => ["default" => 10]]), "\n";
