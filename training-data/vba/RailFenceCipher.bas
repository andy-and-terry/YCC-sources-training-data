Public Function Encode(ByVal text As String, ByVal rails As Long) As String
    Dim rows() As String, i As Long, r As Long, stp As Long
    ReDim rows(0 To rails - 1)
    r = 0: stp = 1
    For i = 1 To Len(text)
        rows(r) = rows(r) & Mid$(text, i, 1)
        If r = 0 Then stp = 1 Else If r = rails - 1 Then stp = -1
        r = r + stp
    Next i
    Encode = Join(rows, "")
End Function

Public Sub Main()
    Debug.Print Encode("WEAREDISCOVERED", 3)
End Sub
