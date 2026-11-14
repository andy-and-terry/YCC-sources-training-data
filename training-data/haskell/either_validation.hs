validate :: Int -> Either String Int
validate n
  | n < 0 = Left "negative"
  | n > 100 = Left "too big"
  | otherwise = Right n

main :: IO ()
main = do
  print (mapM validate [1, 50, 99])
  print (mapM validate [1, 500, -1])
