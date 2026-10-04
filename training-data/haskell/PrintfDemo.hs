import Text.Printf

main :: IO ()
main = do
  printf "Integer: %d, padded: %5d, zero: %05d\n" (42 :: Int) (42 :: Int) (42 :: Int)
  printf "Float: %.2f, wide: %8.3f, sci: %e\n" (3.14159 :: Double) (2.71828 :: Double) (12345.678 :: Double)
  printf "String: %s, padded: %-8s|, right: %8s|\n" "hi" "left" "right"
  printf "Hex: %x, upper: %X, octal: %o, char: %c\n" (255 :: Int) (255 :: Int) (8 :: Int) 'z'

  let line = printf "%s is %d years old" "Ada" (36 :: Int) :: String
  putStrLn line

  let rows = [("apple", 3, 0.5), ("banana", 12, 0.25), ("kiwi", 7, 1.125)] :: [(String, Int, Double)]
  mapM_ (\(n, q, p) -> printf "%-8s %3d x %5.2f = %6.2f\n" n q p (fromIntegral q * p)) rows
