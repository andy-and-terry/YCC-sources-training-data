function bwt(s::String)
    n = length(s)
    rots = sort([s[i:end] * s[1:i-1] for i in 1:n])
    return join(last.(rots))
end

println(bwt("banana\$"))
