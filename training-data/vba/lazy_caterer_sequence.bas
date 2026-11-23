Attribute VB_Name = "LazyCatererSequence"
' n(n+1)/2+1
Function Term(ByVal n As Long) As Long
    Term = ((n * (n + 1)) \ 2) + 1
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 15
        Debug.Print n & " -> " & Term(n)
    Next n
End Sub
