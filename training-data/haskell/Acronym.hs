import Data.Char (isAlpha, toUpper)

abbreviate :: String -> String
abbreviate = map (toUpper . head) . filter (not . null) . map (filter isAlpha) . words . map sep
  where
    sep c = if c == '-' || c == '_' then ' ' else c

main :: IO ()
main = do
  putStrLn (abbreviate "Portable Network Graphics")
  putStrLn (abbreviate "Complementary metal-oxide semiconductor")
