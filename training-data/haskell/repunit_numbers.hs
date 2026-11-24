-- Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
repunits :: [Integer]
repunits = tail (iterate (\r -> r * 10 + 1) 0)

main :: IO ()
main = mapM_ showRow (take 8 repunits)
  where
    showRow r = putStrLn (show r ++ (if r `mod` 3 == 0 then "  (divisible by 3)" else ""))
