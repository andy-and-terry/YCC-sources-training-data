Dim graphAdj As Object

Sub AddEdge(a As String, b As String)
    If Not graphAdj.Exists(a) Then graphAdj.Add a, New Collection
    If Not graphAdj.Exists(b) Then graphAdj.Add b, New Collection
    graphAdj(a).Add b
    graphAdj(b).Add a
End Sub

Sub BuildGraph()
    Set graphAdj = CreateObject("Scripting.Dictionary")
    AddEdge "1", "2"
    AddEdge "1", "3"
    AddEdge "2", "4"
    AddEdge "3", "4"
    AddEdge "4", "5"
End Sub

Function BFS(start As String) As Collection
    Dim visited As Object
    Set visited = CreateObject("Scripting.Dictionary")
    Dim queue As New Collection
    Dim order As New Collection

    queue.Add start
    visited.Add start, True

    Do While queue.Count > 0
        Dim node As String
        node = queue(1)
        queue.Remove 1
        order.Add node

        Dim neighbor As Variant
        For Each neighbor In graphAdj(node)
            If Not visited.Exists(neighbor) Then
                visited.Add neighbor, True
                queue.Add neighbor
            End If
        Next neighbor
    Loop

    Set BFS = order
End Function

Sub DFS(node As String, visited As Object, order As Collection)
    If visited.Exists(node) Then Exit Sub
    visited.Add node, True
    order.Add node

    Dim neighbor As Variant
    For Each neighbor In graphAdj(node)
        DFS neighbor, visited, order
    Next neighbor
End Sub

Sub Main()
    BuildGraph

    Dim bfsResult As Collection
    Set bfsResult = BFS("1")
    Dim item As Variant
    For Each item In bfsResult
        Debug.Print "BFS: " & item
    Next item

    Dim dfsVisited As Object
    Set dfsVisited = CreateObject("Scripting.Dictionary")
    Dim dfsOrder As New Collection
    DFS "1", dfsVisited, dfsOrder
    For Each item In dfsOrder
        Debug.Print "DFS: " & item
    Next item
End Sub
