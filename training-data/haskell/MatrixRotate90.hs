import Data.List (transpose)

rotateClockwise :: [[a]] -> [[a]]
rotateClockwise = map reverse . transpose

rotateCounterClockwise :: [[a]] -> [[a]]
rotateCounterClockwise = reverse . transpose

main :: IO ()
main = do
  let m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] :: [[Int]]
  mapM_ print (rotateClockwise m)
  mapM_ print (rotateCounterClockwise m)
