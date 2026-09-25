import Data.Char (toLower)

isPangram :: String -> Bool
isPangram s = all (`elem` map toLower s) ['a' .. 'z']

main :: IO ()
main = do
  print (isPangram "The quick brown fox jumps over the lazy dog")
  print (isPangram "Hello world")
