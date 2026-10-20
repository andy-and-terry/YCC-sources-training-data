import Data.Either (lefts, rights, partitionEithers)

data Err = Empty | Bad String deriving Show

parse :: String -> Either Err Int
parse "" = Left Empty
parse s | all (`elem` "0123456789") s = Right (read s)
        | otherwise = Left (Bad s)

main :: IO ()
main = do
  let rs = map parse ["12", "", "x1", "7"]
  print rs
  print (partitionEithers rs)
  print (either show (show . (+ 1)) (parse "41"))
  print (fmap (* 2) (parse "5"), sum <$> mapM parse ["1", "2"])
