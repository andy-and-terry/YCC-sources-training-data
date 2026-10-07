type
  Animal = ref object of RootObj
    name: string
  Dog = ref object of Animal
  Cat = ref object of Animal

method speak(a: Animal): string {.base.} = "..."
method speak(d: Dog): string = d.name & " says woof"
method speak(c: Cat): string = c.name & " says meow"

let zoo: seq[Animal] = @[Dog(name: "Rex"), Cat(name: "Tom"), Animal(name: "Generic")]
for a in zoo:
  echo a.speak()
echo zoo[0] of Dog
