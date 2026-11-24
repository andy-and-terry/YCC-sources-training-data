-- Moebius function: 0 if n has a squared prime factor, else (-1)^k.
mobius :: Int -> Int
mobius n = go n 2 1
  where
    go m p acc
      | p * p > m = if m > 1 then negate acc else acc
      | m `mod` p == 0 =
          let m' = m `div` p
          in if m' `mod` p == 0 then 0 else go m' (p + 1) (negate acc)
      | otherwise = go m (p + 1) acc

main :: IO ()
main = putStrLn (unwords (map (show . mobius) [1 .. 30]))
