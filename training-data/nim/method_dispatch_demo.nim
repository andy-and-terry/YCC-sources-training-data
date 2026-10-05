type
  Animal = ref object of RootObj
    name: string
  Dog = ref object of Animal
  Cat = ref object of Animal

method speak(a: Animal): string {.base.} = a.name & " makes a sound"
method speak(d: Dog): string = d.name & " says woof"
method speak(c: Cat): string = c.name & " says meow"

let zoo: seq[Animal] = @[Animal(name: "Generic"), Dog(name: "Rex"), Cat(name: "Tom")]
for a in zoo:
  echo a.speak()
echo zoo[1] of Dog, " ", zoo[1] of Cat
