const CODES = Dict(zip("bfpv", fill('1', 4)))
for (letters, d) in ("cgjkqsxz" => '2', "dt" => '3', "l" => '4', "mn" => '5', "r" => '6')
    for c in letters
        CODES[c] = d
    end
end

function soundex(word::AbstractString)
    w = lowercase(word)
    out = [uppercase(w[1])]
    last = get(CODES, w[1], ' ')
    for ch in w[2:end]
        code = get(CODES, ch, ' ')
        code != ' ' && code != last && push!(out, code)
        ch in "hw" || (last = code)
    end
    rpad(String(out), 4, '0')[1:4]
end

for n in ["Robert", "Rupert", "Tymczak", "Pfister", "Honeyman"]
    println(n, " -> ", soundex(n))
end
