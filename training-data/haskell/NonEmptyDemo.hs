import Data.List.NonEmpty (NonEmpty (..))
import qualified Data.List.NonEmpty as NE

average :: NonEmpty Double -> Double
average xs = sum xs / fromIntegral (NE.length xs)

main :: IO ()
main = do
  let xs = 3 :| [1, 4, 1, 5] :: NonEmpty Int
  print (NE.head xs)
  print (NE.toList xs)
  print (maximum xs)
  print (NE.toList (NE.sort xs))
  print (average (2 :| [4, 6]))
  print (NE.nonEmpty ([] :: [Int]))
  print (fmap NE.toList (NE.nonEmpty [7, 8, 9 :: Int]))
  print (map (\g -> (NE.head g, NE.length g)) (NE.group "aabccc"))
