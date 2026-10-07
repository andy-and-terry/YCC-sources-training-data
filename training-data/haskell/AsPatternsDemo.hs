firstTwo :: [a] -> Maybe (a, a)
firstTwo (x : y : _) = Just (x, y)
firstTwo _ = Nothing

dupHead :: [a] -> [a]
dupHead all'@(x : _) = x : all'
dupHead [] = []

describe :: (Int, [Int]) -> String
describe (0, _) = "zero key"
describe (_, []) = "empty list"
describe (k, [x]) = "single " ++ show (k + x)
describe (k, xs@(_ : _ : _)) = "many " ++ show (k, length xs)

lazyPat :: (Int, Int) -> Int
lazyPat ~(a, _) = 42

main :: IO ()
main = do
  print (firstTwo "abc", firstTwo "a")
  print (dupHead [1, 2, 3 :: Int])
  mapM_ (putStrLn . describe) [(0, [1]), (1, []), (2, [3]), (4, [1, 2, 3])]
  print (lazyPat undefined)
