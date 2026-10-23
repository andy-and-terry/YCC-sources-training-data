{-# LANGUAGE GADTs #-}

-- A typed expression language: the type index rules out ill-typed terms.
data Expr a where
  IntE  :: Int  -> Expr Int
  BoolE :: Bool -> Expr Bool
  Add   :: Expr Int -> Expr Int -> Expr Int
  Mul   :: Expr Int -> Expr Int -> Expr Int
  If    :: Expr Bool -> Expr a -> Expr a -> Expr a
  Eq    :: Expr Int -> Expr Int -> Expr Bool
  Not   :: Expr Bool -> Expr Bool

eval :: Expr a -> a
eval (IntE n) = n
eval (BoolE b) = b
eval (Add a b) = eval a + eval b
eval (Mul a b) = eval a * eval b
eval (If c t e) = if eval c then eval t else eval e
eval (Eq a b) = eval a == eval b
eval (Not b) = not (eval b)

render :: Expr a -> String
render (IntE n) = show n
render (BoolE b) = show b
render (Add a b) = "(" ++ render a ++ " + " ++ render b ++ ")"
render (Mul a b) = "(" ++ render a ++ " * " ++ render b ++ ")"
render (If c t e) = "if " ++ render c ++ " then " ++ render t ++ " else " ++ render e
render (Eq a b) = render a ++ " == " ++ render b
render (Not b) = "!" ++ render b

main :: IO ()
main = do
  let e1 = Add (IntE 2) (Mul (IntE 3) (IntE 4))
      e2 = If (Eq e1 (IntE 14)) (IntE 100) (IntE 0)
  putStrLn (render e1 ++ " = " ++ show (eval e1))
  putStrLn (render e2 ++ " = " ++ show (eval e2))
  print (eval (Not (Eq (IntE 1) (IntE 2))))
