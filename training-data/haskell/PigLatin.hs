import Data.List (isPrefixOf)

isVowel :: Char -> Bool
isVowel = (`elem` "aeiou")

pigWord :: String -> String
pigWord w
  | isVowel (head w) || "xr" `isPrefixOf` w || "yt" `isPrefixOf` w = w ++ "ay"
  | otherwise = go 1
  where
    go i
      | i >= length w = w ++ "ay"
      | w !! i == 'u' && w !! (i - 1) == 'q' = drop (i + 1) w ++ take (i + 1) w ++ "ay"
      | isVowel (w !! i) || w !! i == 'y' = drop i w ++ take i w ++ "ay"
      | otherwise = go (i + 1)

main :: IO ()
main = putStrLn . unwords . map pigWord . words $ "quick fast run apple rhythm square"
