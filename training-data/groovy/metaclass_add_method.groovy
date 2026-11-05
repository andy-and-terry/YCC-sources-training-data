String.metaClass.shout = { -> delegate.toUpperCase() + '!' }
println 'hey'.shout()
Integer.metaClass.double = { -> delegate * 2 }
println 21.double()
