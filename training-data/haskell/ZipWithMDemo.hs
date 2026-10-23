import Control.Monad (zipWithM, zipWithM_)

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (a `div` b)

main :: IO ()
main = do
  zipWithM_ (\i s -> putStrLn (show i ++ ": " ++ s)) [1 :: Int ..] ["alpha", "beta", "gamma"]
  print (zipWithM safeDiv [10, 20, 30] [2, 5, 3])
  print (zipWithM safeDiv [10, 20, 30] [2, 0, 3])
