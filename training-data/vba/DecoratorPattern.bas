' Class module: ICoffee
Public Function Cost() As Double
End Function

Public Function CoffeeDescription() As String
End Function

' Class module: PlainCoffee
Implements ICoffee

Private Function ICoffee_Cost() As Double
    ICoffee_Cost = 2#
End Function

Private Function ICoffee_CoffeeDescription() As String
    ICoffee_CoffeeDescription = "Coffee"
End Function

' Class module: MilkDecorator
Implements ICoffee

Public Wrapped As ICoffee

Private Function ICoffee_Cost() As Double
    ICoffee_Cost = Wrapped.Cost + 0.5
End Function

Private Function ICoffee_CoffeeDescription() As String
    ICoffee_CoffeeDescription = Wrapped.CoffeeDescription & " + Milk"
End Function

' Class module: SugarDecorator
Implements ICoffee

Public Wrapped As ICoffee

Private Function ICoffee_Cost() As Double
    ICoffee_Cost = Wrapped.Cost + 0.25
End Function

Private Function ICoffee_CoffeeDescription() As String
    ICoffee_CoffeeDescription = Wrapped.CoffeeDescription & " + Sugar"
End Function

' The following would live in a standard module
Sub Main()
    Dim order As ICoffee
    Set order = New PlainCoffee

    Dim withMilk As New MilkDecorator
    Set withMilk.Wrapped = order
    Set order = withMilk

    Dim withSugar As New SugarDecorator
    Set withSugar.Wrapped = order
    Set order = withSugar

    Debug.Print order.CoffeeDescription & ": $" & order.Cost
End Sub
