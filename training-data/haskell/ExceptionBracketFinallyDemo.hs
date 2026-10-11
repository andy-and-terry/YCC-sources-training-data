import Control.Exception

data AppError = NotFound String | Invalid Int deriving Show
instance Exception AppError

risky :: Int -> IO Int
risky n
  | n < 0 = throwIO (Invalid n)
  | n == 0 = throwIO (NotFound "zero")
  | otherwise = return (n * 2)

main :: IO ()
main = do
  r <- try (risky (-1)) :: IO (Either AppError Int)
  print r
  r2 <- try (evaluate (1 `div` 0 :: Int)) :: IO (Either ArithException Int)
  print r2
  _ <- bracket (putStrLn "acquire" >> return 5)
               (\_ -> putStrLn "release")
               (\x -> risky x >>= print >> return x)
  (risky 0 >>= print) `catch` \e -> putStrLn ("caught " ++ show (e :: AppError))
  putStrLn "body" `finally` putStrLn "cleanup"
