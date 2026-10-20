newtype State s a = State { runState :: s -> (a, s) }

instance Functor (State s) where fmap f (State g) = State $ \s -> let (a, s') = g s in (f a, s')
instance Applicative (State s) where
  pure a = State $ \s -> (a, s)
  State f <*> State g = State $ \s -> let (h, s1) = f s; (a, s2) = g s1 in (h a, s2)
instance Monad (State s) where
  State g >>= f = State $ \s -> let (a, s1) = g s in runState (f a) s1

get' :: State s s
get' = State $ \s -> (s, s)
put' :: s -> State s ()
put' s = State $ \_ -> ((), s)

fresh :: State Int String
fresh = do { n <- get'; put' (n + 1); return ("v" ++ show n) }

main :: IO ()
main = print (fst (runState (mapM (const fresh) [1 .. 3 :: Int]) 0))
