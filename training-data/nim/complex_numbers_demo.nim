import std/complex
import std/math

let a = complex(3.0, 4.0)
let b = complex(1.0, -2.0)

echo "a     = ", a
echo "b     = ", b
echo "a + b = ", a + b
echo "a * b = ", a * b
echo "a / b = ", a / b
echo "conj  = ", conjugate(a)
echo "|a|   = ", abs(a)
echo "phase = ", phase(a).formatFloat(ffDecimal, 4)

# Euler's identity: e^(i*pi) + 1 is (almost) zero
let euler = exp(complex(0.0, PI)) + complex(1.0, 0.0)
echo "e^(i*pi) + 1 ~ ", euler.re.round(10), " + ", euler.im.round(10), "i"

# square root of a negative real stays in the complex plane
echo "sqrt(-4) = ", sqrt(complex(-4.0, 0.0))
