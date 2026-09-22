newtype State s a = State { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (State g) = State (\s -> let (a, s') = g s in (f a, s'))

instance Applicative (State s) where
  pure a = State (\s -> (a, s))
  (State f) <*> (State g) = State (\s ->
    let (h, s') = f s
        (a, s'') = g s'
    in (h a, s''))

instance Monad (State s) where
  return = pure
  (State g) >>= f = State (\s ->
    let (a, s') = g s
    in runState (f a) s')

get :: State s s
get = State (\s -> (s, s))

put :: s -> State s ()
put s = State (\_ -> ((), s))

modify :: (s -> s) -> State s ()
modify f = State (\s -> ((), f s))

push :: Int -> State [Int] ()
push x = modify (x :)

pop :: State [Int] Int
pop = do
  stack <- get
  let (x : xs) = stack
  put xs
  return x

stackOps :: State [Int] Int
stackOps = do
  push 1
  push 2
  push 3
  a <- pop
  b <- pop
  return (a + b)

main :: IO ()
main = print (runState stackOps [])
