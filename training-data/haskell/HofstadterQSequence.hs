hofstadterQ :: [Int]
hofstadterQ = 1 : 1 : map q [3 ..]
  where
    at i = hofstadterQ !! (i - 1)
    q n = at (n - at (n - 1)) + at (n - at (n - 2))

main :: IO ()
main = putStrLn (unwords (map show (take 20 hofstadterQ)))
