swap_case(s::AbstractString) = join(isuppercase(c) ? lowercase(c) : uppercase(c) for c in s)

println(swap_case("Hello World 42"))
