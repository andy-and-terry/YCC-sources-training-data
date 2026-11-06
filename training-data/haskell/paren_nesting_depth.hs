-- Maximum nesting depth of parentheses; -1 if the string is unbalanced.
maxDepth :: String -> Int
maxDepth = go 0 0
  where
    go depth best [] = if depth == 0 then best else -1
    go depth best (c : cs)
      | c == '(' = go (depth + 1) (max best (depth + 1)) cs
      | c == ')' = if depth == 0 then -1 else go (depth - 1) best cs
      | otherwise = go depth best cs

main :: IO ()
main = putStrLn (show (maxDepth "(1+(2*(3)))") ++ " " ++ show (maxDepth "(()"))
