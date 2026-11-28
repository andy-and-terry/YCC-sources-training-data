def plus_one(digits):
    digits = digits[:]
    for i in range(len(digits) - 1, -1, -1):
        if digits[i] < 9:
            digits[i] += 1
            return digits
        digits[i] = 0
    return [1] + digits


print(plus_one([1, 2, 9]))  # [1, 3, 0]
print(plus_one([9, 9]))  # [1, 0, 0]
