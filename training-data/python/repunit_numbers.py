# Repunits: R_n = (10^n - 1) / 9 = 11...1; R_n is divisible by R_m when m divides n.
repunits = [(10 ** n - 1) // 9 for n in range(1, 9)]
print(*repunits)
print([r for r in repunits if r % 3 == 0])
