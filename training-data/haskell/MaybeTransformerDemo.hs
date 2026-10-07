newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance Monad m => Functor (MaybeT m) where
  fmap f (MaybeT m) = MaybeT (fmap (fmap f) m)

instance Monad m => Applicative (MaybeT m) where
  pure = MaybeT . return . Just
  MaybeT mf <*> MaybeT mx = MaybeT $ do
    f <- mf
    case f of
      Nothing -> return Nothing
      Just g -> fmap (fmap g) mx

instance Monad m => Monad (MaybeT m) where
  MaybeT m >>= k = MaybeT $ do
    v <- m
    case v of
      Nothing -> return Nothing
      Just a -> runMaybeT (k a)

lift' :: Monad m => m a -> MaybeT m a
lift' = MaybeT . fmap Just

failT :: Monad m => MaybeT m a
failT = MaybeT (return Nothing)

safeDiv :: Int -> Int -> MaybeT IO Int
safeDiv _ 0 = lift' (putStrLn "div by zero") >> failT
safeDiv a b = lift' (putStrLn "dividing") >> return (a `div` b)

main :: IO ()
main = do
  runMaybeT (safeDiv 100 5 >>= \x -> safeDiv x 2) >>= print
  runMaybeT (safeDiv 1 0 >>= \x -> safeDiv x 2) >>= print
