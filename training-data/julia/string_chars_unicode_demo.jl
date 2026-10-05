s = "héllo wörld"

println(length(s), " ", sizeof(s))
println(uppercase(s), " ", titlecase(s))
println(collect(s)[2], " ", codepoint(s[1]))
println(reverse(s))
println(isletter('é'), " ", isdigit('7'), " ", isspace(' '))

for (i, c) in enumerate("añb")
    println(i, " ", c, " ", Int(c))
end

println(first(s, 3), " ", last(s, 3))
println(startswith(s, "hé"), " ", occursin("wör", s), " ", findfirst('w', s))
println(replace(s, "l" => "L"; count = 2))
println(join(sort(unique(collect("mississippi")))))
println(Char(65), " ", 'a' + 1, " ", string('a':'e'...))
println(parse(Int, "123") + 1, " ", tryparse(Int, "x"))
