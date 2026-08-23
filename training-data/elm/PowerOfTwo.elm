module PowerOfTwo exposing (isPowerOfTwo)

import Bitwise


isPowerOfTwo : Int -> Bool
isPowerOfTwo n =
    n > 0 && Bitwise.and n (n - 1) == 0
