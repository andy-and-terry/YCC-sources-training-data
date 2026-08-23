macro square(x)
    return :($(esc(x)) * $(esc(x)))
end

y = 5
println(@square y)
