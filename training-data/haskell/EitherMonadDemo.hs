import Data.Char (isAlphaNum)

data ValidationError = TooShort | TooLong | InvalidChar Char deriving Show

validateLength :: String -> Either ValidationError String
validateLength s
  | length s < 3 = Left TooShort
  | length s > 12 = Left TooLong
  | otherwise = Right s

validateChars :: String -> Either ValidationError String
validateChars s = case filter (not . isAlphaNum) s of
  (c : _) -> Left (InvalidChar c)
  [] -> Right s

validateUsername :: String -> Either ValidationError String
validateUsername s = validateLength s >>= validateChars

main :: IO ()
main = do
  mapM_ (print . validateUsername) ["ab", "validName", "way_too_long_name_here", "bad!name"]
