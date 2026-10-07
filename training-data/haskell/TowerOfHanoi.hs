hanoi :: Int -> String -> String -> String -> [(String, String)]
hanoi 0 _ _ _ = []
hanoi n source auxiliary target =
  hanoi (n - 1) source target auxiliary
    ++ [(source, target)]
    ++ hanoi (n - 1) auxiliary source target

main :: IO ()
main = do
  let moves = hanoi 3 "A" "B" "C"
  mapM_ (\(from, to) -> putStrLn ("move disk from " ++ from ++ " to " ++ to)) moves
  print (length moves)
