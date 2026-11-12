type Meters = distinct float
proc `+`(a, b: Meters): Meters {.borrow.}
proc `$`(m: Meters): string = $float(m) & "m"
echo Meters(1.5) + Meters(2.0)
