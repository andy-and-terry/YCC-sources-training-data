# Inspect and reinterpret raw bits of numbers without changing the data.
x = 1.0f0
bits = reinterpret(UInt32, x)
println(string(bits, base = 16))
println(bitstring(x))

# Decompose an IEEE-754 single into sign, exponent, and mantissa.
sign_bit = bits >> 31
exponent = Int((bits >> 23) & 0xff) - 127
mantissa = bits & 0x7fffff
println((sign_bit, exponent, mantissa))

# Round trip back to a float.
println(reinterpret(Float32, 0x40490fdb))

# Signed vs unsigned view of the same byte.
b = 0xff
println(reinterpret(Int8, b))
println(reinterpret(UInt8, Int8(-1)))

# View an array of bytes as a different element type (no copy).
bytes = UInt8[0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00]
ints = reinterpret(Int32, bytes)
println(collect(ints))

# Next representable float using the integer representation.
y = 1.0
next = reinterpret(Float64, reinterpret(UInt64, y) + 1)
println(next == nextfloat(y))
println(next - y == eps(y))
