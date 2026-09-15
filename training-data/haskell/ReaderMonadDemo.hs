newtype Reader r a = Reader { runReader :: r -> a }

instance Functor (Reader r) where
  fmap f (Reader g) = Reader (f . g)

instance Applicative (Reader r) where
  pure a = Reader (const a)
  (Reader f) <*> (Reader g) = Reader (\r -> f r (g r))

instance Monad (Reader r) where
  return = pure
  (Reader g) >>= f = Reader (\r -> runReader (f (g r)) r)

ask :: Reader r r
ask = Reader id

data Config = Config { greeting :: String, userName :: String }

buildMessage :: Reader Config String
buildMessage = do
  cfg <- ask
  return (greeting cfg ++ ", " ++ userName cfg ++ "!")

main :: IO ()
main = do
  let config = Config { greeting = "Hello", userName = "Ada" }
  putStrLn (runReader buildMessage config)
