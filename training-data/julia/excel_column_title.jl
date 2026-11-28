function column_title(n)
    chars = Char[]
    while n > 0
        n -= 1
        push!(chars, 'A' + n % 26)
        n ÷= 26
    end
    return String(reverse(chars))
end

println(column_title(28), " ", column_title(701)) # AB ZY
