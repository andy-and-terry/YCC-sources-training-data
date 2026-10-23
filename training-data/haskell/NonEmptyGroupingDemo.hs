import qualified Data.List.NonEmpty as NE
import Data.List.NonEmpty (NonEmpty (..))
import Data.Function (on)
import Data.Semigroup (sconcat)

-- NonEmpty makes head and maximum total: no empty-list failures.

summarize :: NonEmpty Int -> (Int, Int, Int)
summarize xs = (NE.head xs, maximum xs, length xs)

main :: IO ()
main = do
  let nums = 3 :| [1, 4, 1, 5, 9, 2, 6]
  print (summarize nums)
  print (NE.toList (NE.sort nums))

  -- groupBy on a plain list gives NonEmpty groups
  let groups = NE.groupBy ((==) `on` (`div` 10)) [1, 5, 12, 15, 18, 25, 31, 39]
  mapM_ (print . NE.toList) groups
  print (map NE.head groups)

  -- Semigroups combine without needing a neutral element
  print (sconcat ("ab" :| ["cd", "ef"]))
  print (NE.nonEmpty ([] :: [Int]))
  print (NE.nonEmpty [7, 8])
