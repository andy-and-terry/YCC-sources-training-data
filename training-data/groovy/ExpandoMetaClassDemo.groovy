class Greeting {
    String message = "Hi"
}

Greeting.metaClass.shout = { -> delegate.message.toUpperCase() + "!!!" }
Greeting.metaClass.static.create = { String msg -> new Greeting(message: msg) }

def g = new Greeting()
println g.shout()

def g2 = Greeting.create("howdy")
println g2.shout()

def dyn = new Expando()
dyn.name = "Rex"
dyn.bark = { -> "${dyn.name} says woof" }
println dyn.bark()
