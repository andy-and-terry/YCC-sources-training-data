rho :: Integer -> Integer
rho n
  | even n = 2
  | otherwise = go 2 2
  where
    f v = (v * v + 1) `mod` n
    go x y =
      let x' = f x
          y' = f (f y)
          d = gcd (abs (x' - y')) n
      in if d == 1 then go x' y' else d

main :: IO ()
main = do
  let n = 8051
      p = rho n
  putStrLn (show n ++ " = " ++ show p ++ " * " ++ show (n `div` p))
