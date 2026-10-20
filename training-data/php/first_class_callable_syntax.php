<?php
class Str
{
    public function up(string $s): string { return strtoupper($s); }
    public static function rev(string $s): string { return strrev($s); }
}

$up = (new Str)->up(...);
$rev = Str::rev(...);
$len = strlen(...);
echo $up('abc'), $rev('abc'), $len('abcd'), PHP_EOL;
echo implode(',', array_map($up, ['a', 'b'])), PHP_EOL;
