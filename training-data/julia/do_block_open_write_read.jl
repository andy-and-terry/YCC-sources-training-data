path, io = mktemp()
close(io)
open(path, "w") do f
    println(f, "line one")
    println(f, "line two")
end
for l in eachline(path)
    println(uppercase(l))
end
rm(path)
