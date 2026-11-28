isfactorion(n::Int) = sum(factorial(d) for d in digits(n)) == n

println(filter(isfactorion, 1:49999)) # [1, 2, 145, 40585]
