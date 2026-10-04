import Control.Exception
import System.IO

data BankError
  = InsufficientFunds Int
  | AccountClosed
  deriving Show

instance Exception BankError

withdraw :: Int -> Int -> IO Int
withdraw balance amount
  | amount > balance = throwIO (InsufficientFunds (amount - balance))
  | otherwise = return (balance - amount)

main :: IO ()
main = do
  r1 <- try (withdraw 100 30) :: IO (Either BankError Int)
  print r1

  r2 <- try (withdraw 100 130) :: IO (Either BankError Int)
  print r2

  r3 <- try (evaluate (1 `div` (0 :: Int)))
  case r3 of
    Left DivideByZero -> putStrLn "caught divide by zero"
    Left e -> putStrLn ("arith error: " ++ show e)
    Right v -> print v

  handle (\(ErrorCall msg) -> putStrLn ("error call: " ++ msg)) $
    evaluate (error "custom failure" :: ())

  (putStrLn "working" >> throwIO AccountClosed)
    `catch` (\e -> putStrLn ("handler: " ++ show (e :: BankError)))
    `finally` putStrLn "cleanup done"
  hFlush stdout
