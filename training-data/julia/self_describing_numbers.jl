function is_self_describing(n)
    ds = reverse(digits(n))
    all(count(==(i - 1), ds) == ds[i] for i in eachindex(ds))
end

for n in (1210, 2020, 21200, 1211)
    println(n, " ", is_self_describing(n))
end
