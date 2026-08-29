Function IsLeapYear(year As Long) As Boolean
    IsLeapYear = ((year Mod 4 = 0) And (year Mod 100 <> 0)) Or (year Mod 400 = 0)
End Function

Sub Main()
    Debug.Print IsLeapYear(2000)
    Debug.Print IsLeapYear(1900)
    Debug.Print IsLeapYear(2024)
End Sub
