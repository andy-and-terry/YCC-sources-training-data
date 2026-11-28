escape :: Double -> Double -> Int
escape cr ci = go 0 0 0
  where
    go zr zi n
      | n == 30 || zr * zr + zi * zi >= 4 = n
      | otherwise = go (zr * zr - zi * zi + cr) (2 * zr * zi + ci) (n + 1)

main :: IO ()
main = mapM_ putStrLn
  [ [ if escape (fromIntegral x / 20) (fromIntegral y / 5) == 30 then '#' else '.' | x <- [-40 .. 12 :: Int] ]
  | y <- [-5 .. 5 :: Int] ]
