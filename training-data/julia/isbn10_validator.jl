function is_valid_isbn10(isbn::AbstractString)
    s = replace(isbn, "-" => "")
    occursin(r"^\d{9}[\dX]$", s) || return false
    total = sum((c == 'X' ? 10 : c - '0') * (11 - i) for (i, c) in enumerate(s))
    return total % 11 == 0
end

for s in ("3-598-21508-8", "3-598-21507-X", "3-598-21508-9")
    println(s, " ", is_valid_isbn10(s))
end
