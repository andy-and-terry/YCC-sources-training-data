Function Jaccard(a As Variant, b As Variant) As Double
    Dim u As Object, sa As Object, x As Variant, inter As Long
    Set u = CreateObject("Scripting.Dictionary")
    Set sa = CreateObject("Scripting.Dictionary")
    For Each x In a
        sa(x) = True
        u(x) = True
    Next x
    For Each x In b
        If sa.Exists(x) Then inter = inter + 1
        u(x) = True
    Next x
    Jaccard = inter / u.Count
End Function

Sub Demo()
    Debug.Print Jaccard(Array(1, 2, 3, 4), Array(3, 4, 5))
End Sub
