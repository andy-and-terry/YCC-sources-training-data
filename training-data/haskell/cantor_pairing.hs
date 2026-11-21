-- Cantor pairing function and its inverse.
pair :: Int -> Int -> Int
pair x y = (x + y) * (x + y + 1) `div` 2 + y

unpair :: Int -> (Int, Int)
unpair z = (w - y, y)
  where
    w = (floor (sqrt (fromIntegral (8 * z + 1) :: Double)) - 1) `div` 2
    y = z - w * (w + 1) `div` 2

main :: IO ()
main = do
  print (pair 3 4)
  let (x, y) = unpair 32
  putStrLn (show x ++ " " ++ show y)
