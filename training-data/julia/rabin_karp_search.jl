function rabin_karp(text::String, pattern::String)
    base = 256
    modulus = 1_000_000_007
    n, m = length(text), length(pattern)
    matches = Int[]
    m > n && return matches

    text_bytes = Vector{UInt8}(text)
    pattern_bytes = Vector{UInt8}(pattern)

    high_pow = 1
    for _ in 1:(m - 1)
        high_pow = (high_pow * base) % modulus
    end

    pattern_hash = 0
    window_hash = 0
    for i in 1:m
        pattern_hash = (pattern_hash * base + pattern_bytes[i]) % modulus
        window_hash = (window_hash * base + text_bytes[i]) % modulus
    end

    for i in 1:(n - m + 1)
        if window_hash == pattern_hash && text_bytes[i:i + m - 1] == pattern_bytes
            push!(matches, i - 1)
        end
        if i <= n - m
            window_hash = ((window_hash - text_bytes[i] * high_pow) * base + text_bytes[i + m]) % modulus
            window_hash = ((window_hash % modulus) + modulus) % modulus
        end
    end
    return matches
end

println(rabin_karp("abxabcabcaby", "abc"))
