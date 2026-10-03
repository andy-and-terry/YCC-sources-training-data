-- Function composition acts as the decorator pattern: each decorator
-- wraps the previous behavior instead of subclassing.
type CoffeeMaker = () -> (String, Double)

plainCoffee :: CoffeeMaker
plainCoffee () = ("coffee", 2.0)

withMilk :: CoffeeMaker -> CoffeeMaker
withMilk base () =
  let (desc, price) = base ()
  in (desc ++ " + milk", price + 0.5)

withSugar :: CoffeeMaker -> CoffeeMaker
withSugar base () =
  let (desc, price) = base ()
  in (desc ++ " + sugar", price + 0.2)

main :: IO ()
main = do
  let order = withSugar (withMilk plainCoffee)
  print (order ())
