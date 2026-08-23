function my_power(base::Int, exp::Int)
    if exp == 0
        return 1
    elseif exp % 2 == 0
        half = my_power(base, div(exp, 2))
        return half * half
    else
        return base * my_power(base, exp - 1)
    end
end

println(my_power(2, 10))
println(my_power(3, 5))
