<?php

var_dump(PHP_INT_MAX);
var_dump(PHP_INT_MAX + 1);
var_dump(PHP_INT_SIZE);
var_dump(0.1 + 0.2 == 0.3);
var_dump(abs((0.1 + 0.2) - 0.3) < PHP_FLOAT_EPSILON);
var_dump(intdiv(-7, 2));
var_dump(-7 % 3);
var_dump(fmod(-7, 3));
var_dump(is_nan(NAN), is_infinite(INF));
var_dump(round(2.5), round(-2.5), round(1.955, 2));
