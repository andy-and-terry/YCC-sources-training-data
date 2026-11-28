function isarmstrong(n::Int)
    ds = digits(n)
    return sum(d^length(ds) for d in ds) == n
end

println(filter(isarmstrong, 1:999)) # [1, ..., 9, 153, 370, 371, 407]
