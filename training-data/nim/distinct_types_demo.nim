type
  Meters = distinct float
  Feet = distinct float

proc `+`(a, b: Meters): Meters = Meters(a.float + b.float)
proc `$`(m: Meters): string = $m.float & "m"

proc toFeet(m: Meters): Feet = Feet(m.float * 3.28084)
proc `$`(f: Feet): string = $f.float & "ft"

let a = Meters(2.0)
let b = Meters(3.5)
let total = a + b
echo total
echo toFeet(total)

# distinct types share the base representation but not its operators,
# so mixing a Meters value with a raw float is a compile error unless
# explicitly converted via `.float` or a constructor call.
