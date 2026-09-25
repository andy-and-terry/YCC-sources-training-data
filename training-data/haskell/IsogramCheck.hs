import Data.Char (isAlpha, toLower)
import Data.List (nub)

isIsogram :: String -> Bool
isIsogram w = length letters == length (nub letters)
  where
    letters = map toLower (filter isAlpha w)

main :: IO ()
main = mapM_ (\w -> putStrLn (w ++ " " ++ show (isIsogram w))) ["lumberjacks", "background", "six-year-old", "isograms"]
