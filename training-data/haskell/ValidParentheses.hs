isValid :: String -> Bool
isValid = go []
  where
    go [] [] = True
    go _ [] = False
    go stack (c:cs)
      | c `elem` "([{" = go (c : stack) cs
      | otherwise = case stack of
          (top:rest) | matches top c -> go rest cs
          _ -> False
    matches '(' ')' = True
    matches '[' ']' = True
    matches '{' '}' = True
    matches _ _ = False

main :: IO ()
main = print (isValid "([{}])", isValid "([)]")
