data Tree a = Leaf | Node (Tree a) a (Tree a) deriving Show

data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving Show

type Zipper a = (Tree a, [Crumb a])

goLeft, goRight, goUp :: Zipper a -> Maybe (Zipper a)
goLeft (Node l x r, bs) = Just (l, LeftCrumb x r : bs)
goLeft _ = Nothing
goRight (Node l x r, bs) = Just (r, RightCrumb x l : bs)
goRight _ = Nothing
goUp (t, LeftCrumb x r : bs) = Just (Node t x r, bs)
goUp (t, RightCrumb x l : bs) = Just (Node l x t, bs)
goUp (_, []) = Nothing

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (Node l x r, bs) = (Node l (f x) r, bs)
modify _ z = z

top :: Zipper a -> Tree a
top z = maybe (fst z) top (goUp z)

main :: IO ()
main = do
  let t = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)
      Just z = goLeft (t, [])
  print (top (modify (* 10) z))
