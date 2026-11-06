-- Bulls and Cows scoring for equal-length digit strings.
import Data.List (delete)

score :: String -> String -> (Int, Int)
score secret guess = (length bulls, cows)
  where
    pairs = zip secret guess
    bulls = filter (uncurry (==)) pairs
    rest = filter (uncurry (/=)) pairs
    cows = go (map fst rest) (map snd rest)
    go _ [] = 0
    go ss (g : gs)
      | g `elem` ss = 1 + go (delete g ss) gs
      | otherwise = go ss gs

main :: IO ()
main = do
  let (b, c) = score "1807" "7810"
  putStrLn (show b ++ " bull(s), " ++ show c ++ " cow(s)")
