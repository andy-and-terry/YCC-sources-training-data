import Data.Char (toLower, toUpper)

code :: Char -> Maybe Char
code c
  | c `elem` "bfpv" = Just '1'
  | c `elem` "cgjkqsxz" = Just '2'
  | c `elem` "dt" = Just '3'
  | c == 'l' = Just '4'
  | c `elem` "mn" = Just '5'
  | c == 'r' = Just '6'
  | otherwise = Nothing

soundex :: String -> String
soundex [] = []
soundex (x : xs) = take 4 (toUpper x : go (code lx) (map toLower xs) ++ "000")
  where
    lx = toLower x
    go _ [] = []
    go prev (c : cs)
      | c `elem` "hw" = go prev cs
      | otherwise = case code c of
          Just d | Just d /= prev -> d : go (Just d) cs
          other -> go other cs

main :: IO ()
main = mapM_ (\n -> putStrLn (n ++ " -> " ++ soundex n)) ["Robert", "Rupert", "Tymczak", "Pfister", "Honeyman"]
