newtype Stack a = Stack [a]

push :: a -> Stack a -> Stack a
push x (Stack xs) = Stack (x : xs)

pop :: Stack a -> (Maybe a, Stack a)
pop (Stack []) = (Nothing, Stack [])
pop (Stack (x:xs)) = (Just x, Stack xs)

main :: IO ()
main = do
  let s0 = Stack []
      s1 = push 3 (push 2 (push 1 s0))
      (top, _) = pop s1
  print top
