chebyshev :: [Int] -> [Int] -> Int
chebyshev a b = maximum (zipWith (\x y -> abs (x - y)) a b)

main :: IO ()
main = print (chebyshev [1, 2] [4, 6])
