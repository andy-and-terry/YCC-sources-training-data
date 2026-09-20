import Control.Monad (ap)

-- A hand-rolled StateT: stacks mutable-looking state on top of an arbitrary
-- underlying monad m, unlike this folder's existing State/Reader/Writer
-- demos, which each wrap plain values instead of another monad.
newtype StateT s m a = StateT {runStateT :: s -> m (a, s)}

instance (Monad m) => Functor (StateT s m) where
  fmap f (StateT g) = StateT $ \s -> do
    (a, s') <- g s
    return (f a, s')

instance (Monad m) => Applicative (StateT s m) where
  pure a = StateT $ \s -> return (a, s)
  (<*>) = ap

instance (Monad m) => Monad (StateT s m) where
  return = pure
  (StateT g) >>= f = StateT $ \s -> do
    (a, s') <- g s
    runStateT (f a) s'

get :: (Monad m) => StateT s m s
get = StateT $ \s -> return (s, s)

put :: (Monad m) => s -> StateT s m ()
put s = StateT $ \_ -> return ((), s)

-- Lift an action from the underlying monad into StateT.
liftInner :: (Monad m) => m a -> StateT s m a
liftInner action = StateT $ \s -> do
  a <- action
  return (a, s)

-- A tiny counter that logs to IO (the underlying monad) on every tick while
-- threading an Int through StateT, showing state and effects combined.
tick :: StateT Int IO ()
tick = do
  n <- get
  liftInner (putStrLn ("count is now " ++ show n))
  put (n + 1)

program :: StateT Int IO Int
program = do
  tick
  tick
  tick
  get

main :: IO ()
main = do
  (result, finalState) <- runStateT program 0
  putStrLn ("final result: " ++ show result)
  putStrLn ("final state: " ++ show finalState)
