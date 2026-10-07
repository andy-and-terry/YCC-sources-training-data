Sub Main()
    Dim path As String
    Dim f As Integer
    Dim line As String

    path = Environ$("TEMP") & "\vba_fileio.txt"
    f = FreeFile
    Open path For Output As #f
    Print #f, "alpha"
    Print #f, "beta"
    Write #f, "gamma", 42
    Close #f

    f = FreeFile
    Open path For Input As #f
    Do While Not EOF(f)
        Line Input #f, line
        Debug.Print line
    Loop
    Close #f

    Debug.Print FileLen(path); "bytes"
    Kill path
End Sub
