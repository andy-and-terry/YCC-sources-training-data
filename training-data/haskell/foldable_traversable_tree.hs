import Data.Foldable (toList, foldl')
import Data.Traversable (traverse)

data Rose a = Rose a [Rose a] deriving Show

instance Functor Rose where fmap f (Rose a ks) = Rose (f a) (map (fmap f) ks)
instance Foldable Rose where foldMap f (Rose a ks) = f a <> foldMap (foldMap f) ks
instance Traversable Rose where traverse f (Rose a ks) = Rose <$> f a <*> traverse (traverse f) ks

main :: IO ()
main = do
  let t = Rose 1 [Rose 2 [Rose 4 []], Rose 3 []]
  print (toList t, sum t, length t, elem 3 t, maximum t)
  print (fmap (* 10) t)
  print (traverse (\x -> if x > 0 then Just (x + 1) else Nothing) t)
  print (foldl' (flip (:)) [] t)
