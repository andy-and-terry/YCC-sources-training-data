Attribute VB_Name = "PentatopeNumbers"
' n(n+1)(n+2)(n+3)/24
Function Term(ByVal n As Long) As Long
    Term = (((n * (n + 1)) * (n + 2)) * (n + 3)) \ 24
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 15
        Debug.Print n & " -> " & Term(n)
    Next n
End Sub
