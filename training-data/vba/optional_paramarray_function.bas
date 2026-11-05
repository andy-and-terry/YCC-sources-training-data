Function SumAll(ParamArray nums() As Variant) As Double
    Dim i As Long
    For i = LBound(nums) To UBound(nums)
        SumAll = SumAll + nums(i)
    Next i
End Function

Function Greet(Optional name As String = "world") As String
    Greet = "Hello, " & name
End Function

Sub Test()
    Debug.Print SumAll(1, 2, 3.5), Greet(), Greet("Ann")
End Sub
