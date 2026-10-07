factorize :: Int -> [Int]
factorize n = go n 2
  where
    go 1 _ = []
    go m p
      | p * p > m = [m]
      | m `mod` p == 0 = p : go (m `div` p) p
      | otherwise = go m (p + 1)

main :: IO ()
main = do
  print (factorize 360)
  print (factorize 97)
  print (factorize 600851475143)
