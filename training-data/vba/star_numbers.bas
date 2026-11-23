Attribute VB_Name = "StarNumbers"
' 6n(n-1)+1
Function Term(ByVal n As Long) As Long
    Term = ((6 * n) * (n - 1)) + 1
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 15
        Debug.Print n & " -> " & Term(n)
    Next n
End Sub
