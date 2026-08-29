data Expr = Num Int
          | Add Expr Expr
          | Mul Expr Expr
          | Sub Expr Expr

eval :: Expr -> Int
eval (Num n) = n
eval (Add a b) = eval a + eval b
eval (Mul a b) = eval a * eval b
eval (Sub a b) = eval a - eval b

main :: IO ()
main = print (eval (Add (Num 3) (Mul (Num 4) (Num 5))))
