function run_length_encode(s::String)
    isempty(s) && return ""
    result = IOBuffer()
    count = 1
    chars = collect(s)
    for i in 2:length(chars)
        if chars[i] == chars[i - 1]
            count += 1
        else
            print(result, chars[i - 1], count)
            count = 1
        end
    end
    print(result, chars[end], count)
    return String(take!(result))
end

println(run_length_encode("aaabbbcccd"))
println(run_length_encode("wwwwaaadexxxxxx"))
