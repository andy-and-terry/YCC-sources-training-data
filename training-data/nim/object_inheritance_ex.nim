type
  Animal = ref object of RootObj
    name: string
  Dog = ref object of Animal

method speak(a: Animal): string {.base.} = a.name & " makes a sound"
method speak(d: Dog): string = d.name & " barks"

let zoo: seq[Animal] = @[Animal(name: "generic"), Dog(name: "rex")]
for a in zoo: echo a.speak()
