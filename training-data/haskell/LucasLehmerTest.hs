lucasLehmer :: Int -> Bool
lucasLehmer 2 = True
lucasLehmer p = final == 0
  where
    m = 2 ^ p - 1
    final = iterate (\s -> (s * s - 2) `mod` m) 4 !! (p - 2)

main :: IO ()
main = putStrLn (unwords (map show (filter lucasLehmer [2, 3, 5, 7, 11, 13, 17, 19])))
