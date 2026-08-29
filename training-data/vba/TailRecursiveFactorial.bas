Function Factorial(n As Long) As Long
    Dim result As Long, i As Long
    result = 1
    For i = 1 To n
        result = result * i
    Next i
    Factorial = result
End Function

Sub Main()
    Debug.Print Factorial(10)
End Sub
