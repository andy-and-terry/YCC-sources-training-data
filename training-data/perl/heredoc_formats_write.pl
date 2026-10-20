use strict;
use warnings;

our ($name, $qty, $price);
format STDOUT_TOP =
Item        Qty   Price
----------------------
.
format STDOUT =
@<<<<<<<<< @>>> @##.##
$name,     $qty, $price
.
for (['apple', 3, 1.5], ['watermelon', 12, 22.25]) {
    ($name, $qty, $price) = @$_;
    write;
}
