Attribute VB_Name = "CenteredHexagonalNumbers"
' 3n(n-1)+1
Function Term(ByVal n As Long) As Long
    Term = ((3 * n) * (n - 1)) + 1
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 15
        Debug.Print n & " -> " & Term(n)
    Next n
End Sub
