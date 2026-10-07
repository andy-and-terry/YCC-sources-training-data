module FacadePattern exposing (OrderSummary, placeOrder)

{-| The Gang-of-Four Facade pattern needs no wrapper class in Elm: hiding
several subsystem calls behind one simple entry point is just a function
that calls the smaller functions internally and returns one combined
result.
-}


checkInventory : String -> Bool
checkInventory _ =
    True


chargePayment : Float -> Bool
chargePayment amount =
    amount > 0


scheduleShipping : String -> String
scheduleShipping item =
    "shipping " ++ item ++ " tomorrow"


type alias OrderSummary =
    { success : Bool, message : String }


placeOrder : String -> Float -> OrderSummary
placeOrder item amount =
    if checkInventory item && chargePayment amount then
        { success = True, message = scheduleShipping item }

    else
        { success = False, message = "order failed" }
