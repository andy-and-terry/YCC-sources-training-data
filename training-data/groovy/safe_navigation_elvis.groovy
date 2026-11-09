def user = null
println user?.name
println user?.name ?: 'anonymous'
def m = [a: [b: 5]]
println m.a?.b
