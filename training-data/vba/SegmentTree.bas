Dim segTree(1 To 400) As Long
Dim segValues(1 To 100) As Long
Dim segN As Long

Sub BuildSegTree(node As Long, lo As Long, hi As Long)
    If lo = hi Then
        segTree(node) = segValues(lo)
        Exit Sub
    End If
    Dim mid As Long
    mid = (lo + hi) \ 2
    BuildSegTree node * 2, lo, mid
    BuildSegTree node * 2 + 1, mid + 1, hi
    segTree(node) = segTree(node * 2) + segTree(node * 2 + 1)
End Sub

Function QuerySegTree(node As Long, lo As Long, hi As Long, ql As Long, qr As Long) As Long
    If qr < lo Or hi < ql Then
        QuerySegTree = 0
        Exit Function
    End If
    If ql <= lo And hi <= qr Then
        QuerySegTree = segTree(node)
        Exit Function
    End If
    Dim mid As Long
    mid = (lo + hi) \ 2
    QuerySegTree = QuerySegTree(node * 2, lo, mid, ql, qr) + _
                   QuerySegTree(node * 2 + 1, mid + 1, hi, ql, qr)
End Function

Sub Main()
    segN = 6
    Dim values As Variant
    values = Array(1, 3, 5, 7, 9, 11)

    Dim i As Long
    For i = 1 To segN
        segValues(i) = values(i - 1)
    Next i

    BuildSegTree 1, 1, segN
    Debug.Print "sum(1,3) = " & QuerySegTree(1, 1, segN, 1, 3)
    Debug.Print "sum(2,5) = " & QuerySegTree(1, 1, segN, 2, 5)
End Sub
