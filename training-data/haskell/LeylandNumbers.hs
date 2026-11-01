-- Leyland numbers: x^y + y^x for x >= y >= 2.
leyland :: Integer -> Integer -> Integer
leyland x y = x ^ y + y ^ x

main :: IO ()
main = putStrLn . unwords . map show $ [leyland x y | x <- [2 .. 4], y <- [2 .. x]]
