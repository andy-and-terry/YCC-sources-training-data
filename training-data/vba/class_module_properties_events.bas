' Class module: Counter
Private mCount As Long
Public Event Changed(ByVal newValue As Long)

Public Property Get Value() As Long
    Value = mCount
End Property

Public Property Let Value(ByVal v As Long)
    mCount = v
    RaiseEvent Changed(mCount)
End Property

Public Sub Increment(Optional ByVal By As Long = 1)
    Value = mCount + By
End Sub

Private Sub Class_Initialize()
    mCount = 0
End Sub

' Standard module usage
' Dim WithEvents c As Counter
' Private Sub c_Changed(ByVal newValue As Long): Debug.Print "now " & newValue: End Sub
Sub UseCounter()
    Dim c As New Counter
    c.Increment
    c.Increment 5
    Debug.Print c.Value
End Sub
