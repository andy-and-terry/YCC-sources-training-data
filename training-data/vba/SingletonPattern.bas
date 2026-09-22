' Class module: SingletonCounter
Private counterValue As Long

Public Sub Increment()
    counterValue = counterValue + 1
End Sub

Public Property Get Value() As Long
    Value = counterValue
End Property

' The following would live in a standard module
Private singletonInstance As SingletonCounter

Function GetSingletonCounter() As SingletonCounter
    If singletonInstance Is Nothing Then
        Set singletonInstance = New SingletonCounter
    End If
    Set GetSingletonCounter = singletonInstance
End Function

Sub Main()
    Dim a As SingletonCounter
    Dim b As SingletonCounter

    Set a = GetSingletonCounter()
    a.Increment
    a.Increment

    Set b = GetSingletonCounter()
    b.Increment

    Debug.Print a.Value
    Debug.Print (a Is b)
End Sub
