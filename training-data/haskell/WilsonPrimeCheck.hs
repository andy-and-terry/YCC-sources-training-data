-- Wilson's theorem primality test.
wilson :: Int -> Bool
wilson n = n >= 2 && foldl (\f i -> f * i `mod` n) 1 [2 .. n - 1] == n - 1

main :: IO ()
main = print (filter wilson [2 .. 19])
