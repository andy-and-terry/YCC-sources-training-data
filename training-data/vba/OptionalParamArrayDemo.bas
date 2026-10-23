Function Total(ParamArray nums() As Variant) As Double
    Dim i As Long
    For i = LBound(nums) To UBound(nums)
        Total = Total + nums(i)
    Next i
End Function

Function Greet(name As String, Optional greeting As String = "Hello") As String
    Greet = greeting & ", " & name
End Function

Sub Main()
    Debug.Print Total(1, 2, 3, 4)
    Debug.Print Greet("Ann")
    Debug.Print Greet("Ann", "Hi")
End Sub
