data Tree a = Leaf | Node (Tree a) a (Tree a) deriving Show

instance Functor Tree where
  fmap _ Leaf = Leaf
  fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

main :: IO ()
main = print (fmap (+ 1) (Node Leaf 1 (Node Leaf 2 Leaf)))
