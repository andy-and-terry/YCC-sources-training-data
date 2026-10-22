polygonal :: Int -> Int -> Int
polygonal sides n = ((sides - 2) * n * n - (sides - 4) * n) `div` 2

main :: IO ()
main = mapM_ report [("Triangular", 3), ("Pentagonal", 5), ("Hexagonal", 6)]
  where
    report (name, sides) =
      putStrLn (name ++ ": " ++ unwords (map (show . polygonal sides) [1 .. 10]))
