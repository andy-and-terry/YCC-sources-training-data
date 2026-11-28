def reverse_bits(value, width=8):
    result = 0
    for _ in range(width):
        result = (result << 1) | (value & 1)
        value >>= 1
    return result


for v in (1, 6, 13, 128):
    print(v, reverse_bits(v))  # 1->128, 6->96, 13->176, 128->1
