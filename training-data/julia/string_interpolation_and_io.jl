name = "Julia"
version = 1.10
println("Hello, $name v$(version)!")
println("Sum: $(sum(1:10)), squares: $([i^2 for i in 1:4])")

io = IOBuffer()
print(io, "alpha, ")
println(io, "beta")
write(io, "gamma")
println(String(take!(io)))

text = """
first line
second line
third line
"""
for (i, line) in enumerate(eachline(IOBuffer(text)))
    println(i, ": ", uppercase(line))
end

println(repeat("=-", 5))
println(lpad("7", 3, '0'), " ", rpad("ab", 5, '.'), "|")
println(string(1, "+", 2, "=", 1 + 2))
println(split("a,b,c", ","), " ", join(["x", "y"], "-"))
@show length(text)
