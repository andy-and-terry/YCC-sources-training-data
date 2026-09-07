Dim heap(100) As Long
Dim heapSize As Long

Sub PQPush(value As Long)
    heapSize = heapSize + 1
    heap(heapSize) = value
    Dim i As Long, parent As Long, tmp As Long
    i = heapSize
    Do While i > 1
        parent = i \ 2
        If heap(parent) <= heap(i) Then Exit Do
        tmp = heap(parent)
        heap(parent) = heap(i)
        heap(i) = tmp
        i = parent
    Loop
End Sub

Function PQPop() As Long
    Dim top As Long
    top = heap(1)
    heap(1) = heap(heapSize)
    heapSize = heapSize - 1

    Dim i As Long, left As Long, right As Long, smallest As Long, tmp As Long
    i = 1
    Do While True
        left = 2 * i
        right = 2 * i + 1
        smallest = i
        If left <= heapSize And heap(left) < heap(smallest) Then smallest = left
        If right <= heapSize And heap(right) < heap(smallest) Then smallest = right
        If smallest = i Then Exit Do
        tmp = heap(smallest)
        heap(smallest) = heap(i)
        heap(i) = tmp
        i = smallest
    Loop
    PQPop = top
End Function

Sub Main()
    heapSize = 0
    PQPush 5
    PQPush 3
    PQPush 8
    PQPush 1
    PQPush 9
    PQPush 2

    Do While heapSize > 0
        Debug.Print PQPop()
    Loop
End Sub
