import Data.List (findIndex)

lisLength :: [Int] -> Int
lisLength = length . foldl step []
  where
    step tails x = case findIndex (>= x) tails of
      Nothing -> tails ++ [x]
      Just i  -> take i tails ++ [x] ++ drop (i + 1) tails

main :: IO ()
main = print (lisLength [10, 9, 2, 5, 3, 7, 101, 18])
