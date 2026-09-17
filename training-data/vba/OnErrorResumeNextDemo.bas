Function SafeArrayAccess(arr() As Long, index As Long) As Variant
    On Error Resume Next
    Dim result As Long
    result = arr(index)
    If Err.Number <> 0 Then
        Debug.Print "error: " & Err.Description
        SafeArrayAccess = Null
        Err.Clear
    Else
        SafeArrayAccess = result
    End If
    On Error GoTo 0
End Function

Sub Main()
    Dim data(2) As Long
    data(0) = 10: data(1) = 20: data(2) = 30
    Debug.Print SafeArrayAccess(data, 1)
    Debug.Print SafeArrayAccess(data, 10)
End Sub
