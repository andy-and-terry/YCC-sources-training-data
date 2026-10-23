nums = [1, 2, 3, 4]

squares = map(nums) do x
    x^2
end
println(squares)

evens = filter(nums) do x
    x % 2 == 0
end
println(evens)

open(tempname(), "w") do io
    println(io, "written inside do block")
end
