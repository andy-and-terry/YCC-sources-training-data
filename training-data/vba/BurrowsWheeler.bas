Attribute VB_Name = "BurrowsWheeler"
Sub Main()
    Dim s As String, n As Long, i As Long, j As Long
    Dim rots() As String, tmp As String, result As String
    s = "banana$": n = Len(s)
    ReDim rots(1 To n)
    For i = 1 To n
        rots(i) = Mid$(s, i) & Left$(s, i - 1)
    Next i
    For i = 2 To n
        tmp = rots(i): j = i - 1
        Do While j >= 1
            If StrComp(rots(j), tmp, vbBinaryCompare) <= 0 Then Exit Do
            rots(j + 1) = rots(j): j = j - 1
        Loop
        rots(j + 1) = tmp
    Next i
    For i = 1 To n
        result = result & Right$(rots(i), 1)
    Next i
    Debug.Print result
End Sub
