validate :: Int -> Either String Int
validate n
  | n < 0 = Left "negative"
  | n > 100 = Left "too large"
  | otherwise = Right n

main :: IO ()
main = print (mapM validate [1, 50, 100], mapM validate [1, 200])
