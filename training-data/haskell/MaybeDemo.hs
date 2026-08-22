safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide a b = Just (a `div` b)

main :: IO ()
main = do
  mapM_
    ( \(a, b) -> case safeDivide a b of
        Just v -> putStrLn (show a ++ " / " ++ show b ++ " = " ++ show v)
        Nothing -> putStrLn (show a ++ " / " ++ show b ++ " = undefined")
    )
    [(10, 2), (5, 0), (9, 3)]
  print (sum [x | Just x <- [Just 1, Nothing, Just 3]])
