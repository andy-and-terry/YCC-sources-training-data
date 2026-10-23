import qualified Data.Map as Map

vanEck :: Int -> [Int]
vanEck count = take count (go 0 0 Map.empty)
  where
    go n current seen = current : go (n + 1) next (Map.insert current n seen)
      where
        next = maybe 0 (n -) (Map.lookup current seen)

main :: IO ()
main = putStrLn (unwords (map show (vanEck 20)))
