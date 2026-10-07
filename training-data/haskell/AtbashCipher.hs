import Data.Char (isAlphaNum, isAsciiLower, toLower, chr, ord)
import Data.List (unfoldr)

decode :: String -> String
decode = map flipChar . filter isAlphaNum . map toLower
  where
    flipChar c
      | isAsciiLower c = chr (ord 'z' - (ord c - ord 'a'))
      | otherwise = c

encode :: String -> String
encode = unwords . chunks . decode
  where
    chunks = unfoldr (\s -> if null s then Nothing else Just (splitAt 5 s))

main :: IO ()
main = do
  let e = encode "The quick brown fox"
  putStrLn (e ++ " -> " ++ decode e)
