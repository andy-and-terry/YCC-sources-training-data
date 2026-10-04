data Expr
  = Num Int
  | Add Expr Expr
  | Mul Expr Expr
  | Neg Expr

instance Show Expr where
  showsPrec _ (Num n) = shows n
  showsPrec p (Add a b) = showParen (p > 6) (showsPrec 6 a . showString " + " . showsPrec 7 b)
  showsPrec p (Mul a b) = showParen (p > 7) (showsPrec 7 a . showString " * " . showsPrec 8 b)
  showsPrec p (Neg e) = showParen (p > 9) (showString "-" . showsPrec 10 e)

newtype Matrix = Matrix [[Int]]

instance Show Matrix where
  show (Matrix rows) = unlines (map (unwords . map show) rows)

data Color = Red | Green deriving (Show, Read, Eq, Ord, Enum, Bounded)

eval :: Expr -> Int
eval (Num n) = n
eval (Add a b) = eval a + eval b
eval (Mul a b) = eval a * eval b
eval (Neg e) = negate (eval e)

main :: IO ()
main = do
  let e = Mul (Add (Num 1) (Num 2)) (Neg (Add (Num 3) (Num 4)))
  print e
  print (eval e)
  print (Add (Num 1) (Mul (Num 2) (Num 3)))
  putStr (show (Matrix [[1, 2], [3, 4]]))
  print (read "Green" :: Color, [minBound .. maxBound :: Color])
