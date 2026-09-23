import Text.Printf (printf)

main :: IO ()
main = do
  let name = "Alice"
      score = 92.5 :: Double
  printf "%-10s scored %6.2f%%\n" name score
  printf "%d + %d = %d\n" (2 :: Int) (3 :: Int) (5 :: Int)
  printf "hex: %x, oct: %o\n" (255 :: Int) (8 :: Int)
  let line = printf "%s has %d items" "cart" (3 :: Int) :: String
  putStrLn line
