import Text.Printf (printf)

data Unit = C | F | K deriving (Show, Eq)

toCelsius :: Unit -> Double -> Double
toCelsius C v = v
toCelsius F v = (v - 32) * 5 / 9
toCelsius K v = v - 273.15

fromCelsius :: Unit -> Double -> Double
fromCelsius C v = v
fromCelsius F v = v * 9 / 5 + 32
fromCelsius K v = v + 273.15

convert :: Unit -> Unit -> Double -> Double
convert from to = fromCelsius to . toCelsius from

main :: IO ()
main = printf "%.2f %.2f\n" (convert C F 100) (convert F K 212)
