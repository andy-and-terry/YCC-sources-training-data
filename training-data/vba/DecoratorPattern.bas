Function PlainCoffeeCost() As Double
    PlainCoffeeCost = 2#
End Function

Function PlainCoffeeDescription() As String
    PlainCoffeeDescription = "coffee"
End Function

Function DecoratedCost(baseCost As Double, extraCosts() As Double, extraCount As Long) As Double
    Dim total As Double
    Dim i As Long
    total = baseCost
    For i = 0 To extraCount - 1
        total = total + extraCosts(i)
    Next i
    DecoratedCost = total
End Function

Function DecoratedDescription(baseDesc As String, extraDescs() As String, extraCount As Long) As String
    Dim desc As String
    Dim i As Long
    desc = baseDesc
    For i = 0 To extraCount - 1
        desc = desc & ", " & extraDescs(i)
    Next i
    DecoratedDescription = desc
End Function

Sub Main()
    Dim extraCosts(1) As Double
    extraCosts(0) = 0.5: extraCosts(1) = 0.25
    Dim extraDescs(1) As String
    extraDescs(0) = "milk": extraDescs(1) = "sugar"

    Dim desc As String, cost As Double
    desc = DecoratedDescription(PlainCoffeeDescription(), extraDescs, 2)
    cost = DecoratedCost(PlainCoffeeCost(), extraCosts, 2)

    Debug.Print desc & ": $" & cost
End Sub
