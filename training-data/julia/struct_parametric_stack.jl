struct Pair{A,B}
    first::A
    second::B
end
swap(p::Pair) = Pair(p.second, p.first)
println(swap(Pair(1, "x")))
