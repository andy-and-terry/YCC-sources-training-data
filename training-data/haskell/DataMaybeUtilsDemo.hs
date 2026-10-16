import Data.Maybe

main :: IO ()
main = do
  print (mapMaybe (\x -> if x > 2 then Just (x * x) else Nothing) [1 .. 5])
  print (catMaybes [Just 1, Nothing, Just 3])
  print (fromMaybe 0 Nothing, fromMaybe 0 (Just 9))
  print (maybe "none" show (Just 42))
  print (listToMaybe [7, 8, 9], listToMaybe ([] :: [Int]))
  print (maybeToList (Just 'x'), maybeToList (Nothing :: Maybe Char))
  print (isJust (Just 1), isNothing (Just 1))
  print (fromJust (lookup 2 [(1, "a"), (2, "b")]))
  print (Just 3 >>= \x -> if x > 2 then Just (x + 1) else Nothing)
