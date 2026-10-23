import Data.Coerce (coerce)
import Data.Monoid (Sum (..))

newtype Meters = Meters Double deriving (Show)

main :: IO ()
main = do
  let xs = [1.5, 2.5, 3.0] :: [Double]
  print (coerce xs :: [Meters])
  print (getSum (foldMap coerce xs :: Sum Double))
  print (coerce (Meters 4.2) :: Double)
