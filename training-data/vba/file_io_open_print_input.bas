Sub FileIoDemo()
    Dim path As String: path = Environ("TEMP") & "\vba_demo.txt"
    Dim f As Integer: f = FreeFile
    Open path For Output As #f
    Print #f, "first line"
    Print #f, "second,3,4.5"
    Write #f, "quoted", 42
    Close #f
    Open path For Input As #f
    Dim line As String, n As Long
    Do While Not EOF(f)
        Line Input #f, line
        n = n + 1
        Debug.Print n & ": " & line
    Loop
    Close #f
    Debug.Print FileLen(path), Dir(path) <> ""
    Open path For Append As #f: Print #f, "appended": Close #f
    Dim all As String
    f = FreeFile
    Open path For Binary Access Read As #f
    all = Space$(LOF(f)): Get #f, , all
    Close #f
    Debug.Print Len(all) > 0
    Kill path
    Debug.Print Dir(path) = ""
End Sub
