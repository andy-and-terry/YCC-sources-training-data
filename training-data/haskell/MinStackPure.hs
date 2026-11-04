newtype MinStack a = MinStack [(a, a)]

emptyStack :: MinStack a
emptyStack = MinStack []

push :: Ord a => a -> MinStack a -> MinStack a
push x (MinStack []) = MinStack [(x, x)]
push x (MinStack s@((_, m) : _)) = MinStack ((x, min x m) : s)

pop :: MinStack a -> MinStack a
pop (MinStack (_ : s)) = MinStack s
pop st = st

current :: MinStack a -> a
current (MinStack ((_, m) : _)) = m
current _ = error "empty stack"

main :: IO ()
main = do
  let s = foldl (flip push) emptyStack [5, 3, 7, 2 :: Int]
  print (current s)
  print (current (pop s))
