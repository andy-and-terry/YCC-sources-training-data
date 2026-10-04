import Data.Char (isAlpha, toLower)
import Data.List (group, sort, sortOn)
import Data.Ord (Down (..))

countWords :: String -> Int
countWords = length . words

normalize :: String -> String
normalize = map toLower . filter isAlpha

topN :: Int -> String -> [(String, Int)]
topN n = take n . sortOn (Down . snd) . map (\ws -> (head ws, length ws)) . group . sort . words . map toLower . filter (\c -> isAlpha c || c == ' ')

sumOfSquaresOfOdds :: [Int] -> Int
sumOfSquaresOfOdds = sum . map (^ 2) . filter odd

compose3 :: (c -> d) -> (b -> c) -> (a -> b) -> a -> d
compose3 f g h = f . g . h

applyTwice :: (a -> a) -> a -> a
applyTwice f = f . f

main :: IO ()
main = do
  print (countWords "the quick brown fox")
  putStrLn (normalize "Hello, World! 123")
  print (topN 2 "the cat and the hat and the bat")
  print (sumOfSquaresOfOdds [1 .. 10])
  print (compose3 (+ 1) (* 2) (subtract 3) 10)
  print (applyTwice (map (* 2)) [1, 2, 3])
  print ((fmap . fmap) (+ 1) [Just 1, Nothing, Just 3])
  print (zipWith ($) [(+ 1), (* 2), negate] [10, 20, 30])
