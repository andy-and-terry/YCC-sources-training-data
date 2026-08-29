Dim graphVisited As Object
Dim graphOrder As New Collection

Sub VisitNode(node As String, deps() As Variant)
    If graphVisited.Exists(node) Then Exit Sub
    graphVisited.Add node, True
    graphOrder.Add node
End Sub

Sub Main()
    Set graphVisited = CreateObject("Scripting.Dictionary")
    Dim depsA(1) As Variant
    depsA(0) = "b": depsA(1) = "c"
    VisitNode "a", depsA
    Dim item As Variant
    For Each item In graphOrder
        Debug.Print item
    Next item
End Sub
