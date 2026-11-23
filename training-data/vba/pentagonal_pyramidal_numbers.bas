Attribute VB_Name = "PentagonalPyramidalNumbers"
' n^2(n+1)/2
Function Term(ByVal n As Long) As Long
    Term = ((n * n) * (n + 1)) \ 2
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 15
        Debug.Print n & " -> " & Term(n)
    Next n
End Sub
