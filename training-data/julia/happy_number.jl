square_digit_sum(n) = sum(d^2 for d in digits(n))

function is_happy(n::Integer)
    seen = Set{Int}()
    while n != 1 && !(n in seen)
        push!(seen, n)
        n = square_digit_sum(n)
    end
    return n == 1
end

println(filter(is_happy, 1:50))
