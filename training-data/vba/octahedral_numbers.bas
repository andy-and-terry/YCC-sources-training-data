Attribute VB_Name = "OctahedralNumbers"
' n(2n^2+1)/3
Function Term(ByVal n As Long) As Long
    Term = (n * (((2 * n) * n) + 1)) \ 3
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 15
        Debug.Print n & " -> " & Term(n)
    Next n
End Sub
