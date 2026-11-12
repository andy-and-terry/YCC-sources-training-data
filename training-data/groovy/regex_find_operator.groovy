def m = ('order-123' =~ /(\w+)-(\d+)/)
if (m) println "${m[0][1]} ${m[0][2]}"
println 'a1b22'.findAll(/\d+/)
println ('x' ==~ /[a-z]/)
