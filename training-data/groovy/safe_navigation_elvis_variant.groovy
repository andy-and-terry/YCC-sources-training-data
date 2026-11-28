def user = null
println user?.name ?: 'anonymous'
def m = [a: [b: 5]]
println m.a?.b
println m.z?.b ?: 0
