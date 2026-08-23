function is_palindrome(s::String)
    normalized = filter(isletter, lowercase(s))
    return normalized == reverse(normalized)
end

println(is_palindrome("A man, a plan, a canal: Panama"))
println(is_palindrome("hello"))
