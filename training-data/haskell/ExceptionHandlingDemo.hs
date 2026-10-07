{-# LANGUAGE ScopedTypeVariables #-}
import Control.Exception

data BankError = Insufficient Int | NoAccount String
  deriving Show

instance Exception BankError

withdraw :: Int -> Int -> IO Int
withdraw bal amt
  | amt > bal = throwIO (Insufficient (amt - bal))
  | otherwise = return (bal - amt)

main :: IO ()
main = do
  r <- try (evaluate (1 `div` (0 :: Int)))
  case r of
    Left DivideByZero -> putStrLn "divide by zero"
    Left e -> putStrLn ("arith: " ++ show e)
    Right v -> print v

  r2 <- try (withdraw 10 50)
  case r2 of
    Left (e :: BankError) -> putStrLn ("bank error: " ++ show e)
    Right v -> print v

  handle (\(e :: SomeException) -> putStrLn "caught head of empty list") $ do
    _ <- evaluate (head ([] :: [Int]))
    return ()

  (putStrLn "working" >> throwIO (NoAccount "x")) `catch` (\(e :: BankError) -> putStrLn ("handled " ++ show e))
    `finally` putStrLn "cleanup"
