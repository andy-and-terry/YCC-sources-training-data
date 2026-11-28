Attribute VB_Name = "RollingHash"
Sub Main()
    Dim s As String, k As Long, i As Long, j As Long, h As Long
    s = "abcabc": k = 3
    For i = 1 To Len(s) - k + 1
        h = 0
        For j = i To i + k - 1
            h = (h * 31 + Asc(Mid$(s, j, 1))) Mod 1000003
        Next j
        Debug.Print i - 1; h
    Next i
End Sub
