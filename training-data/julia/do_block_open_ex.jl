path = tempname()
open(path, "w") do io
    for i in 1:3
        println(io, "line ", i)
    end
end
open(path) do io
    for l in eachline(io)
        println(uppercase(l))
    end
end
rm(path)
