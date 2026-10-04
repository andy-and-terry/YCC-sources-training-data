$name = "Ada"
$score = 93.4567
$count = 7

"Name: {0}, Score: {1:N2}" -f $name, $score
"Padded: [{0,8}] [{0,-8}]" -f $name, $name
"Zero padded: {0:D4}" -f $count
"Hex: {0:X} Percent: {1:P1}" -f 255, 0.256
"Currency: {0:C2}" -f 1234.5
"Thousands: {0:N0}" -f 1234567
"Date: {0:yyyy-MM-dd}" -f [datetime]"2024-03-15"
"Repeated: {0} {0} {1}" -f "echo", "done"

$rows = @(
    @{ Item = "Pen"; Qty = 12; Price = 1.5 }
    @{ Item = "Notebook"; Qty = 3; Price = 4.25 }
)
foreach ($r in $rows) {
    "{0,-10}{1,5}{2,10:N2}" -f $r.Item, $r.Qty, ($r.Qty * $r.Price)
}
