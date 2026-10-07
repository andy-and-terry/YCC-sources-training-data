Sub Main()
    Debug.Print CInt(2.5); CInt(3.5); CInt(-2.5)
    Debug.Print Int(-2.7); Fix(-2.7)
    Debug.Print CLng("123") + 1
    Debug.Print CDbl("3.14") * 2
    Debug.Print CStr(42) & "!"
    Debug.Print CBool(0); CBool(5)
    Debug.Print Val("12abc"); Val("abc")
    Debug.Print CDate("2024-03-15")
    Debug.Print TypeName(CSng(1.5)); TypeName(1 / 2); TypeName(5 \ 2)
    Debug.Print IsNumeric("12e3"); IsNumeric("twelve")
    Debug.Print 7 \ 2; 7 Mod 2; 7 / 2
    Debug.Print Hex$(255); Oct$(8)
    Debug.Print CByte(200)
End Sub
