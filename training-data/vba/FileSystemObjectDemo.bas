Sub Main()
    Dim fso As Object
    Dim ts As Object
    Dim path As String
    Dim line As String

    Set fso = CreateObject("Scripting.FileSystemObject")
    path = fso.BuildPath(fso.GetSpecialFolder(2), "vba_fso_demo.txt")

    Set ts = fso.CreateTextFile(path, True)
    ts.WriteLine "first"
    ts.WriteLine "second"
    ts.Write "third"
    ts.Close

    Set ts = fso.OpenTextFile(path, 1)
    Do While Not ts.AtEndOfStream
        line = ts.ReadLine
        Debug.Print ts.Line - 1; line
    Loop
    ts.Close

    Debug.Print "size: "; fso.GetFile(path).Size
    Debug.Print "ext: "; fso.GetExtensionName(path)
    Debug.Print "base: "; fso.GetBaseName(path)

    fso.DeleteFile path
    Debug.Print "exists: "; fso.FileExists(path)
End Sub
