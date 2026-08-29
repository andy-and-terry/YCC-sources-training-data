import Data.List (insert)

heapSort :: Ord a => [a] -> [a]
heapSort = foldr insert []

main :: IO ()
main = print (heapSort [5, 3, 8, 1, 9, 2])
