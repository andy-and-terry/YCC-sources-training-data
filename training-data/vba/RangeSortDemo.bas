Sub SortRangeDescending(target As Range, keyColumn As Range)
    target.Sort Key1:=keyColumn, Order1:=xlDescending, Header:=xlYes
End Sub

Sub Main()
    SortRangeDescending Range("A1:B10"), Range("B1")
End Sub
