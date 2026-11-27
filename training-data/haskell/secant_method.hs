secant :: (Double -> Double) -> Double -> Double -> Double
secant f = go (50 :: Int)
  where
    go 0 _ x1 = x1
    go n x0 x1
      | f1 == f0 = x1
      | abs (next - x1) < 1e-12 = next
      | otherwise = go (n - 1) x1 next
      where
        (f0, f1) = (f x0, f x1)
        next = x1 - f1 * (x1 - x0) / (f1 - f0)

main :: IO ()
main = print (secant (\x -> x * x - 2) 1 2)
