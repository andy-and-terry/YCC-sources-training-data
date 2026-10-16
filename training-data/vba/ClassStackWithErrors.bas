' Intended as a class module body (e.g. IntStack.cls); shown as a standard module for illustration.
Private data() As Long
Private count As Long

Private Sub Class_Initialize()
    ReDim data(0 To 3)
    count = 0
End Sub

Public Sub Push(ByVal v As Long)
    If count > UBound(data) Then ReDim Preserve data(0 To UBound(data) * 2 + 1)
    data(count) = v
    count = count + 1
End Sub

Public Function Pop() As Long
    If count = 0 Then Err.Raise vbObjectError + 513, "IntStack", "Stack is empty"
    count = count - 1
    Pop = data(count)
End Function

Public Property Get Size() As Long
    Size = count
End Property
