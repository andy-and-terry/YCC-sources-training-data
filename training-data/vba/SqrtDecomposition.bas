Attribute VB_Name = "SqrtDecomposition"
Sub Main()
    Dim a As Variant, blk(0 To 2) As Long
    Dim i As Long, s As Long, bs As Long
    a = Array(5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5)
    bs = 4
    For i = 0 To 11
        blk(i \ bs) = blk(i \ bs) + a(i)
    Next i
    i = 2
    Do While i <= 9
        If i Mod bs = 0 And i + bs - 1 <= 9 Then
            s = s + blk(i \ bs): i = i + bs
        Else
            s = s + a(i): i = i + 1
        End If
    Loop
    Debug.Print s
End Sub
