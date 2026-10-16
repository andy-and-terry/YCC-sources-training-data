buf = IOBuffer()
for i in 1:5
    print(buf, i, i < 5 ? "," : "")
end
println(String(take!(buf)))

io = IOBuffer()
println(io, "line one")
println(io, "line two")
write(io, "tail")
text = String(take!(io))
println(split(text, '\n'))

out = sprint() do io
    for w in ["a", "b", "c"]
        print(io, uppercase(w))
    end
end
println(out)

println(join(["x", "y", "z"], ", ", " and "))
println(repeat("ab", 3))
