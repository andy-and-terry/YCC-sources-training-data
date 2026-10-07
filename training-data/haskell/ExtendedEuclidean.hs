-- Returns (g, x, y) such that a*x + b*y = g = gcd(a, b).
extendedGCD :: Int -> Int -> (Int, Int, Int)
extendedGCD a 0 = (a, 1, 0)
extendedGCD a b =
  let (g, x1, y1) = extendedGCD b (a `mod` b)
  in (g, y1, x1 - (a `div` b) * y1)

main :: IO ()
main = do
  let (a, b) = (35, 15)
      (g, x, y) = extendedGCD a b
  putStrLn ("gcd(" ++ show a ++ ", " ++ show b ++ ") = " ++ show g)
  putStrLn (show a ++ "*" ++ show x ++ " + " ++ show b ++ "*" ++ show y
             ++ " = " ++ show (a * x + b * y))
