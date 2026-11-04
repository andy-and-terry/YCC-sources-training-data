ordinal :: Int -> String
ordinal n = show n ++ suffix
  where
    suffix
      | n `mod` 100 `elem` [11, 12, 13] = "th"
      | n `mod` 10 == 1 = "st"
      | n `mod` 10 == 2 = "nd"
      | n `mod` 10 == 3 = "rd"
      | otherwise = "th"

main :: IO ()
main = putStrLn (unwords (map ordinal [1, 2, 3, 4, 11, 12, 13, 21, 101, 111]))
