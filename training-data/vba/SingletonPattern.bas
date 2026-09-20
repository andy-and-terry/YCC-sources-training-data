' Class module: AppConfig
Private mCounter As Long

Public Property Get Counter() As Long
    Counter = mCounter
End Property

Public Sub Increment()
    mCounter = mCounter + 1
End Sub
