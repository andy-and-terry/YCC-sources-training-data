import Control.Arrow (first, second, (&&&), (***), (>>>))
import Data.Char (toUpper)
import Data.Function (on, (&))
import Data.List (group, sort)

frequencies :: String -> [(Char, Int)]
frequencies = sort >>> group >>> map (head &&& length)

main :: IO ()
main = do
  print ((length &&& sum) [1, 2, 3, 4 :: Int])
  print (((+ 1) *** (* 2)) (10 :: Int, 10 :: Int))
  print (first show (1 :: Int, 'x'))
  print (second (map toUpper) (1 :: Int, "abc"))
  print (frequencies "hello world")

  [1 .. 10 :: Int]
    & filter even
    & map (^ (2 :: Int))
    & sum
    & print

  print (((==) `on` (`mod` 10)) 13 (23 :: Int))
  print (map (uncurry (+)) (zip [1, 2, 3] [10, 20, 30 :: Int]))
  print (flip (-) 1 (10 :: Int), curry fst 'a' 'b')
