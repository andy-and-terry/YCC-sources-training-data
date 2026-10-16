data Validated
data Unvalidated

newtype Email a = Email String deriving Show

mkEmail :: String -> Email Unvalidated
mkEmail = Email

validate :: Email Unvalidated -> Maybe (Email Validated)
validate (Email s)
  | '@' `elem` s && '.' `elem` dropWhile (/= '@') s = Just (Email s)
  | otherwise = Nothing

send :: Email Validated -> String
send (Email s) = "sending to " ++ s

main :: IO ()
main = do
  mapM_ (putStrLn . maybe "invalid address" send . validate . mkEmail)
    ["a@b.com", "nonsense"]
