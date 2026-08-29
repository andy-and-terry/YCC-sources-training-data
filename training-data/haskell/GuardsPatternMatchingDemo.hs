classify :: Int -> String
classify n
  | n < 0 = "negative"
  | n == 0 = "zero"
  | n < 10 = "small"
  | otherwise = "large"

describe :: [Int] -> String
describe [] = "empty"
describe [x] = "single: " ++ show x
describe (x:_:_) = "starts with " ++ show x

main :: IO ()
main = do
  print (map classify [-5, 0, 3, 100])
  putStrLn (describe [1, 2, 3])
