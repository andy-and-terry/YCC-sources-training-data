Attribute VB_Name = "LyndonFactorization"
Sub Main()
    Dim s As String, n As Long, i As Long, j As Long, k As Long
    s = "banana": n = Len(s): i = 1
    Do While i <= n
        j = i + 1: k = i
        Do While j <= n
            If Mid$(s, k, 1) > Mid$(s, j, 1) Then Exit Do
            If Mid$(s, k, 1) < Mid$(s, j, 1) Then k = i Else k = k + 1
            j = j + 1
        Loop
        Do While i <= k
            Debug.Print Mid$(s, i, j - k)
            i = i + (j - k)
        Loop
    Loop
End Sub
