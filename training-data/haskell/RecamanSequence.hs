import qualified Data.Set as Set

recaman :: Int -> [Int]
recaman count = go 1 0 (Set.singleton 0) [0]
  where
    go n prev seen acc
      | n >= count = reverse acc
      | otherwise =
          let back = prev - n
              next = if back > 0 && not (Set.member back seen) then back else prev + n
          in go (n + 1) next (Set.insert next seen) (next : acc)

main :: IO ()
main = putStrLn (unwords (map show (recaman 20)))
