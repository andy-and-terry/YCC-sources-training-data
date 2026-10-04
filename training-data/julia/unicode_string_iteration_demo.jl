s = "héllo, 世界 🌍"

println(length(s), " ", sizeof(s))
println(collect(s))

for (i, c) in enumerate(s)
    if !isascii(c)
        println(i, ": ", c, " U+", string(UInt32(c), base = 16, pad = 4))
    end
end

println(collect(eachindex(s)))
println(s[1:1], " ", s[nextind(s, 1)])
println(isvalid(s, 3), " ", isvalid(s, 2))

println(uppercase("straße"), " ", lowercase("ÀÉÎ"))
println(reverse("añb"))
println(codeunits("é"))
println(Char(0x263A), " ", Int('A'), " ", 'a' + 2)

println(textwidth("世界"), " ", textwidth("ab"))
println(first(s, 5), " ", last(s, 2))
println(join(reverse(split("a b c")), " "))
println(count(isletter, s), " ", count(isspace, s))
println(Base.Unicode.normalize("é", :NFD) == "é")
println(filter(isuppercase, "Hello World"))
