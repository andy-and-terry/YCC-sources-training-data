data Err = TooShort | NoDigit deriving Show

validate :: String -> Either Err String
validate s
  | length s < 6 = Left TooShort
  | not (any (`elem` ['0' .. '9']) s) = Left NoDigit
  | otherwise = Right s

main :: IO ()
main = mapM_ (print . validate) ["abc", "abcdefg", "abcde1g"]
