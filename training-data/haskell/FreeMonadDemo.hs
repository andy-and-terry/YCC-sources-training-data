{-# LANGUAGE DeriveFunctor #-}

-- A minimal hand-rolled Free monad: build a program as pure data, then
-- interpret it later. Here CommandF describes a tiny console DSL.
data CommandF next
  = Say String next
  | Ask (String -> next)
  deriving Functor

data Free f a = Pure a | Roll (f (Free f a))

instance Functor f => Functor (Free f) where
  fmap f (Pure a) = Pure (f a)
  fmap f (Roll fa) = Roll (fmap (fmap f) fa)

instance Functor f => Applicative (Free f) where
  pure = Pure
  Pure f <*> x = fmap f x
  Roll ff <*> x = Roll (fmap (<*> x) ff)

instance Functor f => Monad (Free f) where
  return = pure
  Pure a >>= f = f a
  Roll fa >>= f = Roll (fmap (>>= f) fa)

say :: String -> Free CommandF ()
say s = Roll (Say s (Pure ()))

ask :: Free CommandF String
ask = Roll (Ask Pure)

-- Interprets the program purely, feeding a fixed canned answer to every Ask.
interpret :: Free CommandF a -> [String] -> ([String], a)
interpret (Pure a) _ = ([], a)
interpret (Roll (Say s next)) input =
  let (logs, a) = interpret next input
  in (s : logs, a)
interpret (Roll (Ask f)) (x : xs) = interpret (f x) xs
interpret (Roll (Ask f)) [] = interpret (f "") []

program :: Free CommandF ()
program = do
  say "what is your name?"
  name <- ask
  say ("hello, " ++ name)

main :: IO ()
main = do
  let (logs, ()) = interpret program ["Ada"]
  mapM_ putStrLn logs
