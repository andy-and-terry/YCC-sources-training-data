function alternating_digit_sum(n)
    ds = digits(n)  # least-significant digit first
    sum(d * (-1)^(i - 1) for (i, d) in enumerate(ds))
end

for n in (1234, 99999, 1000)
    println(n, " ", alternating_digit_sum(n))
end
