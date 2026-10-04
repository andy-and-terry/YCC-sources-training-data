import Text.Printf (printf)

data Item = Item String Int Double

main :: IO ()
main = do
  printf "%d items\n" (3 :: Int)
  printf "%5.2f|%-8s|%08.3f\n" (3.14159 :: Double) "ab" (2.5 :: Double)
  printf "%x %o %c %s\n" (255 :: Int) (8 :: Int) 'z' (show [1, 2 :: Int])
  let items = [Item "pen" 3 1.5, Item "book" 1 12.0]
  mapM_ (\(Item n q p) -> printf "%-6s x%2d @ %6.2f\n" n q p) items
  let s = printf "%03d-%s" (7 :: Int) "id" :: String
  putStrLn s
