data Color = Red | Green | Blue deriving (Show, Read, Eq, Enum, Bounded)

data Expr = Lit Int | Add Expr Expr | Mul Expr Expr
instance Show Expr where
  showsPrec _ (Lit n) = shows n
  showsPrec p (Add a b) = showParen (p > 6) $ showsPrec 6 a . showString " + " . showsPrec 7 b
  showsPrec p (Mul a b) = showParen (p > 7) $ showsPrec 7 a . showString " * " . showsPrec 8 b

main :: IO ()
main = do
  print ([minBound .. maxBound] :: [Color])
  print (read "Blue" :: Color, (read "[Red,Green]" :: [Color]))
  print (Mul (Add (Lit 1) (Lit 2)) (Lit 3))
  print (Add (Lit 1) (Mul (Lit 2) (Lit 3)))
