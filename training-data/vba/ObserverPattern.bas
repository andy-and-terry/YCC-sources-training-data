' Class module: IObserver
Public Sub OnChanged(value As Long)
End Sub

' Class module: ConsoleObserver
Implements IObserver
Public ObserverName As String

Private Sub IObserver_OnChanged(value As Long)
    Debug.Print ObserverName & " notified: " & value
End Sub

' Class module: Subject
Dim observers(1 To 10) As IObserver
Dim observerCount As Long
Public State As Long

Public Sub Attach(obs As IObserver)
    observerCount = observerCount + 1
    Set observers(observerCount) = obs
End Sub

Public Sub SetState(value As Long)
    State = value
    Dim i As Long
    For i = 1 To observerCount
        observers(i).OnChanged State
    Next i
End Sub

' The following would live in a standard module
Sub Main()
    Dim subject As New Subject
    Dim obsA As New ConsoleObserver
    obsA.ObserverName = "A"
    Dim obsB As New ConsoleObserver
    obsB.ObserverName = "B"

    subject.Attach obsA
    subject.Attach obsB

    subject.SetState 5
    subject.SetState 10
End Sub
