import Control.Exception
import qualified Data.Map as M

data BankError = Insufficient Int | UnknownAccount String
  deriving Show

instance Exception BankError

withdraw :: Int -> Int -> IO Int
withdraw bal amt
  | amt > bal = throwIO (Insufficient (amt - bal))
  | otherwise = return (bal - amt)

main :: IO ()
main = do
  r1 <- try (evaluate (1 `div` (0 :: Int))) :: IO (Either ArithException Int)
  print r1
  r2 <- try (withdraw 10 50)
  case r2 of
    Left (Insufficient n) -> putStrLn ("short by " ++ show n)
    Left e -> print e
    Right b -> print b
  r3 <- try (evaluate (head ([] :: [Int])))
  case r3 of
    Left (SomeException _) -> putStrLn "head failed"
    Right v -> print v
  (print (M.fromList [(1 :: Int, "a")] M.! 1)) `finally` putStrLn "cleanup"
