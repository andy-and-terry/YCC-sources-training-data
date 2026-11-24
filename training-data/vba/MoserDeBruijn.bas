' Moser-de Bruijn sequence: binary digits of n read in base 4.
Private Function Moser(ByVal n As Long) As Long
    Dim result As Long, place As Long
    place = 1
    Do While n > 0
        If n Mod 2 = 1 Then result = result + place
        n = n \ 2
        place = place * 4
    Loop
    Moser = result
End Function

Public Sub Main()
    Dim n As Long, out As String
    For n = 0 To 11
        out = out & Moser(n) & " "
    Next n
    Debug.Print out
End Sub
