$name = "Widget"
$price = 1234.5
$qty = 7

"{0} costs {1:C2}" -f $name, $price
"{0,-10}|{1,6}|" -f $name, $qty
"{0:N0} / {1:P1}" -f 1234567, 0.256
"{0:D5} {0:X} {0:E2}" -f 255
"{0:yyyy-MM-dd}" -f [datetime]"2024-03-09"

$padded = $name.PadRight(10, '.') + $qty.ToString().PadLeft(4)
$padded
"Total: $($price * $qty)"
'single quotes keep $name literal'
"tab`tseparated`nnew line"
