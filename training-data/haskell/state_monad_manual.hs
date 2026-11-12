newtype State s a = State { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (State g) = State $ \s -> let (a, s') = g s in (f a, s')
instance Applicative (State s) where
  pure a = State $ \s -> (a, s)
  State f <*> State g = State $ \s -> let (h, s1) = f s; (a, s2) = g s1 in (h a, s2)
instance Monad (State s) where
  State g >>= f = State $ \s -> let (a, s1) = g s in runState (f a) s1

tick :: State Int Int
tick = State $ \n -> (n, n + 1)

main :: IO ()
main = print (runState (do a <- tick; b <- tick; c <- tick; return [a, b, c]) 10)
