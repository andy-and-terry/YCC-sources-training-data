fact :: Integer -> Integer
fact n = product [1 .. n]

comb :: Integer -> Integer -> Integer
comb n k = fact n `div` (fact k * fact (n - k))

lah :: Integer -> Integer -> Integer
lah n k = comb (n - 1) (k - 1) * fact n `div` fact k

main :: IO ()
main = mapM_ (\n -> putStrLn (unwords [show (lah n k) | k <- [1 .. n]])) [1 .. 5]
