import Data.Char (ord)

windowHash :: String -> Int
windowHash = foldl (\h c -> (h * 31 + ord c) `mod` 1000003) 0

main :: IO ()
main = mapM_ (\i -> putStrLn (show i ++ " " ++ show (windowHash (take 3 (drop i s))))) [0 .. length s - 3]
  where s = "abcabc"
