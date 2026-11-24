' Fibbinary numbers: no two adjacent 1 bits.
Public Sub Main()
    Dim n As Long, out As String
    For n = 0 To 49
        If (n And (n \ 2)) = 0 Then out = out & n & " "
    Next n
    Debug.Print out
End Sub
