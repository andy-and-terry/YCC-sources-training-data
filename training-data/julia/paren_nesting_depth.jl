# Maximum nesting depth of parentheses; -1 if the string is unbalanced.
function max_depth(s)
    depth = best = 0
    for ch in s
        if ch == '('
            depth += 1
            best = max(best, depth)
        elseif ch == ')'
            depth -= 1
            depth < 0 && return -1
        end
    end
    return depth == 0 ? best : -1
end

println(max_depth("(1+(2*(3)))"), " ", max_depth("(()"))
