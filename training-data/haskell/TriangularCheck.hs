-- n is triangular iff 8n + 1 is a perfect square.
isTriangular :: Int -> Bool
isTriangular n = r * r == s
  where
    s = 8 * n + 1
    r = round (sqrt (fromIntegral s :: Double))

main :: IO ()
main = putStrLn . unwords . map show $ filter isTriangular [0 .. 20]
