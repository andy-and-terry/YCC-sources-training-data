Function Describe(ByVal v As Variant) As String
    Select Case VarType(v)
        Case vbEmpty: Describe = "Empty"
        Case vbNull: Describe = "Null"
        Case vbInteger, vbLong: Describe = "Integer " & v
        Case vbDouble, vbSingle: Describe = "Floating " & v
        Case vbString: Describe = "String '" & v & "'"
        Case vbBoolean: Describe = "Boolean " & v
        Case vbDate: Describe = "Date " & Format$(v, "yyyy-mm-dd")
        Case Is >= vbArray: Describe = "Array of " & (UBound(v) - LBound(v) + 1)
        Case Else: Describe = TypeName(v)
    End Select
End Function

Sub Main()
    Debug.Print Describe(Empty)
    Debug.Print Describe(Null)
    Debug.Print Describe(42)
    Debug.Print Describe(3.14)
    Debug.Print Describe("text")
    Debug.Print Describe(True)
    Debug.Print Describe(DateSerial(2025, 6, 1))
    Debug.Print Describe(Array(1, 2, 3))
    Debug.Print IsNumeric("12.5"), IsNumeric("abc"), IsDate("2025-01-31")
End Sub
