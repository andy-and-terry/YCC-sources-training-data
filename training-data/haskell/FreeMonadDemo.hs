{-# LANGUAGE DeriveFunctor #-}

data Free f a = Pure a | Free (f (Free f a))

instance Functor f => Functor (Free f) where
  fmap g (Pure a) = Pure (g a)
  fmap g (Free fa) = Free (fmap (fmap g) fa)

instance Functor f => Applicative (Free f) where
  pure = Pure
  Pure g <*> x = fmap g x
  Free fg <*> x = Free (fmap (<*> x) fg)

instance Functor f => Monad (Free f) where
  Pure a >>= k = k a
  Free fa >>= k = Free (fmap (>>= k) fa)

data Cmd next = Say String next | Ask (String -> next)
  deriving Functor

say :: String -> Free Cmd ()
say s = Free (Say s (Pure ()))

ask :: Free Cmd String
ask = Free (Ask Pure)

program :: Free Cmd ()
program = do
  say "name?"
  n <- ask
  say ("hello " ++ n)

runPure :: [String] -> Free Cmd a -> [String]
runPure _ (Pure _) = []
runPure ins (Free (Say s k)) = s : runPure ins k
runPure (i : ins) (Free (Ask k)) = runPure ins (k i)
runPure [] (Free (Ask _)) = ["<eof>"]

main :: IO ()
main = mapM_ putStrLn (runPure ["Bob"] program)
