Function Sign(ByVal n As Double) As String
    Sign = IIf(n > 0, "positive", IIf(n < 0, "negative", "zero"))
End Function

Function MonthLabel(ByVal m As Long) As String
    MonthLabel = Choose(m, "Jan", "Feb", "Mar", "Apr", "May", "Jun", _
                           "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
End Function

Function Shipping(ByVal weight As Double) As Double
    Shipping = Switch(weight <= 1, 5, weight <= 5, 8.5, weight <= 20, 15, True, 40)
End Function

Sub Main()
    Debug.Print Sign(5), Sign(-2), Sign(0)

    Dim i As Long
    For i = 1 To 12 Step 4
        Debug.Print i, MonthLabel(i)
    Next i
    Debug.Print IsNull(Choose(13, "x"))

    Debug.Print Shipping(0.5), Shipping(3), Shipping(10), Shipping(100)

    Dim a As Long, b As Long
    a = 7: b = 0
    ' IIf evaluates both branches, so guard the division explicitly
    If b <> 0 Then Debug.Print a / b Else Debug.Print "skipped division"

    Dim label As String
    label = IIf(a Mod 2 = 0, "even", "odd")
    Debug.Print a, label

    Dim v As Variant
    v = Null
    Debug.Print Nz(v, "default")
End Sub

Function Nz(ByVal v As Variant, ByVal fallback As Variant) As Variant
    If IsNull(v) Or IsEmpty(v) Then Nz = fallback Else Nz = v
End Function
