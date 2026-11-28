String.metaClass.shout = { -> delegate.toUpperCase() + '!' }
println 'hey'.shout()
Integer.metaClass.double = { -> delegate * 2 }
println 4.double()
