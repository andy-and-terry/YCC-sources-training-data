import Data.List (tails)
import Text.Printf (printf)

-- Running average over the trailing window (shorter at the start).
movingAverage :: Int -> [Double] -> [Double]
movingAverage k xs = zipWith avg [1 ..] (map (take k) (prefixesReversed xs))
  where
    prefixesReversed = tail . scanl (flip (:)) []
    avg i w = sum w / fromIntegral (min k i :: Int)

-- Full windows only, for comparison.
fullWindows :: Int -> [Double] -> [Double]
fullWindows k xs = [sum w / fromIntegral k | w <- map (take k) (tails xs), length w == k]

main :: IO ()
main = do
  let xs = [1, 10, 3, 5, 8, 2]
  mapM_ (printf "%.2f ") (movingAverage 3 xs) >> putStrLn ""
  mapM_ (printf "%.2f ") (fullWindows 3 xs) >> putStrLn ""
