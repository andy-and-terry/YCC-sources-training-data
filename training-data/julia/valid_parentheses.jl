function is_valid(s::String)
    stack = Char[]
    pairs = Dict(')' => '(', ']' => '[', '}' => '{')
    for c in s
        if c in ('(', '[', '{')
            push!(stack, c)
        elseif c in (')', ']', '}')
            if isempty(stack) || pop!(stack) != pairs[c]
                return false
            end
        end
    end
    return isempty(stack)
end

println(is_valid("{[()]}"))
println(is_valid("{[(])}"))
