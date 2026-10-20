def user = null
println user?.name ?: 'anonymous'
def m = [a: 1]
println m.b?.toString() ?: 'none'
