const ONES = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
              "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
              "seventeen", "eighteen", "nineteen"]
const TENS = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

function below_thousand(n)
    parts = String[]
    if n >= 100
        push!(parts, ONES[n ÷ 100 + 1], "hundred")
        n %= 100
    end
    if n >= 20
        push!(parts, TENS[n ÷ 10 + 1])
        n %= 10
    end
    n > 0 && push!(parts, ONES[n + 1])
    return join(parts, " ")
end

function to_words(n::Int)
    n == 0 && return "zero"
    out = String[]
    for (scale, name) in ((1_000_000, "million"), (1_000, "thousand"), (1, ""))
        chunk = n ÷ scale
        n %= scale
        chunk > 0 && push!(out, strip(below_thousand(chunk) * " " * name))
    end
    return join(out, " ")
end

for n in (0, 7, 42, 100, 315, 1001, 2_500_019)
    println(n, ": ", to_words(n))
end
