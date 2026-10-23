import Data.Functor.Compose (Compose (..))
import Data.Functor.Identity (Identity (..))

main :: IO ()
main = do
  print (runIdentity (Identity 5 >>= \x -> return (x * 2)))
  let nested = Compose [Just 1, Nothing, Just (3 :: Int)]
  print (getCompose (fmap (+ 10) nested))
  print (sum nested)
