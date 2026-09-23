' Class module: IObserver
Public Sub Update(ByVal value As Double)
End Sub

' Class module: PriceObserver
Implements IObserver

Public ObserverName As String

Private Sub IObserver_Update(ByVal value As Double)
    Debug.Print ObserverName & " notified: price = " & value
End Sub

' Class module: StockSubject
Private observers As New Collection

Public Sub Subscribe(obs As IObserver)
    observers.Add obs
End Sub

Public Sub SetPrice(ByVal newPrice As Double)
    Dim item As Variant
    Dim asObserver As IObserver
    For Each item In observers
        Set asObserver = item
        asObserver.Update newPrice
    Next item
End Sub

' The following would live in a standard module
Sub Main()
    Dim subject As New StockSubject

    Dim obsA As New PriceObserver
    obsA.ObserverName = "Trader A"
    Dim obsB As New PriceObserver
    obsB.ObserverName = "Trader B"

    subject.Subscribe obsA
    subject.Subscribe obsB

    subject.SetPrice 101.5
    subject.SetPrice 99.25
End Sub
