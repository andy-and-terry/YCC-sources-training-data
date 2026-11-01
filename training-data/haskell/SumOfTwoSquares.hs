-- Positive n expressible as a*a + b*b with a, b >= 0.
representable :: Int -> Bool
representable n = or [a * a + b * b == n | a <- [0 .. r], b <- [a .. r]]
  where r = floor (sqrt (fromIntegral n :: Double))

main :: IO ()
main = putStrLn . unwords . map show $ filter representable [1 .. 30]
