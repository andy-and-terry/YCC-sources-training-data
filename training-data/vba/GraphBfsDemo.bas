Function BfsOrder(graph As Object, startNode As String) As Collection
    Dim visited As Object
    Set visited = CreateObject("Scripting.Dictionary")
    Dim queue As New Collection
    Dim order As New Collection

    queue.Add startNode
    visited.Add startNode, True

    Do While queue.Count > 0
        Dim current As String
        current = queue(1)
        queue.Remove 1
        order.Add current

        Dim neighbor As Variant
        For Each neighbor In graph(current)
            If Not visited.Exists(neighbor) Then
                visited.Add neighbor, True
                queue.Add neighbor
            End If
        Next neighbor
    Loop

    Set BfsOrder = order
End Function

Sub Main()
    Dim graph As Object
    Set graph = CreateObject("Scripting.Dictionary")

    Dim a As New Collection, b As New Collection, c As New Collection, d As New Collection
    a.Add "b": a.Add "c"
    b.Add "d"
    c.Add "d"

    graph.Add "a", a
    graph.Add "b", b
    graph.Add "c", c
    graph.Add "d", d

    Dim result As Collection
    Set result = BfsOrder(graph, "a")

    Dim item As Variant
    For Each item In result
        Debug.Print item
    Next item
End Sub
