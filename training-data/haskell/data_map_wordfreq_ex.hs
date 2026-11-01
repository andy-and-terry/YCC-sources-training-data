import qualified Data.Map.Strict as M
import Data.List (sortOn)
import Data.Ord (Down (..))

main :: IO ()
main = do
  let ws = words "a b a c b a"
      m = M.fromListWith (+) [(w, 1 :: Int) | w <- ws]
  print (sortOn (Down . snd) (M.toList m))
