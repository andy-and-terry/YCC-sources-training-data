toRoman :: Int -> String
toRoman 0 = ""
toRoman n = sym ++ toRoman (n - val)
  where
    (val, sym) = head [(v, s) | (v, s) <- table, v <= n]
    table = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
             (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
             (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

main :: IO ()
main = putStrLn (toRoman 1994)
