import Text.Read (readMaybe)

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (a `div` b)

main :: IO ()
main = do
  print (readMaybe "20" >>= \a -> safeDiv a 4)
  print (readMaybe "20" >>= \a -> safeDiv a 0)
  print (traverse readMaybe ["1", "2", "x"] :: Maybe [Int])
