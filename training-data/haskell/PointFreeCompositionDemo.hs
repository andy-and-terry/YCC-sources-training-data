import Data.Char (toLower, isAlpha)
import Data.List (sort, group, sortBy)
import Data.Ord (comparing, Down (..))
import Data.Function ((&), on)

countWords :: String -> [(String, Int)]
countWords =
  take 3
    . sortBy (comparing (Down . snd))
    . map (\ws -> (head ws, length ws))
    . group
    . sort
    . words
    . map toLower
    . filter (\c -> isAlpha c || c == ' ')

sumOfSquaresOfOdds :: [Int] -> Int
sumOfSquaresOfOdds = sum . map (^ (2 :: Int)) . filter odd

compose3 :: (c -> d) -> (b -> c) -> (a -> b) -> a -> d
compose3 f g h = f . g . h

main :: IO ()
main = do
  print (countWords "The cat and the hat. The end, and THE start!")
  print (sumOfSquaresOfOdds [1 .. 10])
  print (compose3 show (+ 1) (* 2) (5 :: Int))
  print ([1 .. 10 :: Int] & filter even & map (* 3) & sum)
  print (((==) `on` map toLower) "HeLLo" "hello")
  print (map (uncurry (+)) [(1, 2), (3, 4 :: Int)])
  print ((subtract 3 . (* 2)) (10 :: Int))
  print (flip (-) 1 (10 :: Int))
