function safe_divide(a, b)
    try
        return a / b
    catch e
        return "undefined: $e"
    end
end

println(safe_divide(10, 2))

function checked_divide(a, b)
    if b == 0
        throw(DomainError(b, "cannot divide by zero"))
    end
    return a / b
end

try
    println(checked_divide(5, 0))
catch e
    println("error: $(e.msg)")
end
