Function ProperSum(ByVal n As Long) As Long
    Dim d As Long, total As Long
    For d = 1 To n \ 2
        If n Mod d = 0 Then total = total + d
    Next d
    ProperSum = total
End Function

Sub Main()
    Dim n As Long, result As String
    n = 12
    result = CStr(n)
    Do While n <> 0
        n = ProperSum(n)
        result = result & " " & n
    Loop
    Debug.Print result
End Sub
