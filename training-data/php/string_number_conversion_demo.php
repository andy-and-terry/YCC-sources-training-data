<?php

var_dump((int) '42abc');
var_dump((float) '3.14xyz');
var_dump(is_numeric('1e3'));
var_dump(is_numeric('0x1A'));
var_dump('10' == '1e1');
var_dump('abc' == 0);
var_dump(intval('0b11', 0));
var_dump(intval('0x1A', 16));
var_dump(octdec('17'));
var_dump(filter_var('12', FILTER_VALIDATE_INT));
var_dump(filter_var('12.5', FILTER_VALIDATE_INT));
