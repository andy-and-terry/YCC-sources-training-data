# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
let r = 0
    for n in 1:8
        r = r * 10 + 1
        println(r, r % 3 == 0 ? "  (divisible by 3)" : "")
    end
end
