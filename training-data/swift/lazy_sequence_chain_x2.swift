let r = (1...).lazy.filter { $0 % 3 == 0 }.map { $0 * $0 }.prefix(4)
print(Array(r))
