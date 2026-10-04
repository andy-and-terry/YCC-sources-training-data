$name = "Widget"
$price = 9.5
"{0} costs {1:C2}" -f $name, $price
"{0,-10}|{1,8:N2}|" -f $name, $price
"{0:D5} {1:X} {2:P1}" -f 42, 255, 0.256
"Hello, $name! Total: $($price * 3)"
'single quotes keep $name literal'
