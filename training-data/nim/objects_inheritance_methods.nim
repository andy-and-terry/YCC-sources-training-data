type
  Animal = ref object of RootObj
    name: string
  Dog = ref object of Animal
    tricks: seq[string]
  Point = object
    x, y: int

method speak(a: Animal): string {.base.} = a.name & " makes a sound"
method speak(d: Dog): string = d.name & " barks"

proc `+`(a, b: Point): Point = Point(x: a.x + b.x, y: a.y + b.y)
proc `$`(p: Point): string = "(" & $p.x & "," & $p.y & ")"
proc `[]`(p: Point, i: int): int = (if i == 0: p.x else: p.y)
proc `==`(a, b: Point): bool = a.x == b.x and a.y == b.y

let animals: seq[Animal] = @[Animal(name: "generic"), Dog(name: "Rex")]
for a in animals: echo a.speak()
echo $(Point(x: 1, y: 2) + Point(x: 3, y: 4)), " ", Point(x: 1, y: 2)[1], " ", Point(x: 1, y: 1) == Point(x: 1, y: 1)
echo animals[1] of Dog, " ", animals[0] of Dog
var d = Dog(name: "Fido", tricks: @["sit"])
d.tricks.add "roll"
echo d.tricks.len
