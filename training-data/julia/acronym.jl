abbreviate(phrase) = join(uppercase(m.match[1]) for m in eachmatch(r"[A-Za-z][A-Za-z']*", phrase))

println(abbreviate("Portable Network Graphics"))
println(abbreviate("Complementary metal-oxide semiconductor"))
