Attribute VB_Name = "ListMode"
Option Explicit

Public Sub Demo()
    Dim items As Variant, counts As Object, x As Variant, top As Long, k As Variant
    items = Array(1, 2, 2, 3, 3, 4)
    Set counts = CreateObject("Scripting.Dictionary")
    For Each x In items
        counts(x) = counts(x) + 1
        If counts(x) > top Then top = counts(x)
    Next x
    For Each k In counts.Keys
        If counts(k) = top Then Debug.Print k
    Next k
End Sub
