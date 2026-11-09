type
  Animal = ref object of RootObj
    name: string
  Dog = ref object of Animal

method speak(a: Animal): string {.base.} = a.name & " makes a sound"
method speak(d: Dog): string = d.name & " barks"

let a: Animal = Dog(name: "Rex")
echo a.speak()
