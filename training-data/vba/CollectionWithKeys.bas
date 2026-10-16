Sub Main()
    Dim c As New Collection
    c.Add "Alice", "a1"
    c.Add "Bob", "b2"
    c.Add "Carol", "c3"

    Debug.Print c("b2")
    Debug.Print c(1)

    c.Remove "b2"
    Debug.Print "Count: " & c.Count

    On Error Resume Next
    Dim v As String
    v = c("b2")
    If Err.Number <> 0 Then Debug.Print "b2 not found (error " & Err.Number & ")"
    Err.Clear
    On Error GoTo 0

    Dim item As Variant
    For Each item In c
        Debug.Print item
    Next item
End Sub
