import qualified Data.Map as M
import Data.List (foldl')

magic :: Int -> [[Int]]
magic n = [[grid M.! (r, c) | c <- [0 .. n - 1]] | r <- [0 .. n - 1]]
  where
    (grid, _) = foldl' place (M.empty, (0, n `div` 2)) [1 .. n * n]
    place (m, (r, c)) k = (m', next)
      where
        m' = M.insert (r, c) k m
        up = ((r - 1) `mod` n, (c + 1) `mod` n)
        next = if M.member up m' then ((r + 1) `mod` n, c) else up

main :: IO ()
main = mapM_ (putStrLn . unwords . map show) (magic 5)
