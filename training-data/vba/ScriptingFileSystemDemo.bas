Sub Main()
    Dim fso As Object
    Set fso = CreateObject("Scripting.FileSystemObject")

    Dim path As String
    path = fso.BuildPath(Environ$("TEMP"), "vba_demo.txt")

    Dim ts As Object
    Set ts = fso.CreateTextFile(path, True)
    ts.WriteLine "first line"
    ts.WriteLine "second line"
    ts.Close

    Debug.Print fso.FileExists(path)
    Debug.Print fso.GetFileName(path), fso.GetExtensionName(path)

    Set ts = fso.OpenTextFile(path, 1)
    Do While Not ts.AtEndOfStream
        Debug.Print ts.ReadLine
    Loop
    ts.Close

    fso.DeleteFile path
    Debug.Print fso.FileExists(path)
End Sub
