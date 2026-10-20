import Data.Char (isDigit, isAlpha)

data User = User String Int deriving Show

vName :: String -> Either [String] String
vName s | all isAlpha s && not (null s) = Right s | otherwise = Left ["bad name"]

vAge :: String -> Either [String] Int
vAge s | not (null s) && all isDigit s = Right (read s) | otherwise = Left ["bad age"]

combine :: Either [String] (a -> b) -> Either [String] a -> Either [String] b
combine (Left e1) (Left e2) = Left (e1 ++ e2)
combine (Left e) _ = Left e
combine (Right f) r = fmap f r

main :: IO ()
main = do
  print (Right User `combine` vName "ada" `combine` vAge "36")
  print (Right User `combine` vName "a1" `combine` vAge "x")
  print ((+) <$> Just 3 <*> Just 4, pure 5 :: [Int], (,) <$> [1, 2] <*> "ab")
  print (zipWith ($) [(+ 1), (* 2)] [10, 20], fmap (+ 1) (3, 4), (+) <$> (* 2) <*> (+ 10) $ 3)
