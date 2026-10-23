import Data.List.NonEmpty (NonEmpty (..))
import qualified Data.List.NonEmpty as NE
import Data.Semigroup (Max (..), Min (..), sconcat)

-- A NonEmpty list guarantees at least one element, so head and maximum are total.
average :: NonEmpty Double -> Double
average xs = sum xs / fromIntegral (NE.length xs)

safeSummary :: [Int] -> String
safeSummary xs = case NE.nonEmpty xs of
  Nothing -> "empty input"
  Just ne -> "max=" ++ show (maximum ne) ++ " min=" ++ show (minimum ne)

main :: IO ()
main = do
  let xs = 3 :| [1, 4, 1, 5] :: NonEmpty Int
  print (NE.head xs, NE.last xs, NE.length xs)
  print (NE.toList (NE.sort xs))
  print (NE.toList (NE.map (* 2) xs))
  print (NE.toList (NE.reverse xs))
  print (average (2 :| [4, 6]))
  print (map (\g -> (NE.head g, NE.length g)) (NE.group "aabccc"))
  print (getMax (sconcat (fmap Max xs)), getMin (sconcat (fmap Min xs)))
  putStrLn (safeSummary [])
  putStrLn (safeSummary [7, 2, 9])
  print (NE.toList (NE.zip xs ('a' :| "bcde")))
