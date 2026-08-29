data CircularBuffer a = CircularBuffer { capacity :: Int, items :: [a] }

newBuffer :: Int -> CircularBuffer a
newBuffer cap = CircularBuffer cap []

push :: a -> CircularBuffer a -> CircularBuffer a
push x (CircularBuffer cap xs)
  | length xs < cap = CircularBuffer cap (xs ++ [x])
  | otherwise = CircularBuffer cap (tail xs ++ [x])

main :: IO ()
main = do
  let b = foldl (flip push) (newBuffer 3) [1, 2, 3, 4, 5]
  print (items b)
