Sub ParseLine()
    Dim s As String: s = "key=value;other=2"
    Dim parts() As String: parts = Split(s, ";")
    Dim p As Variant
    For Each p In parts
        Debug.Print Left(p, InStr(p, "=") - 1) & " -> " & Mid(p, InStr(p, "=") + 1)
    Next p
End Sub
