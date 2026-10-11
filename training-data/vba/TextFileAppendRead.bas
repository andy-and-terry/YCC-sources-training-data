Sub Main()
    Dim path As String, ff As Integer, line As String, n As Long
    path = Environ$("TEMP") & "\vba_demo_log.txt"
    ff = FreeFile
    Open path For Output As #ff
    Print #ff, "first line"
    Print #ff, "second line"
    Close #ff

    ff = FreeFile
    Open path For Append As #ff
    Write #ff, "third", 3, True
    Close #ff

    ff = FreeFile
    Open path For Input As #ff
    Do While Not EOF(ff)
        Line Input #ff, line
        n = n + 1
        Debug.Print n & ": " & line
    Loop
    Close #ff
    Debug.Print "Size: " & FileLen(path) & " bytes"
    Kill path
End Sub
