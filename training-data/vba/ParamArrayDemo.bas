Function SumAll(ParamArray numbers() As Variant) As Double
    Dim total As Double
    Dim i As Long
    total = 0
    For i = LBound(numbers) To UBound(numbers)
        total = total + numbers(i)
    Next i
    SumAll = total
End Function

Function JoinAll(separator As String, ParamArray items() As Variant) As String
    Dim result As String
    Dim i As Long
    result = ""
    For i = LBound(items) To UBound(items)
        If i > LBound(items) Then result = result & separator
        result = result & CStr(items(i))
    Next i
    JoinAll = result
End Function

Sub Main()
    Debug.Print SumAll(1, 2, 3, 4, 5)
    Debug.Print JoinAll(", ", "a", "b", "c")
End Sub
