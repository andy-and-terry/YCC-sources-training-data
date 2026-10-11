s = "2024-03-15 and 2025-12-01"

println(replace(s, "-" => "/"))
println(replace(s, r"(\d{4})-(\d{2})-(\d{2})" => s"\3.\2.\1"))
println(replace(s, r"\d+" => m -> string(parse(Int, m) + 1)))
println(replace("a.b.c", "." => "", count = 1))

println(match(r"(\d+)-(\d+)", s).captures)
println([m.match for m in eachmatch(r"\d{4}", s)])
println(occursin(r"^\d{4}", s))
println(split("a1b22c333", r"\d+"))
println(replace("hello", 'l' => 'L'))
