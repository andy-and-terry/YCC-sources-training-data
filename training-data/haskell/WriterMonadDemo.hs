newtype Writer w a = Writer { runWriter :: (a, w) }

instance Functor (Writer w) where
  fmap f (Writer (a, w)) = Writer (f a, w)

instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a, mempty)
  (Writer (f, w1)) <*> (Writer (a, w2)) = Writer (f a, w1 <> w2)

instance Monoid w => Monad (Writer w) where
  return = pure
  (Writer (a, w)) >>= f =
    let (Writer (b, w')) = f a
    in Writer (b, w <> w')

tell :: w -> Writer w ()
tell w = Writer ((), w)

logStep :: Int -> Writer [String] Int
logStep x = do
  tell ["received " ++ show x]
  let y = x * 2
  tell ["doubled to " ++ show y]
  return y

pipeline :: Int -> Writer [String] Int
pipeline x = do
  a <- logStep x
  b <- logStep a
  return b

main :: IO ()
main = do
  let (result, logs) = runWriter (pipeline 3)
  print result
  mapM_ putStrLn logs
