Function FibonacciAt(ByVal n As Long) As Long
    Dim a As Long, b As Long, i As Long, temp As Long
    a = 0
    b = 1
    For i = 1 To n
        temp = a + b
        a = b
        b = temp
    Next i
    FibonacciAt = a
End Function

Sub Main()
    Dim i As Long
    For i = 0 To 10
        Debug.Print FibonacciAt(i)
    Next i
End Sub
