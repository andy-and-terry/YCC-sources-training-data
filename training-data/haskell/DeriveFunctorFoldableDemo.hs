{-# LANGUAGE DeriveFunctor, DeriveFoldable, DeriveTraversable #-}

data Rose a = Rose a [Rose a] deriving (Show, Functor, Foldable, Traversable)

tree :: Rose Int
tree = Rose 1 [Rose 2 [Rose 4 []], Rose 3 []]

main :: IO ()
main = do
  print (fmap (* 2) tree)
  print (sum tree, product tree, length tree, maximum tree)
  print (foldr (:) [] tree)
  print (elem 3 tree)
  print (traverse (\x -> if x > 0 then Just (x * x) else Nothing) tree)
  mapM_ print tree
