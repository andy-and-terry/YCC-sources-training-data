open(tempname(), "w") do io
    println(io, "line one")
    println(io, "line two")
end
println("written")
