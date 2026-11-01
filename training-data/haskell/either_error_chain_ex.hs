safeDiv :: Int -> Int -> Either String Int
safeDiv _ 0 = Left "div by zero"
safeDiv a b = Right (a `div` b)

calc :: Int -> Int -> Int -> Either String Int
calc a b c = do
  x <- safeDiv a b
  safeDiv x c

main :: IO ()
main = mapM_ (print . (\(a, b, c) -> calc a b c)) [(100, 5, 2), (1, 0, 3), (9, 3, 0)]
