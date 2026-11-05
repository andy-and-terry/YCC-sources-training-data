def user = null
println user?.name
println user?.name ?: 'anonymous'
def m = [a: [b: 'deep']]
println m.a?.b
println m.x?.y
