main :: IO ()
main = do
  print (fmap (+1) (Just 5))
  print ((+) <$> Just 3 <*> Just 4)
  print (fmap (* 2) [1, 2, 3])
