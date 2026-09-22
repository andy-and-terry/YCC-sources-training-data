' Class module: IDiscountStrategy
Public Function Apply(amount As Double) As Double
End Function

' Class module: NoDiscount
Implements IDiscountStrategy

Private Function IDiscountStrategy_Apply(amount As Double) As Double
    IDiscountStrategy_Apply = amount
End Function

' Class module: PercentageDiscount
Implements IDiscountStrategy

Public Percent As Double

Private Function IDiscountStrategy_Apply(amount As Double) As Double
    IDiscountStrategy_Apply = amount - amount * Percent / 100
End Function

' Class module: FlatDiscount
Implements IDiscountStrategy

Public FlatAmount As Double

Private Function IDiscountStrategy_Apply(amount As Double) As Double
    Dim result As Double
    result = amount - FlatAmount
    If result < 0 Then result = 0
    IDiscountStrategy_Apply = result
End Function

' The following would live in a standard module
Sub Main()
    Dim strategy As IDiscountStrategy

    Set strategy = New NoDiscount
    Debug.Print strategy.Apply(100)

    Dim pct As New PercentageDiscount
    pct.Percent = 20
    Set strategy = pct
    Debug.Print strategy.Apply(100)

    Dim flat As New FlatDiscount
    flat.FlatAmount = 15
    Set strategy = flat
    Debug.Print strategy.Apply(100)
End Sub
