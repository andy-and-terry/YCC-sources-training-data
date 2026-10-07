import Text.Printf

main :: IO ()
main = do
  printf "%d items\n" (3 :: Int)
  printf "%5.2f|%-8s|%08.3f\n" (3.14159 :: Double) "left" (2.5 :: Double)
  printf "%x %o %b %c\n" (255 :: Int) (8 :: Int) (5 :: Int) 'z'
  let s = printf "%s is %d years" "Ann" (30 :: Int) :: String
  putStrLn s
  mapM_ (\(n, v) -> printf "%-6s %6.1f\n" n v) [("a", 1.5 :: Double), ("bcd", 22.25)]
