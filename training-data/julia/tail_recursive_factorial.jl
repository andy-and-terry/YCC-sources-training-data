function factorial_iter(n::Int)
    result = 1
    for i in 1:n
        result *= i
    end
    return result
end

println(factorial_iter(10))
