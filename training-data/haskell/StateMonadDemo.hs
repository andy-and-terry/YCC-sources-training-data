newtype State s a = State { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (State g) = State $ \s ->
    let (a, s') = g s
    in (f a, s')

instance Applicative (State s) where
  pure a = State $ \s -> (a, s)
  (State f) <*> (State g) = State $ \s ->
    let (h, s') = f s
        (a, s'') = g s'
    in (h a, s'')

instance Monad (State s) where
  return = pure
  (State g) >>= f = State $ \s ->
    let (a, s') = g s
        State h = f a
    in h s'

get :: State s s
get = State $ \s -> (s, s)

put :: s -> State s ()
put s = State $ \_ -> ((), s)

fresh :: State Int Int
fresh = do
  n <- get
  put (n + 1)
  return n

labelThree :: State Int (Int, Int, Int)
labelThree = do
  a <- fresh
  b <- fresh
  c <- fresh
  return (a, b, c)

main :: IO ()
main = print (runState labelThree 0)
