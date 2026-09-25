import Data.List (isInfixOf)

isRotation :: Eq a => [a] -> [a] -> Bool
isRotation a b = length a == length b && b `isInfixOf` (a ++ a)

main :: IO ()
main = do
  print (isRotation "waterbottle" "erbottlewat")
  print (isRotation "abc" "acb")
