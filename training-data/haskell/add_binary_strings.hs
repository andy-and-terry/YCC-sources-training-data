addBinary :: String -> String -> String
addBinary a b = go (reverse a) (reverse b) 0 []
  where
    go [] [] 0 acc = acc
    go [] [] c acc = '1' : acc
    go xs ys c acc =
      let (x, xs') = pop xs
          (y, ys') = pop ys
          s = x + y + c
      in go xs' ys' (s `div` 2) (head (show (s `mod` 2)) : acc)
    pop [] = (0, [])
    pop (h : t) = (fromEnum h - fromEnum '0', t)

main :: IO ()
main = putStrLn (addBinary "1010" "1011") -- 10101
