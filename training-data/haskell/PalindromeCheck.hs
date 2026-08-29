import Data.Char (toLower, isAlphaNum)

isPalindrome :: String -> Bool
isPalindrome s = cleaned == reverse cleaned
  where cleaned = map toLower (filter isAlphaNum s)

main :: IO ()
main = print (isPalindrome "A man, a plan, a canal: Panama")
