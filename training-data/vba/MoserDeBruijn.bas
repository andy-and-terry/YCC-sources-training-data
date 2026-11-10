' Read the binary digits of i as base-4 digits.
Private Function Moser(ByVal i As Long) As Long
    Dim value As Long, power As Long
    power = 1
    Do While i > 0
        If i And 1 Then value = value + power
        power = power * 4
        i = i \ 2
    Loop
    Moser = value
End Function

Sub PrintMoser()
    Dim i As Long, s As String
    For i = 0 To 9
        s = s & Moser(i) & " "
    Next i
    Debug.Print s ' 0 1 4 5 16 17 20 21 64 65
End Sub
